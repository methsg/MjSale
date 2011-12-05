//
//  RequestCallForm.h
//  Sale
//
//  Created by iterate on 11/21/11.
//  Copyright (c) 2011 Quadsolutions Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RequestCall;

@interface RequestCallForm : UIViewController <UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource>
{
    RequestCall *_requestCall;
    
    UITableView *_tableView;
    
    UIView      *_pickerContainerView;
    UIPickerView *_pickerView;
    UIToolbar *_pickerToolbar;
    UIBarItem *_pickerDoneButton;
    
    UIBarItem *_cancelButton;
    UIBarItem *_saveButton;
    
    UIButton *_currentButton;
    NSIndexPath *_currentIndexPath;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;

@property (nonatomic, retain) IBOutlet UIView *pickerContainerView;
@property (nonatomic, retain) IBOutlet UIPickerView *pickerView;
@property (nonatomic, retain) IBOutlet UIToolbar *pickerToolbar;
@property (nonatomic, retain) IBOutlet UIBarItem *pickerDoneButton;

@property (nonatomic, retain) IBOutlet UIBarItem *cancelButton;
@property (nonatomic, retain) IBOutlet UIBarItem *saveButton;

- (IBAction)buttonPressed:(id)sender;

@end
