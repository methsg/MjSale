//
//  HospitalForm.m
//  Sale
//
//  Created by iterate on 11/22/11.
//  Copyright (c) 2011 Quadsolutions Co., Ltd. All rights reserved.
//

#import "FormConstant.h"
#import "FormCellGenerator.h"
#import "Hospital.h"
#import "HospitalForm.h"
#import "RequestCallForm.h"

@implementation HospitalForm

@synthesize hospital     = _hospital;
@synthesize toolBar      = _toolBar;
@synthesize visitButton  = _visitButton;
@synthesize editButton   = _editButton;
@synthesize cancelButton = _cancelButton;
@synthesize doneButton   = _doneButton;
@synthesize tableView    = _tableView;
@synthesize mode         = _mode;

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

- (void)setToolbarForCurrentMode
{
    NSMutableArray     *items = [[_toolBar.items mutableCopy] autorelease];
    
    if (_mode == ReadOnly) {
        
        if ([items indexOfObject:_cancelButton] != NSNotFound) {
            [items removeObject:_cancelButton];            
        }
        
        if ([items indexOfObject:_doneButton] != NSNotFound) {
            [items removeObject:_doneButton];
        }
        
        if ([items indexOfObject:_visitButton] == NSNotFound) {
            [items insertObject:_visitButton atIndex:3];
        }
        
        if ([items indexOfObject:_editButton] == NSNotFound) {
            [items insertObject:_editButton atIndex:4];
        }
        
        _toolBar.items = items;
        
    } else if (_mode == Edit) {
        
        if ([items indexOfObject:_editButton] != NSNotFound) {
            [items removeObject:_editButton];
        }
        
        if ([items indexOfObject:_visitButton] != NSNotFound) {
            [items removeObject:_visitButton];
        }        
        
        
        if ([items indexOfObject:_cancelButton] == NSNotFound) {            
            [items insertObject:_cancelButton atIndex:0];
        }
        
        if ([items indexOfObject:_doneButton] == NSNotFound) {
            [items insertObject:_doneButton atIndex:4];
        }
        
        _toolBar.items = items;
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
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
            
           
        } else if(button == _visitButton) {
         
            RequestCallForm *requestCallForm = [[RequestCallForm alloc] init];
            [self presentModalViewController:requestCallForm animated:TRUE];
            [requestCallForm release];
        } else if (button == _cancelButton) {
            
            _mode = ReadOnly;
            
            [_tableView reloadData];    
        } else if (button == _doneButton) {
            
            _mode = ReadOnly;
            
            [_tableView reloadData];
        }
        
        [self setToolbarForCurrentMode];
    }
}

- (NSString *)titleForRow:(NSIndexPath *)indexPath
{
    switch ([indexPath section]) {
        case 0:
            switch ([indexPath row]) {
                case 0:
                    return @"Hospital Name";
                default:
                    return @"Hospital Type";
            }
        case 1:
            switch ([indexPath row]) {
                case 0:
                    return @"Hospital Code";
                case 1:
                    return @"Customer Code 1";
                case 2:
                    return @"Customer Code 2";
                default:
                    return @"Active Order";
            }
        case 2:
            switch ([indexPath row]) {
                case 0:
                    return @"Address";
                case 1:
                    return @"Telephone";
                default:
                    return @"Fax";
            }
        case 3:
            switch ([indexPath row]) {
                case 0:
                    return @"Total Bed :";
                case 1:
                    return @"";
                case 2:
                    return @"";
                default:
                    return @"";
            }
        case 4:
            switch ([indexPath row]) {
                case 0:
                    return @"Note";
                case 1:
                    return @"Fee (Normal)";
                case 2:
                    return @"Fee (Caesarian)";
                default:
                    return @"";
            }
        case 5:
            switch ([indexPath row]) {
                case 0:
                    return @"Latitude";
                case 1:
                    return @"Longtitude";
            }
        default:
            return @"";
    }
}

- (NSString *)getInfoForIndexPath:(NSIndexPath *)indexPath
{
    switch ([indexPath section]) {
        case 0:
            switch ([indexPath row]) {
                case 0:
                    return _hospital.hospitalName;
                default:
                    return _hospital.hospitalType;
            }
        case 1:
            switch ([indexPath row]) {
                case 0:
                    return _hospital.hospitalCode;
                case 1:
                    return _hospital.firstCustomerCode;
                case 2:
                    return _hospital.secondCustomerCode;
                default:
                    return _hospital.activeOrder;
            }
        case 2:
            switch ([indexPath row]) {
                case 0:
                    return _hospital.address;
                case 1:
                    return _hospital.telephone;
                case 2:
                    return _hospital.fax;
            }
        case 3:
            switch ([indexPath row]) {
                case 0:
                    return _hospital.totalBed;
                case 1:
                    return [_hospital getBedInfo];
                case 2:
                    return @"No. Of HCP";
                case 3:
                    return [_hospital getHCPInfo];
                default:
                    return @"";
            }
        case 4:
            switch ([indexPath row]) {
                case 0:
                    return _hospital.note;
                case 1:
                    return _hospital.deliveryFeeNormal;
                case 2:
                    return _hospital.deliveryFeeCassarian;
                default:
                    return @"";
            }
        default:
            switch ([indexPath row]) {
                case 0:
                    return _hospital.latitude;
                case 1:
                    return _hospital.longtitude;
                default:
                    return @"";
            }
    }
}


- (CellType)cellTypeForRow:(NSIndexPath *)indexPath
{
    switch (_mode) {
        case ReadOnly:
            switch ([indexPath section]) {
                case 3:
                    switch ([indexPath row]) {
                        case 0:
                            return LabelType;
                        case 2:
                            return HeaderType;
                        default:
                            return InfoType;
                    }
                default:
                    return LabelType;
            }
        case Edit:
            switch ([indexPath section]) {
                case 0:
                    switch ([indexPath row]) {
                        case 0:
                            return LabelType;
                        case 1:
                            return PickerType;
                    }
                case 3:
                    switch ([indexPath row]) {
                        case 0:
                            return TextType;
                        case 2:
                            return HeaderType;
                        default:
                            return InfoType;
                    }
                case 4:
                    switch ([indexPath row]) {
                        case 0:
                            return LabelType;
                        default:
                            return TextType;   
                    }
                default:
                    return TextType;
            }
    }
    
}

#pragma mark - Table View Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 2;
        case 1:
            return 4;
        case 2:
            return 3;
        case 3:
            return 4;
        case 4:
            return 3;
        case 5:
            return 2;
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CellType cellType = [self cellTypeForRow:indexPath];
    
    
    NSString *cellIdentifier = [FormCellGenerator cellIdentifierCell:cellType];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!cell) {
        cell = [FormCellGenerator createCell:cellType withIdentifier:cellIdentifier];
        
        if (cellType == LabelType) {
            
            UILabel *valueLabel = (UILabel *)[cell viewWithTag:kCellLabelTag];
            valueLabel.frame = CGRectMake(valueLabel.frame.origin.x, valueLabel.frame.origin.y, 450 , valueLabel.frame.size.height);
            
        } else if (cellType == PickerType) {
            
            UIButton *button = (UIButton *)[cell viewWithTag:kCellPickerLabelTag];
            button.frame     = CGRectMake(button.frame.origin.x, button.frame.origin.y, 450 , button.frame.size.height);
            
        } else if (cellType == TextType) {
            
            UITextField *textField = (UITextField *)[cell viewWithTag:kCellTextTag];
            textField.frame        = CGRectMake(textField.frame.origin.x, textField.frame.origin.y, 450 , textField.frame.size.height);
            
        }
    }
    
    
    if (cellType == LabelType) {
        
        UILabel *titleLabel = (UILabel *)[cell viewWithTag:kCellTitleTag];
        titleLabel.text = [self titleForRow:indexPath];
        
        UILabel *valueLabel = (UILabel *)[cell viewWithTag:kCellLabelTag];
        valueLabel.text = [self getInfoForIndexPath:indexPath];
        
    } else if (cellType == PickerType) {
        
        UILabel *titleLabel = (UILabel *)[cell viewWithTag:kCellTitleTag];
        titleLabel.text = [self titleForRow:indexPath];
        
        UIButton *button = (UIButton *)[cell viewWithTag:kCellPickerButtonTag];
        [button setTitle:[self getInfoForIndexPath:indexPath]forState:UIControlStateNormal];
        
    } else if (cellType == TextType) {
        
        UILabel *titleLabel = (UILabel *)[cell viewWithTag:kCellTitleTag];
        titleLabel.text = [self titleForRow:indexPath];
        
        UITextField *textField = (UITextField *)[cell viewWithTag:kCellTextTag];
        textField.text = [self getInfoForIndexPath:indexPath];
        
    } else if (cellType == HeaderType) {
     
        UILabel *headerLabel = (UILabel *)[cell viewWithTag:kCellHeaderTag];
        headerLabel.text = [self getInfoForIndexPath:indexPath];
        
    } else if (cellType == InfoType) {
        
        UILabel *infoLabel = (UILabel *)[cell viewWithTag:kCellInfoTag];
        infoLabel.text   = [self getInfoForIndexPath:indexPath];
        
    }
    
    return cell;
}

@end
