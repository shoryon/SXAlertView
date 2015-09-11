//
//  InputAlertView.m
//  FJLottery
//
//  Created by 沧海小鱼 on 15/7/2.
//  Copyright (c) 2015年 FuJu Technology Co.,Ltd. All rights reserved.
//

#import "SXInputAlertView.h"
#import "NSString+Extension.h"

#define kInputAlertViewBorder 18
#define kInputAlertViewFontSize 16
#define kInputAlertViewTextField 44

@implementation SXInputAlertView

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                      content:(NSString *)content
                      buttons:(NSArray *)buttons {
    return [self initWithTitle:title
                       message:message
       messageAttributedString:nil
                       content:content
                       buttons:buttons
                 alignmentType:SXAlertViewButtonAlignmentTypeHorizontal];
}

+ (instancetype)alertViewWithTitle:(NSString *)title
                           message:(NSString *)message
                           content:(NSString *)content
                           buttons:(NSArray *)buttons {
    return [[self alloc] initWithTitle:title
                               message:message
               messageAttributedString:nil
                               content:content
                               buttons:buttons
                         alignmentType:SXAlertViewButtonAlignmentTypeHorizontal];
}

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                      content:(NSString *)content
                      buttons:(NSArray *)buttons
                alignmentType:(SXAlertViewButtonAlignmentType)alignmentType {
    return [self initWithTitle:title
                       message:message
       messageAttributedString:nil
                       content:content
                       buttons:buttons
                 alignmentType:alignmentType];
}

+ (instancetype)alertViewWithTitle:(NSString *)title
                           message:(NSString *)message
                           content:(NSString *)content
                           buttons:(NSArray *)buttons
                     alignmentType:(SXAlertViewButtonAlignmentType)alignmentType {
    return [[self alloc] initWithTitle:title
                               message:message
               messageAttributedString:nil
                               content:content
                               buttons:buttons
                         alignmentType:alignmentType];
}

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
      messageAttributedString:(NSAttributedString *)messageAttributedString
                      content:(NSString *)content
                      buttons:(NSArray *)buttons {
    return [self initWithTitle:title
                       message:message
       messageAttributedString:messageAttributedString
                       content:content
                       buttons:buttons
                 alignmentType:SXAlertViewButtonAlignmentTypeHorizontal];
}

+ (instancetype)alertViewWithTitle:(NSString *)title
                           message:(NSString *)message
           messageAttributedString:(NSAttributedString *)messageAttributedString
                           content:(NSString *)content
                           buttons:(NSArray *)buttons {
    return [[self alloc] initWithTitle:title
                               message:message
               messageAttributedString:messageAttributedString
                               content:content
                               buttons:buttons
                         alignmentType:SXAlertViewButtonAlignmentTypeHorizontal];
}

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
      messageAttributedString:(NSAttributedString *)messageAttributedString
                      content:(NSString *)content buttons:(NSArray *)buttons
                alignmentType:(SXAlertViewButtonAlignmentType)alignmentType {
    /**
     自定义内容视图
     */
    UIView *customView = [[UIView alloc] init];
    /**
     提示消息内容
     */
    UILabel *labelView = [[UILabel alloc] init];
    CGFloat labelViewX = 0;
    CGFloat labelViewY = kInputAlertViewBorder;
    CGFloat labelViewW = kAlertViewContainerW;
    CGFloat labelViewH = [message heightWithFont:[UIFont systemFontOfSize:kInputAlertViewFontSize]
                               constrainedToSize:CGSizeMake(labelViewW, MAXFLOAT)
                                   lineBreakMode:NSLineBreakByWordWrapping]; //根据内容计算高度
    labelView.frame = CGRectMake(labelViewX, labelViewY, labelViewW, labelViewH);
    labelView.text = message;
    labelView.attributedText = messageAttributedString;
    labelView.font = [UIFont systemFontOfSize:kInputAlertViewFontSize];
    labelView.numberOfLines = 0;
    if (messageAttributedString) {
        labelView.textAlignment = NSTextAlignmentCenter;
    }
    [customView addSubview:labelView];
    
    self.labelView = labelView;
    /**
     提交文本内容
     */
    UITextField *textField = [[UITextField alloc] init];
    CGFloat textFieldX = kInputAlertViewBorder;
    CGFloat textFieldY = labelViewY + labelViewH + 10;
    CGFloat textFieldW = labelViewW - textFieldX * 2;
    CGFloat textFieldH = kInputAlertViewTextField;
    textField.frame = CGRectMake(textFieldX, textFieldY, textFieldW, textFieldH);
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.text = content;
    
    [customView addSubview:textField];
    
    self.textField = textField;
    
    CGFloat customViewX = 0;
    CGFloat customViewY = 0;
    CGFloat customViewW = kAlertViewContainerW;
    CGFloat customViewH = labelViewH + textFieldH + kInputAlertViewBorder * 2 + 5;
    customView.frame = CGRectMake(customViewX, customViewY, customViewW, customViewH);
    
    return [super initWithTitle:title customView:customView buttons:buttons alignmentType:alignmentType];
}

+ (instancetype)alertViewWithTitle:(NSString *)title
                           message:(NSString *)message
           messageAttributedString:(NSAttributedString *)messageAttributedString
                           content:(NSString *)content
                           buttons:(NSArray *)buttons
                     alignmentType:(SXAlertViewButtonAlignmentType)alignmentType {
    return [[self alloc] initWithTitle:title
                               message:message
               messageAttributedString:messageAttributedString
                               content:content
                               buttons:buttons
                         alignmentType:alignmentType];
}

@end
