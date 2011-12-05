//
//  DetailViewController.h
//  Sale
//
//  Created by iterate on 11/22/11.
//  Copyright (c) 2011 Quadsolutions Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HospitalViewController;

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>
{
    HospitalViewController *_hospitalViewController;   
}

@end
