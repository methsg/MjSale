//
//  FormCellGenerator.m
//  Sale
//
//  Created by iterate on 11/21/11.
//  Copyright (c) 2011 Quadsolutions Co., Ltd. All rights reserved.
//

#import "FormCellGenerator.h"

@interface FormCellGenerator ()

@end

@implementation FormCellGenerator


+ (UILabel *)createTitleLabel
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(45, 10, 135, 24)];
    
    label.tag             = kCellTitleTag;
    label.textAlignment   = UITextAlignmentRight;
    label.textColor       = [UIColor blackColor];
    label.backgroundColor = [UIColor clearColor];
    label.font            = [UIFont boldSystemFontOfSize:15];
    
    return label;
}

+ (void)customizeLabelCell:(UITableViewCell *)cell
{
    cell.tag = LabelType;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.autoresizesSubviews = TRUE;
    
    UILabel *titleLabel = [self createTitleLabel];
    
    UILabel *valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(190, 10, 290 , 24)];
    valueLabel.tag = kCellLabelTag;
    valueLabel.textAlignment = UITextAlignmentLeft;
    valueLabel.text = @"Label Type";
    valueLabel.font = [UIFont systemFontOfSize:13];
    
    [cell addSubview:titleLabel];
    [cell addSubview:valueLabel];
    
    [titleLabel release];
    [valueLabel release];
    
}

+ (void)customizeTextCell:(UITableViewCell *)cell
{
    cell.tag = TextType;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UILabel *titleLabel = [self createTitleLabel];
    
    UITextField *textField    = [[UITextField alloc] initWithFrame:CGRectMake(190, 10, 290, 24)];
    textField.tag             = kCellTextTag;
    textField.placeholder     = @"Type Infomation Here";
    textField.font            = [UIFont systemFontOfSize:13];
    textField.borderStyle     = UITextBorderStyleNone;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [cell addSubview:titleLabel];    
    [cell addSubview:textField];
    
    [titleLabel release];
    [textField release];
    
}

+ (void)customizeCheckboxCell:(UITableViewCell *)cell
{
    cell.tag = CheckboxType;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UILabel *titleLabel = [self createTitleLabel];
    
    UISwitch *switchCompopnent = [[UISwitch alloc] init];
    switchCompopnent.frame = CGRectMake(190, 10, 60, 24);
    
    [cell addSubview:titleLabel];
    [cell addSubview:switchCompopnent];
    
    [titleLabel release];
    [switchCompopnent release];
}

+ (void)customeizePickerCell:(UITableViewCell *)cell
{
    cell.tag = PickerType;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
    
    UILabel *titleLabel = [self createTitleLabel];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.tag   = kCellPickerButtonTag;
    button.frame = CGRectMake(200, 4, 300, 36);
    button.backgroundColor = [UIColor clearColor];
    button.titleLabel.font = [UIFont systemFontOfSize:11];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    
    [button setTitle:@"Sample Product Brand 1" forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"dropdown_small.png"] forState:UIControlStateNormal];
    
    [cell addSubview:titleLabel];
    [cell addSubview:button];
    
    [titleLabel release];
}

+ (void)customizeTextAreaCell:(UITableViewCell *)cell
{
    UILabel *titleLabel = [self createTitleLabel];
    
    cell.tag = TextAreaType;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(200, 8, 300, 116)];
    textView.tag         = kCellTextAreaTag;
//    textView.backgroundColor = [UIColor clearColor];
    
    [cell addSubview:titleLabel];
    [cell addSubview:textView];
    
    [titleLabel release];
    [textView release];
}

+ (void)customizeHeaderCell:(UITableViewCell *)cell
{
    cell.backgroundColor = [UIColor lightGrayColor];
    cell.selectionStyle  = UITableViewCellSelectionStyleNone;
    
    UILabel *headerLabel        = [[UILabel alloc] initWithFrame:CGRectMake(55, 10, 500, 24)];
    headerLabel.tag             = kCellHeaderTag;
    headerLabel.font            = [UIFont boldSystemFontOfSize:15];
    headerLabel.backgroundColor = [UIColor clearColor];
    
    [cell addSubview:headerLabel];
    
    [headerLabel release];
}

+ (void)customizeInfoCell:(UITableViewCell *)cell
{
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UILabel *infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(55, 10, 500 , 24)];
    infoLabel.tag = kCellInfoTag;
    infoLabel.textAlignment = UITextAlignmentLeft;
    infoLabel.font = [UIFont systemFontOfSize:12];
    
    [cell addSubview:infoLabel];
}

+ (void)customizeEntryCell:(UITableViewCell *)cell
{
    UILabel *indexLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, 10, 50, 24)];
    indexLabel.tag      = kCellIndexLabelTag;
    indexLabel.textAlignment = UITextAlignmentLeft;
    indexLabel.font          = [UIFont systemFontOfSize:11];
    
    UILabel *productCodeLabel = [[UILabel alloc] initWithFrame:CGRectMake(105, 10, 75, 24)];
    productCodeLabel.tag      = kCellProductCodeLabelTag;
    productCodeLabel.textAlignment = UITextAlignmentLeft;
    productCodeLabel.font          = [UIFont systemFontOfSize:11];
    productCodeLabel.backgroundColor = [UIColor blackColor];
    
    UILabel *productName = [[UILabel alloc] initWithFrame:CGRectMake(185, 10, 75, 24)];
    productName.tag      = kCellProductLabelTag;
    productName.textAlignment = UITextAlignmentLeft;
    productName.font          = [UIFont systemFontOfSize:11];
    productName.backgroundColor = [UIColor blackColor];
    
    UILabel *quantityLabel = [[UILabel alloc] initWithFrame:CGRectMake(265, 10, 35, 24)];
    quantityLabel.tag      = kCellQuantityLabelTag;
    quantityLabel.textAlignment = UITextAlignmentLeft;
    quantityLabel.font          = [UIFont systemFontOfSize:11];
    
    UILabel *freeLabel = [[UILabel alloc] initWithFrame:CGRectMake(305, 10, 30, 24)];
    freeLabel.tag      = kCellFreeLabelTag;
    freeLabel.textAlignment = UITextAlignmentLeft;
    freeLabel.font          = [UIFont systemFontOfSize:11];
    
    UILabel *unitLabel = [[UILabel alloc] initWithFrame:CGRectMake(340, 10, 40, 24)];
    unitLabel.tag      = kCellUnitLabelTag;
    unitLabel.textAlignment = UITextAlignmentLeft;
    unitLabel.font          = [UIFont systemFontOfSize:11];
    
    UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(385, 10, 40, 24)];
    priceLabel.tag      = kCellPriceLabelTag;
    priceLabel.textAlignment = UITextAlignmentLeft;
    priceLabel.font          = [UIFont systemFontOfSize:11];
    
    UILabel *amountLabel = [[UILabel alloc] initWithFrame:CGRectMake(430, 10, 60, 24)];
    amountLabel.tag      = kCellAmountLabelTag;
    amountLabel.textAlignment = UITextAlignmentLeft;
    amountLabel.font          = [UIFont systemFontOfSize:11];
    
    [cell addSubview:indexLabel];
    [cell addSubview:productCodeLabel];
    [cell addSubview:productName];
    [cell addSubview:quantityLabel];
    [cell addSubview:freeLabel];
    [cell addSubview:unitLabel];
    [cell addSubview:priceLabel];
    [cell addSubview:amountLabel];
    
    [indexLabel release];
    [productCodeLabel release];
    [productName release];
    [quantityLabel release];
    [freeLabel release];
    [unitLabel release];
    [priceLabel release];
    [amountLabel release];
}

+ (void)customizeRequestCell:(UITableViewCell *)cell
{
    UILabel *indexLabel = [[UILabel alloc] initWithFrame:CGRectMake(55, 10, 50, 24)];
    indexLabel.tag      = kCellIndexLabelTag;
    indexLabel.textAlignment = UITextAlignmentLeft;
    indexLabel.font          = [UIFont systemFontOfSize:13];
    
    UILabel *productCodeLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 10, 80, 24)];
    productCodeLabel.tag      = kCellProductCodeLabelTag;
    productCodeLabel.textAlignment = UITextAlignmentLeft;
    productCodeLabel.font          = [UIFont systemFontOfSize:13];
    
    UILabel *productName = [[UILabel alloc] initWithFrame:CGRectMake(220, 10, 140, 24)];
    productName.tag      = kCellProductLabelTag;
    productName.textAlignment = UITextAlignmentLeft;
    productName.font          = [UIFont systemFontOfSize:13];
    
    UILabel *quantityLabel = [[UILabel alloc] initWithFrame:CGRectMake(370, 10, 40, 24)];
    quantityLabel.tag      = kCellQuantityLabelTag;
    quantityLabel.textAlignment = UITextAlignmentLeft;
    quantityLabel.font          = [UIFont systemFontOfSize:13];
    
    UILabel *unitLabel = [[UILabel alloc] initWithFrame:CGRectMake(430, 10, 40, 24)];
    unitLabel.tag      = kCellUnitLabelTag;
    unitLabel.textAlignment = UITextAlignmentLeft;
    unitLabel.font          = [UIFont systemFontOfSize:13];
    
    UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(485, 10, 40, 24)];
    priceLabel.tag      = kCellPriceLabelTag;
    priceLabel.textAlignment = UITextAlignmentLeft;
    priceLabel.font          = [UIFont systemFontOfSize:13];
    
    UILabel *amountLabel = [[UILabel alloc] initWithFrame:CGRectMake(555, 10, 60, 24)];
    amountLabel.tag      = kCellAmountLabelTag;
    amountLabel.textAlignment = UITextAlignmentLeft;
    amountLabel.font          = [UIFont systemFontOfSize:13];
    
    [cell addSubview:indexLabel];
    [cell addSubview:productCodeLabel];
    [cell addSubview:productName];
    [cell addSubview:quantityLabel];
    [cell addSubview:unitLabel];
    [cell addSubview:priceLabel];
    [cell addSubview:amountLabel];
    
    [indexLabel release];
    [productCodeLabel release];
    [productName release];
    [quantityLabel release];
    [unitLabel release];
    [priceLabel release];
    [amountLabel release];
}

+ (void)customizeInvoiceCell:(UITableViewCell *)cell
{
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UILabel *dateLabel      = [[UILabel alloc] initWithFrame:CGRectMake(55, 10, 75, 24)];
    dateLabel.tag           = kCellDateLabelTag;
    dateLabel.textAlignment = UITextAlignmentLeft;
    dateLabel.font          = [UIFont systemFontOfSize:13];
                           
    UILabel *indexLabel      = [[UILabel alloc] initWithFrame:CGRectMake(140, 10, 75, 24)];
    indexLabel.tag           = kCellIndexLabelTag;
    indexLabel.textAlignment = UITextAlignmentLeft;
    indexLabel.font          = [UIFont systemFontOfSize:13];
    
    UILabel *productLabel      = [[UILabel alloc] initWithFrame:CGRectMake(220, 10, 165, 24)];
    productLabel.tag           = kCellProductLabelTag;
    productLabel.textAlignment = UITextAlignmentLeft;
    productLabel.font          = [UIFont systemFontOfSize:13];
    
    UILabel *quantityLabel      = [[UILabel alloc] initWithFrame:CGRectMake(410, 10, 30, 24)];
    quantityLabel.tag           = kCellQuantityLabelTag;
    quantityLabel.textAlignment = UITextAlignmentLeft;
    quantityLabel.font          = [UIFont systemFontOfSize:13];
    
    UILabel *freeLabel      = [[UILabel alloc] initWithFrame:CGRectMake(470, 10, 30, 24)];
    freeLabel.tag           = kCellFreeLabelTag;
    freeLabel.textAlignment = UITextAlignmentLeft;
    freeLabel.font          = [UIFont systemFontOfSize:13];
    
    UILabel *amountLabel      = [[UILabel alloc] initWithFrame:CGRectMake(570, 10, 65, 24)];
    amountLabel.tag           = kCellAmountLabelTag;
    amountLabel.textAlignment = UITextAlignmentLeft;
    amountLabel.font          = [UIFont systemFontOfSize:13];
    
    [cell addSubview:dateLabel];
    [cell addSubview:indexLabel];
    [cell addSubview:productLabel];
    [cell addSubview:quantityLabel];
    [cell addSubview:freeLabel];
    [cell addSubview:amountLabel];
    
    [dateLabel release];
    [indexLabel release];
    [productLabel release];
    [quantityLabel release];
    [freeLabel release];
    [amountLabel release];
}

+ (void)customizeBackOrderCell:(UITableViewCell *)cell
{
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UILabel *dateLabel      = [[UILabel alloc] initWithFrame:CGRectMake(55, 10, 75, 24)];
    dateLabel.tag           = kCellDateLabelTag;
    dateLabel.textAlignment = UITextAlignmentLeft;
    dateLabel.font          = [UIFont systemFontOfSize:13];
    
    UILabel *indexLabel      = [[UILabel alloc] initWithFrame:CGRectMake(140, 10, 75, 24)];
    indexLabel.tag           = kCellIndexLabelTag;
    indexLabel.textAlignment = UITextAlignmentLeft;
    indexLabel.font          = [UIFont systemFontOfSize:13];
    
    UILabel *productLabel      = [[UILabel alloc] initWithFrame:CGRectMake(220, 10, 150, 24)];
    productLabel.tag           = kCellProductLabelTag;
    productLabel.textAlignment = UITextAlignmentLeft;
    productLabel.font          = [UIFont systemFontOfSize:13];
    
    UILabel *quantityLabel      = [[UILabel alloc] initWithFrame:CGRectMake(385, 10, 30, 24)];
    quantityLabel.tag           = kCellQuantityLabelTag;
    quantityLabel.textAlignment = UITextAlignmentLeft;
    quantityLabel.font          = [UIFont systemFontOfSize:13];
    
    UILabel *freeLabel      = [[UILabel alloc] initWithFrame:CGRectMake(440, 10, 30, 24)];
    freeLabel.tag           = kCellFreeLabelTag;
    freeLabel.textAlignment = UITextAlignmentLeft;
    freeLabel.font          = [UIFont systemFontOfSize:13];
    
    UILabel *amountLabel      = [[UILabel alloc] initWithFrame:CGRectMake(500, 10, 65, 24)];
    amountLabel.tag           = kCellAmountLabelTag;
    amountLabel.textAlignment = UITextAlignmentLeft;
    amountLabel.font          = [UIFont systemFontOfSize:13];
    
    UILabel *reasonLabel      = [[UILabel alloc] initWithFrame:CGRectMake(575, 5, 80, 33)];
    reasonLabel.tag           = kCellReasonLabelTag;
    reasonLabel.textAlignment = UITextAlignmentLeft;
    reasonLabel.font          = [UIFont systemFontOfSize:13];
    reasonLabel.numberOfLines = 2;
    
    [cell addSubview:dateLabel];
    [cell addSubview:indexLabel];
    [cell addSubview:productLabel];
    [cell addSubview:quantityLabel];
    [cell addSubview:freeLabel];
    [cell addSubview:amountLabel];
    [cell addSubview:reasonLabel];
    
    [dateLabel release];
    [indexLabel release];
    [productLabel release];
    [quantityLabel release];
    [freeLabel release];
    [amountLabel release];
    [reasonLabel release];

}

+ (void)customizeDoublePickerCell:(UITableViewCell *)cell
{
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    UILabel *titleLabel = [self createTitleLabel];
    
    UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
    firstButton.tag = kCellFirstPickerButtonTag;
    firstButton.frame = CGRectMake(200, 4, 200, 36);
    firstButton.backgroundColor = [UIColor clearColor];
    firstButton.titleLabel.font = [UIFont systemFontOfSize:11];
    firstButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    firstButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    
    [firstButton setTitle:@"Sample Product Brand 1" forState:UIControlStateNormal];
    
    [firstButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [firstButton setBackgroundImage:[UIImage imageNamed:@"dropdown_small.png"] forState:UIControlStateNormal];
    
    UIButton *secondButton = [UIButton buttonWithType:UIButtonTypeCustom];
    secondButton.tag = kCellSecondPickerButtonTag;
    secondButton.frame = CGRectMake(420, 4, 200, 36);
    secondButton.backgroundColor = [UIColor clearColor];
    secondButton.titleLabel.font = [UIFont systemFontOfSize:11];
    secondButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    secondButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    
    [secondButton setTitle:@"Sample Product Brand 2" forState:UIControlStateNormal];
    
    [secondButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [secondButton setBackgroundImage:[UIImage imageNamed:@"dropdown_small.png"] forState:UIControlStateNormal];
    
    [cell addSubview:titleLabel];
    [cell addSubview:firstButton];
    [cell addSubview:secondButton];
    
    [titleLabel release];
}

+ (void)customizeDoubleLabelCell:(UITableViewCell *)cell
{
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UILabel *titleLabel = [self createTitleLabel];
    
    UILabel *firstLabel = [[UILabel alloc] initWithFrame:CGRectMake(210, 10, 180, 24)];
    firstLabel.tag      = kCellFirstLabelTag;
    firstLabel.textAlignment = UITextAlignmentLeft;
    firstLabel.font     = [UIFont systemFontOfSize:13];
    
    UILabel *secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(430, 10, 180, 24)];
    secondLabel.tag      = kCellSecondLabelTag;
    secondLabel.textAlignment = UITextAlignmentLeft;
    secondLabel.font     = [UIFont systemFontOfSize:13];
    
    [cell addSubview:titleLabel];
    [cell addSubview:firstLabel];
    [cell addSubview:secondLabel];
    
    [titleLabel release];
    [firstLabel release];
    [secondLabel release];
}

+ (void)customizeDoubleHeaderCell:(UITableViewCell *)cell
{
    cell.backgroundColor = [UIColor lightGrayColor];
    cell.selectionStyle  = UITableViewCellSelectionStyleNone;
    
    UILabel *firstHeader        = [[UILabel alloc] initWithFrame:CGRectMake(210, 10, 180, 24)];
    firstHeader.tag             = kCellFirstHeaderTag;
    firstHeader.textAlignment   = UITextAlignmentLeft;
    firstHeader.font            = [UIFont boldSystemFontOfSize:15];
    firstHeader.backgroundColor = [UIColor clearColor];
    
    UILabel *secondHeader        = [[UILabel alloc] initWithFrame:CGRectMake(430, 10, 180, 24)];
    secondHeader.tag             = kCellSecondHeaderTag;
    secondHeader.textAlignment   = UITextAlignmentLeft;
    secondHeader.font            = [UIFont boldSystemFontOfSize:15];
    secondHeader.backgroundColor = [UIColor clearColor];
    
    [cell addSubview:firstHeader];
    [cell addSubview:secondHeader];
    
    [firstHeader release];
    [secondHeader release];
}

+ (void)customizeDoubleTextCell:(UITableViewCell *)cell
{
    cell.selectionStyle  = UITableViewCellSelectionStyleNone;
    
    UILabel *titleLabel = [self createTitleLabel];
    
    UITextField *firstTextField = [[UITextField alloc] initWithFrame:CGRectMake(210, 10, 180, 24)];
    firstTextField.tag = kCellFirstTextTag;
    firstTextField.placeholder = @"Type Infomation Here";
    firstTextField.font = [UIFont systemFontOfSize:13];
    firstTextField.borderStyle     = UITextBorderStyleNone;
    firstTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    UITextField *secondTextField = [[UITextField alloc] initWithFrame:CGRectMake(430, 10, 180, 24)];
    secondTextField.tag = kCellSecondTextTag;
    secondTextField.placeholder = @"Type Infomation Here";
    secondTextField.font = [UIFont systemFontOfSize:13];
    secondTextField.borderStyle     = UITextBorderStyleNone;
    secondTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    
    [cell addSubview:titleLabel];
    [cell addSubview:firstTextField];
    [cell addSubview:secondTextField];
    
    [titleLabel release];
    [firstTextField release];
    [secondTextField release];
}

+ (UITableViewCell *)createCell:(CellType)type withIdentifier:(NSString *)identifier
{
    UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
    cell.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    switch (type) {
        case LabelType:
            [FormCellGenerator customizeLabelCell:cell];
            break;
        case TextType:
            [FormCellGenerator customizeTextCell:cell];
            break;
        case CheckboxType:
            [FormCellGenerator customizeCheckboxCell:cell];
            break;
        case PickerType:
            [FormCellGenerator customeizePickerCell:cell];
            break;
        case TextAreaType:
            [FormCellGenerator customizeTextAreaCell:cell];
            break;
        case HeaderType:
            [FormCellGenerator customizeHeaderCell:cell];
            break;
        case InfoType:
            [FormCellGenerator customizeInfoCell:cell];
            break;
        case PhotoType:
            break;
        case EntryType:
            [FormCellGenerator customizeEntryCell:cell];
            break;
        case RequestType:
            [FormCellGenerator customizeRequestCell:cell];
            break;
        case InvoiceType:
            [FormCellGenerator customizeInvoiceCell:cell]; 
            break;
        case BackOrderType:
            [FormCellGenerator customizeBackOrderCell:cell];
            break;
        case DoublePickerType:
            [FormCellGenerator customizeDoublePickerCell:cell];
            break;
        case DoubleLabelType:
            [FormCellGenerator customizeDoubleLabelCell:cell];
            break;
        case DoubleHeaderType:
            [FormCellGenerator customizeDoubleHeaderCell:cell];
            break;
        case DoubleTextType:
            [FormCellGenerator customizeDoubleTextCell:cell];
            break;
        
    }
    
    return cell;
}

+ (NSString *)cellIdentifierCell:(CellType)type
{
    NSString *cellIdentifer;
    
    switch (type) {
        case LabelType:
            cellIdentifer = @"LabelCell";
            break;
        case TextType:
            cellIdentifer = @"TextCell";
            break;
        case CheckboxType:
            cellIdentifer = @"CheckboxCell";
            break;
        case PickerType:
            cellIdentifer = @"PickerCell";
            break;
        case TextAreaType:
            cellIdentifer = @"TextAreaCell";
            break;
        case HeaderType:
            cellIdentifer = @"HeaderCell";
            break;
        case InfoType:
            cellIdentifer = @"InfoCell";
            break;
        case PhotoType:
            cellIdentifer = @"PhotoCell";
            break;
        case EntryType:
            cellIdentifer = @"EntryCell";
            break;
        case RequestType:
            cellIdentifer = @"RequestCell";
            break;
        case InvoiceType:
            cellIdentifer = @"InvoiceCell";
            break;
        case BackOrderType:
            cellIdentifer = @"BackOrderCell";
            break;
        case DoublePickerType:
            cellIdentifer = @"DoublePickerCell";
            break;
        case DoubleLabelType:
            cellIdentifer = @"DoubleLableCell";
            break;
        case DoubleHeaderType:
            cellIdentifer = @"DoubleHeaderCell";
            break;
        case DoubleTextType:
            cellIdentifer = @"DoubleTextCell";
            break;
    }
    
    return cellIdentifer;
}

@end
