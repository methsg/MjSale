//
//  HospitalSalesHistoryForm.h
//  Sale
//
//  Created by iterate on 11/23/11.
//  Copyright (c) 2011 Quadsolutions Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Hospital;

@interface HospitalSalesHistoryForm : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    Hospital *_hospital;
    
    UITableView *_tableView;
    
    UIBarItem *_visitButton;
    
    NSMutableArray *_invoices;
    NSMutableArray *_backOrders;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UIBarItem *visitButton;

- (IBAction)buttonPressed:(id)sender;

@end
