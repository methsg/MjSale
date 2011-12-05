//
//  MainViewController.h
//  Sale
//
//  Created by iterate on 11/21/11.
//  Copyright (c) 2011 Quadsolutions Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
{
    UIButton *_visitButton;
}

@property (nonatomic, retain) IBOutlet UIButton *visitButton;

- (IBAction)buttonPressed:(id)sender;

@end
