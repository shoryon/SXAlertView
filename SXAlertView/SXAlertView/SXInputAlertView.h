//
//  InputAlertView.h
//  FJLottery
//
//  Created by 沧海小鱼 on 15/7/2.
//  Copyright (c) 2015年 FuJu Technology Co.,Ltd. All rights reserved.
//

#import "SXAlertView.h"

@interface SXInputAlertView : SXAlertView

@property (nonatomic, weak) UILabel *labelView;
@property (nonatomic, weak) UITextField *textField;

/**
 *  初始化包含消息内容文本框的弹出框
 *
 *  @param title   标题
 *  @param message 消息内容
 *  @param content 文本框中内容
 *  @param buttons 按钮集合
 */
- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                      content:(NSString *)content
                      buttons:(NSArray *)buttons;
+ (instancetype)alertViewWithTitle:(NSString *)title
                           message:(NSString *)message
                           content:(NSString *)content
                           buttons:(NSArray *)buttons;
/**
 *  初始化包含消息内容文本框的弹出框
 *
 *  @param title         标题
 *  @param message       消息内容
 *  @param content       文本框中内容
 *  @param buttons       按钮集合
 *  @param alignmentType 按钮对齐方式
 */
- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                      content:(NSString *)content
                      buttons:(NSArray *)buttons
                alignmentType:(SXAlertViewButtonAlignmentType)alignmentType;
+ (instancetype)alertViewWithTitle:(NSString *)title
                           message:(NSString *)message
                           content:(NSString *)content
                           buttons:(NSArray *)buttons
                     alignmentType:(SXAlertViewButtonAlignmentType)alignmentType;
/**
 *  初始化包含消息内容文本框的弹出框
 *
 *  @param title                   标题
 *  @param message                 消息内容
 *  @param messageAttributedString 消息内容属性
 *  @param content                 文本框中内容
 *  @param buttons                 按钮集合
 */
- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
      messageAttributedString:(NSAttributedString *)messageAttributedString
                      content:(NSString *)content
                      buttons:(NSArray *)buttons;
+ (instancetype)alertViewWithTitle:(NSString *)title
                           message:(NSString *)message
           messageAttributedString:(NSAttributedString *)messageAttributedString
                           content:(NSString *)content
                           buttons:(NSArray *)buttons;
/**
 *  初始化包含消息内容文本框的弹出框
 *
 *  @param title                   标题
 *  @param message                 消息内容
 *  @param messageAttributedString 消息内容属性
 *  @param content                 文本框中内容
 *  @param buttons                 按钮集合
 *  @param alignmentType           按钮对齐方式
 */
- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
      messageAttributedString:(NSAttributedString *)messageAttributedString
                      content:(NSString *)content
                      buttons:(NSArray *)buttons
                alignmentType:(SXAlertViewButtonAlignmentType)alignmentType;
+ (instancetype)alertViewWithTitle:(NSString *)title
                           message:(NSString *)message
           messageAttributedString:(NSAttributedString *)messageAttributedString
                           content:(NSString *)content
                           buttons:(NSArray *)buttons
                     alignmentType:(SXAlertViewButtonAlignmentType)alignmentType;

@end
