//
//  BootStrap.m
//  Sale
//
//  Created by iterate on 11/21/11.
//  Copyright (c) 2011 Quadsolutions Co., Ltd. All rights reserved.
//

#import "BootStrap.h"

@implementation BootStrap

static BootStrap *sharedBootStrap = nil;

+ (BootStrap *)sharedBootStrap
{
    
    @synchronized(self) {
        
        if (!sharedBootStrap) {
            sharedBootStrap = [[BootStrap alloc] init];
        }
    }
    
    return sharedBootStrap;
}

- (NSMutableDictionary *)sampleDictionary
{
    NSMutableDictionary *sampleDict = [NSMutableDictionary dictionary];
    
    [sampleDict setObject:@"Sample Value 1" forKey:@"Sample Key 1"];
    [sampleDict setObject:@"Sample Value 2" forKey:@"Sample Key 2"];
    [sampleDict setObject:@"Sample Value 3" forKey:@"Sample Key 3"];
    
    return sampleDict;
}

- (NSMutableArray *)sampleArray
{
    return [NSMutableArray arrayWithObjects:@"Sample 1", @"Sample 2", @"Sample 3", nil];
}

@end
