//
//  FormUtility.m
//  Sale
//
//  Created by iterate on 11/22/11.
//  Copyright (c) 2011 Quadsolutions Co., Ltd. All rights reserved.
//

#import "FormUtility.h"

@implementation FormUtility

+ (NSString *)displayDate:(NSDate *)date
{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd/yyyy"];
    
    NSString *stringFromDate = [formatter stringFromDate:date];
    [formatter release];
    
    return stringFromDate;
}

@end
