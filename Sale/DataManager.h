//
//  DataManager.h
//  Sale
//
//  Created by iterate on 11/27/11.
//  Copyright (c) 2011 Quadsolutions Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject


+ (DataManager *)sharedManager;

- (NSMutableArray *)getAllProducts;
- (NSMutableArray *)getInvoicesWithHospitalId:(NSString *)hospitalId;
- (NSMutableArray *)getBackOrderWithHospitalId:(NSString *)hospitalId;

@end
