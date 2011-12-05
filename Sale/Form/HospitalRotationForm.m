//
//  HospitalRotationForm.m
//  Sale
//
//  Created by iterate on 11/23/11.
//  Copyright (c) 2011 Quadsolutions Co., Ltd. All rights reserved.
//

#import "HospitalRotationForm.h"
#import "HospitalRotation.h"
#import "Hospital.h"
#import "ProductYear.h"
#import "FormCellGenerator.h"

@implementation HospitalRotationForm

@synthesize hospitalRotation    = _hospitalRotation;

@synthesize toolBar             = _toolbar;
@synthesize editButton          = _editButton;
@synthesize cancelButton        = _cancelButton;
@synthesize doneButton          = _doneButton;

@synthesize tableView           = _tableView;
@synthesize pickerContainerView = _pickerContainerView;
@synthesize pickerView          = _pickerView;
@synthesize pickerDoneButton    = _pickerDoneButton;

@synthesize mode                = _mode;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _hospitalRotation = [[HospitalRotation alloc] init];
        
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
        }
        
        
        [self setToolbarForCurrentMode];
    }
}


- (CellType)cellTypeForRow:(NSIndexPath *)indexPath
{
    switch (_mode) {
        case ReadOnly:
            switch ([indexPath section]) {
                case 0:
                    return PickerType;
                case 1:
                    return LabelType;
                default:
                    switch ([indexPath row]) {
                        case 0:
                            return HeaderType;
                        default:
                            return DoubleLabelType;
                    }
            }
        case Edit:
            switch ([indexPath section]) {
                case 0:
                    return LabelType;
                case 1:
                    return PickerType;
                default:
                    switch ([indexPath row]) {
                        case 0:
                            return HeaderType;
                        default:
                            return DoublePickerType;
                    }

            }
        default:
            return LabelType;
    }
}

- (NSString *)titleForRow:(NSIndexPath *)indexPath
{
    switch ([indexPath section]) {
        case 0:
            return @"Year";
        case 1:
            return @"Rotation Type";
        default:
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
}

- (NSString *)getInfoForIndexPath:(NSIndexPath *)indexPath
{

    ProductYear *productYear;
    
    switch ([indexPath section]) {
        case 2:
            productYear = _hospitalRotation.firstProduct;
            break;            
        default:
            productYear = _hospitalRotation.secondProduct;
            break;
    }
    
    
    switch ([indexPath section]) {
        case 0:
            return _hospitalRotation.year;
        case 1:
            return _hospitalRotation.rotationType;
        default:
            switch ([indexPath row]) {
                case 0:
                    return @"                                   Product Brand 1                          Product Brand 2"; 
                case 1:
                    return productYear.january;
                case 2:
                    return productYear.febuary;
                case 3:
                    return productYear.march;
                case 4:
                    return productYear.april;
                case 5:
                    return productYear.may;
                case 6:
                    return productYear.june;
                case 7:
                    return productYear.july;
                case 8:
                    return productYear.august;
                case 9:
                    return productYear.september;
                case 10:
                    return productYear.october;
                case 11:
                    return productYear.november;
                case 12:
                    return productYear.dececmber;
                default:
                    return @"";
            }
    }
}

- (NSString *)getProductYear:(ProductYear *)productYear atIndex:(NSIndexPath *)indexPath
{
    switch ([indexPath row]) {
        case 1:
            return productYear.january;
        case 2:
            return productYear.febuary;
        case 3:
            return productYear.march;
        case 4:
            return productYear.april;
        case 5:
            return productYear.may;
        case 6:
            return productYear.june;
        case 7:
            return productYear.july;
        case 8:
            return productYear.august;
        case 9:
            return productYear.september;
        case 10:
            return productYear.october;
        case 11:
            return productYear.november;
        case 12:
            return productYear.dececmber;
        default:
            return @"";
    }
}



#pragma mark - Table View Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
        case 1:
            return 1;
        default:
            return 13;
            
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CellType cellType = [self cellTypeForRow:indexPath];
    
    NSString *cellIdentifier = [FormCellGenerator cellIdentifierCell:cellType];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [FormCellGenerator createCell:cellType withIdentifier:cellIdentifier];
    }
    
    UILabel *titleLabel;
    
    switch (cellType) {
        case HeaderType:
            break;
        default:
            titleLabel = (UILabel *)[cell viewWithTag:kCellTitleTag];
            titleLabel.text = [self titleForRow:indexPath];
            break;
    }
    
    if (cellType == HeaderType) {
        
        UILabel *headerLabel = (UILabel *)[cell viewWithTag:kCellHeaderTag];
        headerLabel.text = [self getInfoForIndexPath:indexPath];
        
    } else if(cellType == LabelType) {
        
        UILabel *valueLabel = (UILabel *)[cell viewWithTag:kCellLabelTag];
        valueLabel.text = [self getInfoForIndexPath:indexPath];
        
    } else if(cellType == PickerType) {
        
        UITextField *textField = (UITextField *)[cell viewWithTag:kCellTextTag];
        textField.text = [self getInfoForIndexPath:indexPath];
        
    } else if(cellType == DoubleLabelType) {
        
        UILabel *firstLabel = (UILabel *)[cell viewWithTag:kCellFirstLabelTag];
        firstLabel.text = [self getProductYear:_hospitalRotation.firstProduct atIndex:indexPath];
        
        UILabel *secondLabel = (UILabel *)[cell viewWithTag:kCellSecondLabelTag];
        secondLabel.text = [self getProductYear:_hospitalRotation.secondProduct atIndex:indexPath];
        
    } else if(cellType == DoublePickerType) {
        
        UIButton *firstButton = (UIButton *)[cell viewWithTag:kCellFirstPickerButtonTag];
        [firstButton setTitle:[self getProductYear:_hospitalRotation.firstProduct atIndex:indexPath] forState:UIControlStateNormal];
        
        UIButton *secondButton = (UIButton *)[cell viewWithTag:kCellSecondPickerButtonTag];
        [secondButton setTitle:[self getProductYear:_hospitalRotation.secondProduct atIndex:indexPath] forState:UIControlStateNormal];
        
    }
    
    return cell;
}


@end
