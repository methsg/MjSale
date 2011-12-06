//
//  CustomerComplaint.h
//  Sale
//
//  Created by iterate on 12/5/11.
//  Copyright (c) 2011 Quadsolutions Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomerComplaint : NSObject
{
    NSString *_documentNumber;
    NSString *_profileCode;
    NSString *_customerName;
    NSString *_topicType;
    NSString *_eventDetail;
    NSString *_material;
    NSString *_actionTake;
    
    NSData *_firstImageData;
    NSData *_secondImageData;
    NSData *_thirdImageData;
    NSData *_fourthImageData;
}

@property (nonatomic, retain) NSString *documentNumber;
@property (nonatomic, retain) NSString *profileCode;
@property (nonatomic, retain) NSString *customerName;
@property (nonatomic, retain) NSString *topicType;
@property (nonatomic, retain) NSString *eventDetail;
@property (nonatomic, retain) NSString *material;
@property (nonatomic, retain) NSString *actonTake;

@property (nonatomic, retain) NSData *firstImageData;
@property (nonatomic, retain) NSData *secondImageData;
@property (nonatomic, retain) NSData *thirdImageData;
@property (nonatomic, retain) NSData *fourthImageData;

@end
