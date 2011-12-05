//
//  FormCellGenerator.h
//  Sale
//
//  Created by iterate on 11/21/11.
//  Copyright (c) 2011 Quadsolutions Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FormConstant.h"

@interface FormCellGenerator : NSObject


+ (UITableViewCell *)createCell:(CellType)type withIdentifier:(NSString *)identifier;
+ (NSString *)cellIdentifierCell:(CellType)type;

@end
