//
//  OrderForm.h
//  Sale
//
//  Created by iterate on 11/22/11.
//  Copyright (c) 2011 Quadsolutions Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderForm : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    UITableView  *_tableView;
    
    UIView       *_pickerContainerView;
    UIPickerView *_pickerView;
    UIBarItem    *_pickerDoneButton;
    
    UIBarItem    *_cancelButton;
    UIBarItem    *_saveButton;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;

@property (nonatomic, retain) IBOutlet UIView *pickerContainerView;
@property (nonatomic, retain) IBOutlet UIPickerView *pickerView;
@property (nonatomic, retain) IBOutlet UIBarItem *pickerDoneButton;

@property (nonatomic, retain) IBOutlet UIBarItem *cancelButton;
@property (nonatomic, retain) IBOutlet UIBarItem *saveButton;

- (IBAction)buttonPressed:(id)sender;

@end
