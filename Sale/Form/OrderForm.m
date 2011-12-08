//
//  OrderForm.m
//  Sale
//
//  Created by iterate on 11/22/11.
//  Copyright (c) 2011 Quadsolutions Co., Ltd. All rights reserved.
//

#import "OrderForm.h"
#import "Order.h"
#import "FormCellGenerator.h"
#import "FormDataMapper.h"

@implementation OrderForm

@synthesize order               = _order;
@synthesize tableView           = _tableView;
@synthesize pickerContainerView = _pickerContainerView;
@synthesize pickerView          = _pickerView;
@synthesize pickerDoneButton    = _pickerDoneButton;
@synthesize cancelButton        = _cancelButton;
@synthesize saveButton          = _saveButton;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.modalPresentationStyle = UIModalPresentationFormSheet;
        _order = [[[FormDataMapper dataMapper] getOrderbycustomerCode:@"SomeID"] retain];

    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

#pragma mark - Form Protocal

- (CellType)cellTypeForRow:(NSIndexPath *)indexPath
{
    switch ([indexPath section]) {
        case 0:
            switch ([indexPath row]) {
                case 4:
                    return TextType;
                case 5:
                    return TextType;
                case 6:
                    return TextType;
                case 10:
                    return TextAreaType;
                case 11:
                    return TextAreaType;
                default:
                    return LabelType;
            }
        case 1:
            switch ([indexPath row]) {
                case 0:
                    return HeaderType;
                default:
                    return EntryType;
            }
        default:
            return LabelType;
    }
    
    return LabelType;
}

- (NSString *)titleForRow:(NSIndexPath *)indexPath
{
    switch ([indexPath section]) {
        case 0:
            switch ([indexPath row]) {
                case 0:
                    return @"Order No.";
                case 1:
                    return @"Customer Code";
                case 2:
                    return @"Category";
                case 3:
                    return @"Address";
                case 4:
                    return @"P.o.";
                case 5:
                    return @"Bill To";
                case 6:
                    return @"Ship To";
                case 7:
                    return @"Sale Qty.";
                case 8:
                    return @"FOC Qty.";
                case 9:
                    return @"Total Amount";
                case 10:
                    return @"First Remark";
                case 11:
                    return @"Second Remark";
            }
        default:
            return @"";
    }
}

- (NSString *)getInfoForRow:(NSIndexPath *)indexPath
{
    switch ([indexPath row]) {
        case 0:
            return _order.orderId;
        case 1:
            return _order.customerCode;
        case 2:
            return _order.category;
        case 3:
            return _order.address;
        case 4:
            return _order.poId;
        case 5:
            return _order.billTo;
        case 6:
            return _order.shipTo;
        case 7:
            return _order.saleQuality;
        case 8:
            return _order.focQuality;
        case 9:
            return _order.totalAmount;
        case 10:
            return _order.firstRemark;
        case 11:
            return _order.secondRemark;
        default:
            return NULL;
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
            return 12;
        case 1:
            if ([_order.entries count] > 0) {
                return [_order.entries count] + 1;
            } else {
                return 0;
            }
        default:
            return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = [FormCellGenerator cellIdentifierCell:[self cellTypeForRow:indexPath]];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [FormCellGenerator createCell:[self cellTypeForRow:indexPath] withIdentifier:cellIdentifier];
        
        if ([indexPath section] == 1 && [indexPath row] == 0) {
            UILabel *headerLabel = (UILabel *)[cell viewWithTag:kCellHeaderTag];
            headerLabel.font     = [UIFont boldSystemFontOfSize:13];
        }

    }
    
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:kCellTitleTag];
    titleLabel.text = [self titleForRow:indexPath];
    
    if ([indexPath section] == 1 && [indexPath row] == 0) {
        UILabel *headerLabel = (UILabel *)[cell viewWithTag:kCellHeaderTag];
        headerLabel.text = kCellEntryHeader;
    }
    
    if ([indexPath section] == 0) {
        
        UILabel     *label;
        UITextField *textField;
        UITextView  *textView;
        
        switch ([indexPath row]) {
            case 4:
                textField = (UITextField *)[cell viewWithTag:kCellTextTag];
                textField.text = [self getInfoForRow:indexPath];
                break;
            case 5:
                textField = (UITextField *)[cell viewWithTag:kCellTextTag];
                textField.text = [self getInfoForRow:indexPath];
                break;
            case 6:
                textField = (UITextField *)[cell viewWithTag:kCellTextTag];
                textField.text = [self getInfoForRow:indexPath];
                break;
            case 10:
                textView = (UITextView *)[cell viewWithTag:kCellTextAreaTag];
                textView.text = [self getInfoForRow:indexPath];
                break;
            case 11:
                textView = (UITextView *)[cell viewWithTag:kCellTextAreaTag];
                textView.text = [self getInfoForRow:indexPath];
                break;
            default:
                label = (UILabel *)[cell viewWithTag:kCellLabelTag];
                label.text  = [self getInfoForRow:indexPath];
                break;
        }
        
    } else {
        
    }
    
    
    switch ([indexPath section]) {
        case 0:
            switch ([indexPath row]) {
                case 1:
                    
                    break;
                    
                default:
                    break;
            }
            break;
            
        default:
            break;
    }
    
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch ([indexPath row]) {
        case 10:
            return 132;
        case 11:
            return 132;
        default:
            return 44;
    }
}

@end
