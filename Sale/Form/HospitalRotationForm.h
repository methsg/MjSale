//
//  HospitalRotationForm.h
//  Sale
//
//  Created by iterate on 11/23/11.
//  Copyright (c) 2011 Quadsolutions Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FormConstant.h"

@class HospitalRotation;

@interface HospitalRotationForm : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    HospitalRotation *_hospitalRotation;
    
    UIToolbar *_toolbar;
    UIBarItem *_editButton;
    UIBarItem *_cancelButton;
    UIBarItem *_doneButton;
    
    UITableView *_tableView;
    
    UIView       *_pickerContainerView;
    UIPickerView *_pickerView;
    UIBarItem    *_pickerDoneButton;
    
    FormMode _mode;
}

@property (nonatomic, retain) HospitalRotation *hospitalRotation;

@property (nonatomic, retain) IBOutlet UIToolbar *toolBar;
@property (nonatomic, retain) IBOutlet UIBarItem *editButton;
@property (nonatomic, retain) IBOutlet UIBarItem *cancelButton;
@property (nonatomic, retain) IBOutlet UIBarItem *doneButton;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UIView *pickerContainerView;
@property (nonatomic, retain) IBOutlet UIPickerView *pickerView;
@property (nonatomic, retain) IBOutlet UIBarItem *pickerDoneButton;

@property (nonatomic, assign) FormMode mode;

- (IBAction)buttonPressed:(id)sender;

@end
