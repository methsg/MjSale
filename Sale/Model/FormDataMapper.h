//
//  FormDataMapper.h
//  Sale
//
//  Created by iterate on 12/5/11.
//  Copyright (c) 2011 Quadsolutions Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Order;

@interface FormDataMapper : NSObject

+ (FormDataMapper *)dataMapper;

- (NSMutableArray *)getAllProducts;
- (NSMutableArray *)getInvoicesWithHospitalId:(NSString *)hospitalId;
- (NSMutableArray *)getBackOrderWithHospitalId:(NSString *)hospitalId;
- (Order *)getOrderbycustomerCode:(NSString *)customerCode;

@end
