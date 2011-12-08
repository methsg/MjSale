//
//  FormDataMapper.m
//  Sale
//
//  Created by iterate on 12/5/11.
//  Copyright (c) 2011 Quadsolutions Co., Ltd. All rights reserved.
//

#import "FormDataMapper.h"
#import "Order.h"
#import "ProductEntry.h"
#import "Invoice.h"
#import "BackOrder.h"

@implementation FormDataMapper

static FormDataMapper *dataMapper = nil;

+ (FormDataMapper *)dataMapper
{
    @synchronized(self) {
        dataMapper = [[FormDataMapper alloc] init];
    }
    
    return dataMapper;
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
        [invoice release];
    }
    
    return invoices;
}

- (NSMutableArray *)getBackOrderWithHospitalId:(NSString *)hospitalId
{
    NSMutableArray *backOrders = [NSMutableArray array];
    
    for (int i = 0; i < 5; i++) {
        BackOrder *backOrder = [[BackOrder alloc] init];
        [backOrders addObject:backOrder];
        [backOrder release];
    }
    
    return backOrders;
}

- (NSMutableArray *)getAllOrderEntrieswithOrderNo:(NSString *)orderNo
{
    NSMutableArray *entries = [NSMutableArray array];
    
    for (int i = 0; i < 3; i++) {
        
        ProductEntry *entry = [[ProductEntry alloc] init];
        [entries addObject:entry];
        [entry release];
    }
    
    return entries;
}

- (Order *)getOrderbycustomerCode:(NSString *)customerCode
{
    Order *order = [[[Order alloc] init] autorelease];
    
    order.orderId      = @"ID";
    order.customerCode = @"Customer Code";
    order.category     = @"Category";
    order.address      = @"Address";
    order.poId         = @"P.o. Id";
    order.billTo       = @"Bill To";
    order.shipTo       = @"Ship To";
    order.saleQuality  = @"Sale Quality";
    order.focQuality   = @"FOC Quatlity";
    order.totalAmount  = @"total AMount";
    order.firstRemark  = @"First Remark";
    order.secondRemark = @"Second Remark";
    
    order.entries = [self getAllOrderEntrieswithOrderNo:@"Order Id"];
    
    return order;
}



@end
