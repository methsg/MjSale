//
//  HospitalViewController.m
//  Sale
//
//  Created by iterate on 11/21/11.
//  Copyright (c) 2011 Quadsolutions Co., Ltd. All rights reserved.
//

#import "HospitalViewController.h"
#import "Hospital.h"
#import "HospitalForm.h"
#import "HospitalBirthRateForm.h"
#import "HospitalRotationForm.h"
#import "HospitalSalesHistoryForm.h"
#import "FormConstant.h"

@implementation HospitalViewController

@synthesize hospital         = _hospital;
@synthesize segmentedControl = _segmentedControl;
@synthesize contentView      = _contentView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.modalPresentationStyle = UIModalPresentationFormSheet;
        
        _hospital = [[Hospital alloc] init];
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
    
    if (!_hospitalForm) {
        _hospitalForm  = [[HospitalForm alloc] init];
        _hospitalForm.hospital = _hospital;
    }
    _currentViewController = _hospitalForm;
    
    [_contentView addSubview:_hospitalForm.view];
    
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

- (IBAction)valueChanged:(id)sender
{
    UIViewController *targetController;
    
    switch (_segmentedControl.selectedSegmentIndex) {
        case HospitalFormType:
            
            if (!_hospitalForm) {
                _hospitalForm = [[HospitalForm alloc] init];
                _hospitalForm.hospital = _hospital;
            }
            
            targetController = _hospitalForm;
            break;
        case BirthRateFormType:
            
            if(!_hospitalFirstRateForm) {
                _hospitalFirstRateForm = [[HospitalBirthRateForm alloc] init];
            }
            
            targetController = _hospitalFirstRateForm;
            break;
        case RotationFormType:
            
            if(!_hospitalRotationForm) {
                _hospitalRotationForm = [[HospitalRotationForm alloc] init];
            }
            
            targetController = _hospitalRotationForm;
            break;
        case SaleHistoryFormType:
            
            if(!_hospitalSalesHistoryForm) {
                _hospitalSalesHistoryForm = [[HospitalSalesHistoryForm alloc] init];
    
            }
            
            targetController = _hospitalSalesHistoryForm;
            break;
    }
    
    [_contentView addSubview:targetController.view];
    
    if ([_currentViewController.view superview]) {
        [_currentViewController.view removeFromSuperview];
    }
    
    _currentViewController = targetController;
    
}

@end
