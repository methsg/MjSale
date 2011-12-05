//
//  HospitalForm.h
//  Sale
//
//  Created by iterate on 11/22/11.
//  Copyright (c) 2011 Quadsolutions Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FormConstant.h"

@class Hospital;

@interface HospitalForm : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    Hospital *_hospital;
    
    UIToolbar *_toolBar;
    UIBarItem *_visitButton;
    UIBarItem *_editButton;
    UIBarItem *_cancelButton;
    UIBarItem *_doneButton;
    
    UITableView *_tableView;

    UIView      *_pickerContainerView;
    UIPickerView *_pickerView;
    UIBarItem *_pickerDoneButton;
    
    FormMode _mode;
}

@property (nonatomic, retain) Hospital *hospital;

@property (nonatomic, retain) IBOutlet UIToolbar *toolBar;
@property (nonatomic, retain) IBOutlet UIBarItem *visitButton;
@property (nonatomic, retain) IBOutlet UIBarItem *editButton;
@property (nonatomic, retain) IBOutlet UIBarItem *cancelButton;
@property (nonatomic, retain) IBOutlet UIBarItem *doneButton;

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, assign) FormMode mode;

- (IBAction)buttonPressed:(id)sender;

@end
