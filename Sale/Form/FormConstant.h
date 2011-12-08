//
//  FormConstant.h
//  Sale
//
//  Created by iterate on 11/21/11.
//  Copyright (c) 2011 Quadsolutions Co., Ltd. All rights reserved.
//

typedef enum  {
    ReadOnly = 1,
    Edit     = 2,
}FormMode;

typedef enum {
    LabelType        = 0,
    TextType         = 1, 
    CheckboxType     = 2,
    PickerType       = 3,
    TextAreaType     = 4,
    HeaderType       = 5,
    InfoType         = 6,
    PhotoType        = 7,
    EntryType        = 8,
    RequestType      = 9,
    InvoiceType      = 10,
    BackOrderType    = 11,
    DoublePickerType = 12,
    DoubleLabelType  = 13,
    DoubleHeaderType = 14,
    DoubleTextType   = 15,
}CellType;

typedef enum {
    HospitalFormType     = 0,
    BirthRateFormType    = 1,
    RotationFormType     = 2,
    SaleHistoryFormType  = 3,
}FormType;

#define kCellLabelTag        9980
#define kCellTitleTag        9981
#define kCellTextTag         9982
#define kCellCheckBoxTag     9983
#define kCellPickerLabelTag  9984
#define kCellPickerButtonTag 9985
#define kCellTextAreaTag     9986
#define kCellHeaderTag       9987
#define kCellInfoTag         9988
#define kCellPhotoTag        9989
#define kCellEntryTag        9990
#define kCellInvoiceTag      9991
#define kCellBackOrderTag    9992

#define kCellDateLabelTag        1000
#define kCellIndexLabelTag       1001
#define kCellProductLabelTag     1002
#define kCellQuantityLabelTag    1003
#define kCellFreeLabelTag        1004
#define kCellAmountLabelTag      1005
#define kCellReasonLabelTag      1006
#define kCellProductCodeLabelTag 1007
#define kCellPriceLabelTag       1008
#define kCellUnitLabelTag        1009

#define kCellFirstPickerButtonTag  2000
#define kCellSecondPickerButtonTag 2001

#define kCellFirstLabelTag  2002
#define kCellSecondLabelTag 2003

#define kCellFirstHeaderTag  2004
#define kCellSecondHeaderTag 2005

#define kCellFirstTextTag  2006
#define kCellSecondTextTag 2007

/* ----  Hospital Sale History ---- */

#define kCellInvoiceHeader   @"Date             No              Product                                 Qty        Free               Amount"
#define kCellBackOrderHeader @"Date             No              Product                          Qty       Free      Amount      Reason"

#define kCellEntryHeader @"No         Prod Code      Product      Qty      Free   Unit    Price    Amount"
@protocol FormProtocal <NSObject>

- (CellType)cellTypeForRow:(NSIndexPath *)indexPath;
- (NSString *)titleForRow:(NSIndexPath *)indexPath;

@end