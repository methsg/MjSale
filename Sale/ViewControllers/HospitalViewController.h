//
//  HospitalViewController.h
//  Sale
//
//  Created by iterate on 11/21/11.
//  Copyright (c) 2011 Quadsolutions Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Hospital;
@class HospitalForm;
@class HospitalBirthRateForm;
@class HospitalRotationForm;
@class HospitalSalesHistoryForm;


@interface HospitalViewController : UIViewController
{
    Hospital *_hospital;
    HospitalForm *_hospitalForm;
    HospitalBirthRateForm *_hospitalFirstRateForm;
    HospitalRotationForm *_hospitalRotationForm;
    HospitalSalesHistoryForm *_hospitalSalesHistoryForm;
    
    UIViewController *_currentViewController;
    
    UISegmentedControl *_segmentedControl;
    UIView *_contentView;
}

@property (nonatomic, retain) Hospital *hospital;

@property (nonatomic, retain) IBOutlet UISegmentedControl *segmentedControl;
@property (nonatomic, retain) IBOutlet UIView *contentView;

- (IBAction)valueChanged:(id)sender;

@end
