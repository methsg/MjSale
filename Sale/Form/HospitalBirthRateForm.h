//
//  HospitalBirthRateForm.h
//  Sale
//
//  Created by iterate on 11/23/11.
//  Copyright (c) 2011 Quadsolutions Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FormConstant.h"

@class HospitalBirthRate;

@interface HospitalBirthRateForm : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    HospitalBirthRate *_firstYear;
    HospitalBirthRate *_secondYear;
    
    UITableView *_tableView;
    
    UIToolbar *_toolbar;
    UIBarItem *_cancelButton;
    UIBarItem *_editButton;
    UIBarItem *_doneButton;
    
    FormMode _mode;
}

@property (nonatomic, retain) HospitalBirthRate *firstYear;
@property (nonatomic, retain) HospitalBirthRate *secondYear;

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;
@property (nonatomic, retain) IBOutlet UIBarItem *cancelButton;
@property (nonatomic, retain) IBOutlet UIBarItem *editButton;
@property (nonatomic, retain) IBOutlet UIBarItem *doneButton;

@property (nonatomic, assign) FormMode mode;

- (IBAction)buttonPressed:(id)sender;

@end
