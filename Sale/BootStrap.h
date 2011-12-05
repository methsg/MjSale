//
//  BootStrap.h
//  Sale
//
//  Created by iterate on 11/21/11.
//  Copyright (c) 2011 Quadsolutions Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface BootStrap : NSObject
{
    
}

+ (BootStrap *)sharedBootStrap;

- (NSMutableDictionary *)sampleDictionary;
- (NSMutableArray *)sampleArray;

@end
