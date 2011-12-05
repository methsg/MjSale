//
//  RequestCallForm.m
//  Sale
//
//  Created by iterate on 11/21/11.
//  Copyright (c) 2011 Quadsolutions Co., Ltd. All rights reserved.
//

#import "BootStrap.h"
#import "FormConstant.h"
#import "RequestCallForm.h"
#import "FormCellGenerator.h"
#import "RequestCall.h"
#import "CallObjective.h"

@implementation RequestCallForm

@synthesize tableView = _tableView;

@synthesize pickerContainerView = _pickerContainerView;
@synthesize pickerView          = _pickerView;
@synthesize pickerToolbar       = _pickerToolbar;
@synthesize pickerDoneButton    = _pickerDoneButton;
@synthesize cancelButton        = _cancelButton;
@synthesize saveButton          = _saveButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.modalPresentationStyle = UIModalPresentationFormSheet;
        _requestCall = [[RequestCall alloc] init];
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

- (NSString *)getRecordCall:(NSIndexPath *)indexPath
{
    switch ([indexPath row]) {
        case 0:
            return _requestCall.profileCode;
        case 1:
            return _requestCall.hospitalName;
        case 2:
            return _requestCall.grade;
        default:
            return _requestCall.note;
    }
}

- (NSString *)getObjective:(NSIndexPath *)indexPath
{
    CallObjective *callObjective;
    
    switch ([indexPath section]) {
        case 1:
            callObjective = _requestCall.firstObjective;
            break;
        case 2:
            callObjective = _requestCall.secondObjective;
            break;
        case 3:
            callObjective = _requestCall.thirdObjective;
            break;
    }
    
    switch ([indexPath row]) {
        case 0:
            return callObjective.objective;
            break;
        case 1:
            return callObjective.product;
            break;
        case 2:
            return callObjective.result;
            break;
        case 3:
            return callObjective.complaint;
            break;
        default:
            return callObjective.samples;
            break;
    }
}

- (void)setObjective:(NSIndexPath *)indexPath withValue:(NSString *)value
{
    CallObjective *callObjective;
    
    switch ([indexPath section]) {
        case 1:
            callObjective = _requestCall.firstObjective;
            break;
        case 2:
            callObjective = _requestCall.secondObjective;
            break;
        case 3:
            callObjective = _requestCall.thirdObjective;
            break;
    }
    
    switch ([indexPath row]) {
        case 0:
            callObjective.objective = value;
            break;
        case 1:
            callObjective.product   = value;
            break;
        case 2:
            callObjective.result    = value;
            break;
        case 3:
            callObjective.complaint = value;
            break;
        case 4:
            callObjective.samples   = value;
            break;
    }
}

- (NSString *)getSupervisor:(NSIndexPath *)indexPath
{
    switch ([indexPath row]) {
        case 0:
            return _requestCall.firstSupervisor;
        case 1:
            return _requestCall.secondSupervisor;
        default:
            return _requestCall.thirdSupervisor;
    }
}

- (void)setSupervisor:(NSIndexPath *)indexPath withValue:(NSString *)value
{
    switch ([indexPath row]) {
        case 0:
            _requestCall.firstSupervisor = value;
            break;
        case 1:
            _requestCall.secondSupervisor = value;
            break;
        default:
            _requestCall.thirdSupervisor = value;
            break;
    }
}


- (void)showPickerView
{   
    CGPoint startCenter  = CGPointMake(270, 750);
    CGPoint targetCenter = CGPointMake(270, 490);
    
    _pickerContainerView.center = startCenter;
    _pickerContainerView.hidden = FALSE;
    
    _tableView.frame = CGRectMake(0, 44, 540, 576);
    
        [UIView animateWithDuration:0.5 
                              delay:0
                            options:UIViewAnimationOptionAllowUserInteraction
                         animations:^{
                             _pickerContainerView.center = targetCenter;
                             _tableView.frame = CGRectMake(0, 0, 540, 360);

                         }
                         completion:^(BOOL finished) {
                             _tableView.scrollEnabled = FALSE;
                         }];
}

- (void)hidePickerView
{
    CGPoint startCenter  = CGPointMake(270, 490);
    CGPoint targetCenter = CGPointMake(270, 750);
    
    
    _pickerContainerView.center = startCenter;
    _currentButton.backgroundColor = [UIColor whiteColor];
    
    _tableView.frame = CGRectMake(0, 44, 540, 576);
    
    [UIView animateWithDuration:0.3 
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         _pickerContainerView.center = targetCenter;

                     }
                     completion:^(BOOL finished) { 
                         _pickerContainerView.hidden = TRUE;
                         _currentButton = nil;
                         _tableView.scrollEnabled = TRUE;
                     }];
    
}

- (IBAction)buttonPressed:(id)sender
{
    
    if ([sender isKindOfClass:[UIBarItem class]]) {

        UIBarItem *button = (UIBarItem *)sender;
        
        if (button == _saveButton) {
            [self dismissModalViewControllerAnimated:TRUE];
        } else if (button == _cancelButton) {
            [self dismissModalViewControllerAnimated:TRUE];
        } else {
            [self hidePickerView];            
        }
        
    } else {
        
        UIButton *button = (UIButton *)sender;
        
        if (_currentButton == nil)
        {
            [self showPickerView];
            
        } else {
            _currentButton.backgroundColor = [UIColor whiteColor];
            [_pickerView reloadComponent:0];
        }
        
        _currentButton = button;
        _currentButton.selected = TRUE;
        _currentButton.backgroundColor = [UIColor orangeColor];

        UITableViewCell *cell = (UITableViewCell *)[_currentButton superview];
        
        _currentIndexPath = [_tableView indexPathForCell:cell];
        [_tableView scrollToRowAtIndexPath:_currentIndexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];

    }
    
    
}

- (CellType)cellTypeForRow:(NSIndexPath *)indexPath
{
    switch ([indexPath section]) {
        case 0:
            return LabelType;
        default:
            
            
            if([indexPath row] == 4) {
             
                return TextType;
            }
            
            return PickerType;
    }
}

- (NSString *)titleForRow:(NSIndexPath *)indexPath
{
    NSString *title;
    
    switch ([indexPath section]) {
        case 0:
            switch ([indexPath row]) {
                case 0:
                    title = @"Profile Code";
                    break;
                case 1:
                    title = @"Hospital Name";
                    break;
                case 2:
                    title = @"Grade";
                    break;
                case 3:
                    title = @"Note";
                    break;
            }
            break;
        case 4:
            switch ([indexPath row]) {
                case 0:
                    title = @"Supervisor 1";
                    break;
                case 1:
                    title = @"Supervisor 2";
                    break;
                case 2:
                    title = @"Supervisor 3";
                    break;
            }
            break;
        default:
            switch ([indexPath row]) {
                case 0:
                    title = @"Objective";
                    break;
                case 1:
                    title = @"Product";
                    break;
                case 2:
                    title = @"Result";
                    break;
                case 3:
                    title = @"Complaint";
                    break;
                case 4:
                    title = @"Samples";
                    break;
            }
            break;
    }
    
    return title;
}

#pragma mark - Table View Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 4;
        case 4:
            return 3;
        default:
            return 5;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = [FormCellGenerator cellIdentifierCell:[self cellTypeForRow:indexPath]];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [FormCellGenerator createCell:[self cellTypeForRow:indexPath] withIdentifier:cellIdentifier];
        
        if ([cell viewWithTag:kCellPickerButtonTag]) {
  //          UIButton *button = (UIButton *)[cell viewWithTag:kCellPickerTag];
//            [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    //        [button setTitle:@"Picker Button" forState:UIControlStateNormal];
        }
        
    }
    
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:kCellTitleTag];
    titleLabel.text = [self titleForRow:indexPath];
    
    switch ([indexPath section]) {
        case 0:
            if ([cell viewWithTag:kCellLabelTag]) {
                UILabel *label = (UILabel *)[cell viewWithTag:kCellLabelTag];
                label.text = [self getRecordCall:indexPath];
            }
            break;
        case 4:
            if ([cell viewWithTag:kCellPickerButtonTag]) {
   //             UILabel *pickerLabel = (UILabel *)[cell viewWithTag:kCellPickerLabelTag];
     //           pickerLabel.text = [self getSupervisor:indexPath];
                UIButton *button = (UIButton *)[cell viewWithTag:kCellPickerButtonTag];
                [button setTitle:[self getSupervisor:indexPath] forState:UIControlStateNormal];
            }
            break;
        default:
            if ([cell viewWithTag:kCellPickerButtonTag]) {
//                UILabel *pickerLabel = (UILabel *)[cell viewWithTag:kCellPickerLabelTag];
  //              pickerLabel.text = [self getObjective:indexPath];
                UIButton *button = (UIButton *)[cell viewWithTag:kCellPickerButtonTag];
                [button setTitle:[self getObjective:indexPath] forState:UIControlStateNormal];
            }
            break;
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *title;

    switch (section) {
        case 0:
            title = @"Record Call";
            break;
        case 1:
            title = @"Objective 1";
            break;
        case 2:
            title = @"Objective 2";
            break;
        case 3:
            title = @"Objective 3";
            break;
        case 4:
            title = @"Supervisor";
            break;
    }
    
    return title;
}

#pragma mark - Picker View Delegate

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [[[BootStrap sharedBootStrap] sampleArray] count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [[[BootStrap sharedBootStrap] sampleArray] objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{    
    UITableViewCell *cell = (UITableViewCell *)[_currentButton superview];
    NSIndexPath *indexPath = [_tableView indexPathForCell:cell];
    NSString *value = [[[BootStrap sharedBootStrap] sampleArray] objectAtIndex:row];
    
    switch ([indexPath section]) {
        case 4:
            [self setSupervisor:indexPath withValue:value];
            break;
        default:
            [self setObjective:indexPath withValue:value];
            break;
    }
    
    [_currentButton setTitle:value forState:UIControlStateNormal];
}

@end
