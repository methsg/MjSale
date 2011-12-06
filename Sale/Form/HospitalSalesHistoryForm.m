//
//  HospitalSalesHistoryForm.m
//  Sale
//
//  Created by iterate on 11/23/11.
//  Copyright (c) 2011 Quadsolutions Co., Ltd. All rights reserved.
//

#import "FormConstant.h"
#import "FormCellGenerator.h"
#import "FormUtility.h"
#import "FormDataMapper.h"
#import "HospitalSalesHistoryForm.h"

#import "Hospital.h"
#import "Invoice.h"
#import "BackOrder.h"

@implementation HospitalSalesHistoryForm

@synthesize tableView = _tableView;

@synthesize visitButton = _visitButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)loadDataFromDataManger
{
    if (_invoices) {
        [_invoices release];
        _invoices = nil; 
    }
    
    if (_backOrders) {
        [_backOrders release];
        _backOrders = nil;
    }
    
    _invoices   = [[[FormDataMapper dataMapper] getInvoicesWithHospitalId:_hospital.hospitalCode] retain];
    _backOrders = [[[FormDataMapper dataMapper] getBackOrderWithHospitalId:_hospital.hospitalCode] retain];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self loadDataFromDataManger];
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

- (IBAction)buttonPressed:(id)sender
{
    
}

- (CellType)cellTypeForRow:(NSIndexPath *)indexPath
{
    
    if([indexPath row] == 0) {
        return HeaderType;
    }
    
    switch ([indexPath section]) {
        case 0:
            return InvoiceType;
        case 1:
            return BackOrderType;
        default:
            return LabelType;
    }
}

#pragma mark - Table View Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return [_invoices count] + 1;
        case 1:
            return [_backOrders count] + 1;
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = [FormCellGenerator cellIdentifierCell:[self cellTypeForRow:indexPath]];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!cell) {
        cell = [FormCellGenerator createCell:[self cellTypeForRow:indexPath] withIdentifier:cellIdentifier];
        
        if ([cell viewWithTag:kCellHeaderTag]) {
            UILabel *headerLabel = (UILabel *)[cell viewWithTag:kCellHeaderTag];
            headerLabel.frame = CGRectMake(55, 10, 600, 24);
        }
        
    }
    
    if ([indexPath row] == 0) {
        UILabel *headerLabel = (UILabel *)[cell viewWithTag:kCellHeaderTag];
        
        switch ([indexPath section]) {
            case 0:
                headerLabel.text = kCellInvoiceHeader;
                break;
            case 1:
                headerLabel.text = kCellBackOrderHeader;
                break;
        } 
    } else {
        UILabel *dateLabel    = (UILabel *)[cell viewWithTag:kCellDateLabelTag];
        UILabel *indexLabel   = (UILabel *)[cell viewWithTag:kCellIndexLabelTag];
        UILabel *productLabel = (UILabel *)[cell viewWithTag:kCellProductLabelTag];
        UILabel *quntityLabel = (UILabel *)[cell viewWithTag:kCellQuantityLabelTag];
        UILabel *freeLabel    = (UILabel *)[cell viewWithTag:kCellFreeLabelTag];
        UILabel *amountLabel  = (UILabel *)[cell viewWithTag:kCellAmountLabelTag];
        
        if([indexPath section] == 0) {
            
            Invoice *invoice = [_invoices objectAtIndex:[indexPath row] - 1];
            
            dateLabel.text    = [FormUtility displayDate:invoice.date];
            indexLabel.text   = invoice.invoiceId;
            productLabel.text = invoice.product;
            quntityLabel.text = invoice.quantity;
            freeLabel.text    = invoice.free;
            amountLabel.text  = invoice.amount;
        } else {
         
            UILabel *reasonLabel = (UILabel *)[cell viewWithTag:kCellReasonLabelTag];
            
            BackOrder *backOrder = [_backOrders objectAtIndex:[indexPath row] -1];
            
            dateLabel.text    = [FormUtility displayDate:backOrder.date];
            indexLabel.text   = backOrder.orderId;
            productLabel.text = backOrder.product;
            quntityLabel.text = backOrder.quantity;
            freeLabel.text    = backOrder.free;
            amountLabel.text  = backOrder.amount;
            reasonLabel.text  = backOrder.reason;
            
        }
        
    }
    
    
    return cell;
}

@end
