//
//  DataManager.m
//  Sale
//
//  Created by iterate on 11/27/11.
//  Copyright (c) 2011 Quadsolutions Co., Ltd. All rights reserved.
//

#import "DataManager.h"
#import "Invoice.h"
#import "BackOrder.h"

@implementation DataManager

static DataManager *sharedManager = nil;

+ (DataManager *)sharedManager
{
    @synchronized(self) {
        sharedManager = [[DataManager alloc] init];
    }
    return sharedManager;
}


- (NSMutableArray *)getAllProducts
{
    NSMutableArray *products = [NSMutableArray array];
    
    [products addObject:@"Product 1"];
    [products addObject:@"Product 2"];
    [products addObject:@"Product 3"];
    [products addObject:@"Product 4"];
    [products addObject:@"Product 5"];
    [products addObject:@"Product 6"];
    [products addObject:@"Product 7"];
    
    return products;
}

- (NSMutableArray *)getInvoicesWithHospitalId:(NSString *)hospitalId
{
    NSMutableArray *invoices = [NSMutableArray array];
    
    for (int i = 0; i < 5; i++){
        Invoice *invoice = [[Invoice alloc] init];
        [invoices addObject:invoice];
    }
    
    return invoices;
}

- (NSMutableArray *)getBackOrderWithHospitalId:(NSString *)hospitalId
{
    NSMutableArray *backOrders = [NSMutableArray array];
    
    for (int i = 0; i < 5; i++) {
        BackOrder *backOrder = [[BackOrder alloc] init];
        [backOrders addObject:backOrder];
    }
    
    return backOrders;
}

@end
