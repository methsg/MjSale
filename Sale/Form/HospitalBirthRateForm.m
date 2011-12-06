//
//  HospitalBirthRateForm.m
//  Sale
//
//  Created by iterate on 11/23/11.
//  Copyright (c) 2011 Quadsolutions Co., Ltd. All rights reserved.
//

#import "HospitalBirthRateForm.h"
#import "HospitalBirthRate.h"
#import "FormCellGenerator.h"

@implementation HospitalBirthRateForm

@synthesize firstYear    = _firstYear;
@synthesize secondYear   = _secondYear;
@synthesize tableView    = _tableView;
@synthesize toolbar      = _toolbar;
@synthesize cancelButton = _cancelButton;
@synthesize editButton   = _editButton;
@synthesize doneButton   = _doneButton;
@synthesize mode         = _mode;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _firstYear  = [[HospitalBirthRate alloc] init];
        _secondYear = [[HospitalBirthRate alloc] init];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)setToolbarForCurrentMode
{
    
    NSMutableArray *items = [[_toolbar.items mutableCopy] autorelease];
    
    if (_mode == ReadOnly) {
        
        if ([items indexOfObject:_cancelButton] != NSNotFound) {
            [items removeObject:_cancelButton];
        }
        
        if ([items indexOfObject:_doneButton] != NSNotFound) {
            [items removeObject:_doneButton];
        }
        
        if ([items indexOfObject:_editButton] == NSNotFound) {
            [items insertObject:_editButton atIndex:3];
        }
        
        
        
    } else {
        
        if ([items indexOfObject:_editButton] != NSNotFound) {
            [items removeObject:_editButton];
        }
        
        
        if ([items indexOfObject:_cancelButton] == NSNotFound) {
            [items insertObject:_cancelButton atIndex:0];
        }
        
        if ([items indexOfObject:_doneButton] == NSNotFound) {
            [items addObject:_doneButton];
        }
        
        
    }
    
    _toolbar.items = items;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _mode = ReadOnly;
    
    [self setToolbarForCurrentMode];
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

- (void)saveForm {
 

    
}

- (IBAction)buttonPressed:(id)sender
{
    if ([sender isKindOfClass:[UIBarItem class]]) {
        UIBarItem *button = (UIBarItem *)sender;
        
        if(button == _editButton) {
            _mode = Edit;
            [_tableView reloadData];
        } else if (button == _cancelButton) {
         
            _mode = ReadOnly;
            
            [_tableView reloadData];
        } else if (button == _doneButton) {
            
        }
    }
    
    [self setToolbarForCurrentMode];
}

- (CellType)cellTypeForRow:(NSIndexPath *)indexPath
{
    
    if([indexPath row] == 0) {
        return DoubleHeaderType;   
    }
    
    switch (_mode) {
        case ReadOnly:
            return DoubleLabelType;
        case Edit:
            return DoubleTextType;
    }
    
}

- (NSString *)titleForRow:(NSIndexPath *)indexPath
{
    switch ([indexPath row]) {
        case 1:
            return @"January";
        case 2:
            return @"Febuary";
        case 3:
            return @"March";
        case 4:
            return @"April";
        case 5:
            return @"May";
        case 6:
            return @"June";
        case 7:
            return @"July";
        case 8:
            return @"August";
        case 9:
            return @"September";
        case 10:
            return @"October";
        case 11:
            return @"November";
        case 12:
            return @"December";
        default:
            return @"";
    }
}

- (NSString *)getHospitalBirthRate:(HospitalBirthRate *)hospitalBirthRate atIndex:(NSIndexPath *)indexPath
{
    switch ([indexPath row]) {
        case 1:
            return hospitalBirthRate.january;
        case 2:
            return hospitalBirthRate.febuary;
        case 3:
            return hospitalBirthRate.march;
        case 4:
            return hospitalBirthRate.april;
        case 5:
            return hospitalBirthRate.may;
        case 6:
            return hospitalBirthRate.june;
        case 7:
            return hospitalBirthRate.july;
        case 8:
            return hospitalBirthRate.august;
        case 9:
            return hospitalBirthRate.september;
        case 10:
            return hospitalBirthRate.october;
        case 11:
            return hospitalBirthRate.november;
        case 12:
            return hospitalBirthRate.dececmber;
        default:
            return @"";
    }
    
    
}

#pragma mark - Table View Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 13;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CellType cellType = [self cellTypeForRow:indexPath];
    
    NSString *cellIdentifier = [FormCellGenerator cellIdentifierCell:cellType];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [FormCellGenerator createCell:cellType withIdentifier:cellIdentifier];
        
        if (cellType == DoubleTextType) {
         

        }
        
    }
    
    
    if(cellType == DoubleHeaderType) {
     
        UILabel *firstHeader = (UILabel *)[cell viewWithTag:kCellFirstHeaderTag];
        firstHeader.text = _firstYear.year;
        
        UILabel *secondHeader = (UILabel *)[cell viewWithTag:kCellSecondHeaderTag];
        secondHeader.text = _secondYear.year;
        
    }  else if(cellType == DoubleLabelType) {
        
        UILabel *titleLabel = (UILabel *)[cell viewWithTag:kCellTitleTag];
        titleLabel.text = [self titleForRow:indexPath];
        
        UILabel *firstLabel = (UILabel *)[cell viewWithTag:kCellFirstLabelTag];
        firstLabel.text = [self getHospitalBirthRate:_firstYear atIndex:indexPath];
        
        UILabel *secondLabel = (UILabel *)[cell viewWithTag:kCellSecondLabelTag];
        secondLabel.text = [self getHospitalBirthRate:_secondYear atIndex:indexPath];
        
    } else if(cellType == DoubleTextType) {
       
        UILabel *titleLabel = (UILabel *)[cell viewWithTag:kCellTitleTag];
        titleLabel.text = [self titleForRow:indexPath];
        
        UITextField *firstTextField = (UITextField *)[cell viewWithTag:kCellFirstTextTag];
        firstTextField.text = [self getHospitalBirthRate:_firstYear atIndex:indexPath];
        
        UITextField *secondTextField = (UITextField *)[cell viewWithTag:kCellSecondTextTag];
        secondTextField.text = [self getHospitalBirthRate:_secondYear atIndex:indexPath];
        
    }
    
    return cell;
}

- (void)textFielddidEnter {
 
    NSIndexPath *indexPath;
    
    UITextField *txtF;
    
    UITableViewCell *cell = (UITableViewCell *)[txtF superview];
    
    
    indexPath = [_tableView indexPathForCell:cell];
    [_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:TRUE];
    
    
    
    
}


@end
