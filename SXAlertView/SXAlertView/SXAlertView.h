//
//  AlertView.h
//  FJLottery
//
//  Created by 沧海小鱼 on 15/5/26.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SXAlertViewConfig.h"

@class SXAlertView;

/**
 *  弹出框按钮排列方式
 */
typedef NS_ENUM(NSInteger, SXAlertViewButtonAlignmentType) {
    /**
     *  水平排列
     */
    SXAlertViewButtonAlignmentTypeHorizontal = 0,
    /**
     *  垂直排列
     */
    SXAlertViewButtonAlignmentTypeVertical = 1
};

#pragma mark AlertView delegate

/**
 *  SXAlertView代理方法
 */
@protocol SXAlertViewDelegate <NSObject>

@optional
- (void)sxAlertView:(SXAlertView *)alertView clickedMenuAtIndex:(NSInteger)index;
- (void)sxAlertView:(SXAlertView *)alertView clickedButtonAtIndex:(NSInteger)index;
- (void)sxAlertView:(SXAlertView *)alertView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
- (void)sxAlertViewDidBackgroundTouch:(SXAlertView *)alertView;
- (void)sxAlertViewWillDismiss:(SXAlertView *)alertView;

@end

@interface SXAlertView : UIButton

/**
 *  面板主容器
 */
@property (nonatomic, weak) UIImageView *container;
/**
 *  可用于携带任意标识(等同于tag)
 */
@property (nonatomic, assign) NSInteger type;
/**
 *  可用于携带任意对象
 */
@property (nonatomic, strong) id package;
/**
 *  标题标签
 */
@property (nonatomic, weak) UILabel *titleView;
/**
 *  内容标签
 */
@property (nonatomic, weak) UILabel *contentView;
/**
 *  选择器
 */
@property (nonatomic, weak) UIPickerView *pickerView;
/**
 *  自定义View
 */
@property (nonatomic, weak) UIView *customView;
/**
 *  弹出框背景图片
 */
@property (nonatomic, copy) NSString *backgroundImage;
/**
 *  按钮项背景图片
 */
@property (nonatomic, copy) NSString *buttonBackgroundImage;
/**
 *  按钮项高亮背景图片
 */
@property (nonatomic, copy) NSString *buttonHighlightedBackgroundImage;
/**
 *  菜单项集合(数组中为UIButton类型)
 */
@property (nonatomic, strong) NSMutableArray *menuItems;
/**
 *  按钮项集合(数组中为UIButton类型)
 */
@property (nonatomic, strong) NSMutableArray *buttonItems;
/**
 *  当前菜单选中按钮的索引
 */
@property (nonatomic, assign) NSInteger checkedIndex;
/**
 *  是否可以触摸(弹出框以外的区域)
 */
@property (nonatomic, assign) BOOL backgroundTouch;

/**
 *  初始化包含消息内容的弹出框
 *
 *  @param title   标题
 *  @param message 消息内容
 */
- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message;
+ (instancetype)alertViewWithTitle:(NSString *)title
                           message:(NSString *)message;
/**
 *  初始化包含消息内容的弹出框
 *
 *  @param title   标题
 *  @param message 消息内容
 *  @param buttons 按钮项
 */
- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                      buttons:(NSArray *)buttons;
+ (instancetype)alertViewWithTitle:(NSString *)title
                           message:(NSString *)message
                           buttons:(NSArray *)buttons;
/**
 *  初始化包含消息内容的弹出框
 *
 *  @param title         标题
 *  @param message       消息内容
 *  @param buttons       按钮项
 *  @param alignmentType 按钮布局方式(水平布局|垂直布局)
 */
- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                      buttons:(NSArray *)buttons
                alignmentType:(SXAlertViewButtonAlignmentType)alignmentType;
+ (instancetype)alertViewWithTitle:(NSString *)title
                           message:(NSString *)message
                           buttons:(NSArray *)buttons
                     alignmentType:(SXAlertViewButtonAlignmentType)alignmentType;
/**
 *  初始化包含消息内容的弹出框
 *
 *  @param title                      标题
 *  @param message                    消息内容
 *  @param buttons                    按钮项
 *  @param backgroundImage            按钮背景图片
 *  @param highlightedBackgroundImage 按钮高亮背景图片
 */
- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                      buttons:(NSArray *)buttons
              backgroundImage:(NSString *)backgroundImage
   highlightedBackgroundImage:(NSString *)highlightedBackgroundImage;
+ (instancetype)alertViewWithTitle:(NSString *)title
                           message:(NSString *)message
                           buttons:(NSArray *)buttons
                   backgroundImage:(NSString *)backgroundImage
        highlightedBackgroundImage:(NSString *)highlightedBackgroundImage;
/**
 *  初始化包含消息内容的弹出框
 *
 *  @param title                      标题
 *  @param message                    消息内容
 *  @param buttons                    按钮项
 *  @param backgroundImage            按钮背景图片
 *  @param highlightedBackgroundImage 按钮高亮背景图片
 *  @param alignmentType              按钮布局方式(水平布局|垂直布局)
 */
- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                      buttons:(NSArray *)buttons
              backgroundImage:(NSString *)backgroundImage
   highlightedBackgroundImage:(NSString *)highlightedBackgroundImage
                alignmentType:(SXAlertViewButtonAlignmentType)alignmentType;
+ (instancetype)alertViewWithTitle:(NSString *)title
                           message:(NSString *)message
                           buttons:(NSArray *)buttons
                   backgroundImage:(NSString *)backgroundImage
        highlightedBackgroundImage:(NSString *)highlightedBackgroundImage
                     alignmentType:(SXAlertViewButtonAlignmentType)alignmentType;
/**
 *  初始化包含菜单选择内容的弹出框
 *
 *  @param title 标题
 *  @param items 菜单项
 */
- (instancetype)initWithTitle:(NSString *)title
                        items:(NSArray *)items;
+ (instancetype)alertViewWithTitle:(NSString *)title
                             items:(NSArray *)items;
/**
 *  初始化包含菜单选择内容的弹出框
 *
 *  @param title 标题
 *  @param items 菜单项
 *  @param buttons 按钮项
 */
- (instancetype)initWithTitle:(NSString *)title
                        items:(NSArray *)items
                      buttons:(NSArray *)buttons;
+ (instancetype)alertViewWithTitle:(NSString *)title
                             items:(NSArray *)items
                           buttons:(NSArray *)buttons;
/**
 *  初始化包含菜单选择内容的弹出框
 *
 *  @param title 标题
 *  @param items 菜单项
 *  @param buttons 按钮项
 *  @param alignmentType 按钮布局方式(水平布局|垂直布局)
 */
- (instancetype)initWithTitle:(NSString *)title
                        items:(NSArray *)items
                      buttons:(NSArray *)buttons
                alignmentType:(SXAlertViewButtonAlignmentType)alignmentType;
+ (instancetype)alertViewWithTitle:(NSString *)title
                             items:(NSArray *)items
                           buttons:(NSArray *)buttons
                     alignmentType:(SXAlertViewButtonAlignmentType)alignmentType;
/**
 *  初始化包含选择器的弹出框
 *
 *  @param title  标题
 *  @param source 数据源
 */
- (instancetype)initWithTitle:(NSString *)title
             pickerViewSource:(NSArray *)source;
+ (instancetype)alertViewWithTitle:(NSString *)title
                  pickerViewSource:(NSArray *)source;
/**
 *  初始化包含选择器的弹出框
 *
 *  @param title   标题
 *  @param source  数据源
 *  @param buttons 按钮项
 */
- (instancetype)initWithTitle:(NSString *)title
             pickerViewSource:(NSArray *)source
                      buttons:(NSArray *)buttons;
+ (instancetype)alertViewWithTitle:(NSString *)title
                  pickerViewSource:(NSArray *)source
                           buttons:(NSArray *)buttons;
/**
 *  初始化包含选择器的弹出框
 *
 *  @param title         标题
 *  @param source        数据源
 *  @param buttons       按钮项
 *  @param alignmentType 按钮布局方式(水平布局|垂直布局)
 */
- (instancetype)initWithTitle:(NSString *)title
             pickerViewSource:(NSArray *)source
                      buttons:(NSArray *)buttons
                alignmentType:(SXAlertViewButtonAlignmentType)alignmentType;
+ (instancetype)alertViewWithTitle:(NSString *)title
                  pickerViewSource:(NSArray *)source
                           buttons:(NSArray *)buttons
                     alignmentType:(SXAlertViewButtonAlignmentType)alignmentType;
/**
 *  初始化包含选择器的弹出框
 *
 *  @param title                      标题
 *  @param source                     数据源
 *  @param buttons                    按钮项
 *  @param backgroundImage            按钮背景图片
 *  @param highlightedBackgroundImage 按钮高亮背景图片
 */
- (instancetype)initWithTitle:(NSString *)title
             pickerViewSource:(NSArray *)source
                      buttons:(NSArray *)buttons
              backgroundImage:(NSString *)backgroundImage
   highlightedBackgroundImage:(NSString *)highlightedBackgroundImage;
+ (instancetype)alertViewWithTitle:(NSString *)title
                  pickerViewSource:(NSArray *)source
                           buttons:(NSArray *)buttons
                   backgroundImage:(NSString *)backgroundImage
        highlightedBackgroundImage:(NSString *)highlightedBackgroundImage;
/**
 *  初始化包含选择器的弹出框
 *
 *  @param title                      标题
 *  @param source                     数据源
 *  @param buttons                    按钮项
 *  @param backgroundImage            按钮背景图片
 *  @param highlightedBackgroundImage 按钮高亮背景图片
 *  @param alignmentType              按钮布局方式(水平布局|垂直布局)
 */
- (instancetype)initWithTitle:(NSString *)title
             pickerViewSource:(NSArray *)source
                      buttons:(NSArray *)buttons
              backgroundImage:(NSString *)backgroundImage
   highlightedBackgroundImage:(NSString *)highlightedBackgroundImage
                alignmentType:(SXAlertViewButtonAlignmentType)alignmentType;
+ (instancetype)alertViewWithTitle:(NSString *)title
                  pickerViewSource:(NSArray *)source
                           buttons:(NSArray *)buttons
                   backgroundImage:(NSString *)backgroundImage
        highlightedBackgroundImage:(NSString *)highlightedBackgroundImage
                     alignmentType:(SXAlertViewButtonAlignmentType)alignmentType;
/**
 *  初始化包含自定义View的弹出框
 *
 *  @param title      标题
 *  @param customView 自定义View
 */
- (instancetype)initWithTitle:(NSString *)title
                   customView:(UIView *)customView;
+ (instancetype)alertViewWithTitle:(NSString *)title
                        customView:(UIView *)customView;
/**
 *  初始化包含自定义View的弹出框
 *
 *  @param title      标题
 *  @param customView 自定义View
 *  @param buttons    按钮项
 */
- (instancetype)initWithTitle:(NSString *)title
                   customView:(UIView *)customView
                      buttons:(NSArray *)buttons;
+ (instancetype)alertViewWithTitle:(NSString *)title
                   customView:(UIView *)customView
                      buttons:(NSArray *)buttons;
/**
 *  初始化包含自定义View的弹出框
 *
 *  @param title         标题
 *  @param customView    自定义View
 *  @param buttons       按钮项
 *  @param alignmentType 按钮布局方式(水平布局|垂直布局)
 */
- (instancetype)initWithTitle:(NSString *)title
                   customView:(UIView *)customView
                      buttons:(NSArray *)buttons
                alignmentType:(SXAlertViewButtonAlignmentType)alignmentType;
+ (instancetype)alertViewWithTitle:(NSString *)title
                        customView:(UIView *)customView
                           buttons:(NSArray *)buttons
                     alignmentType:(SXAlertViewButtonAlignmentType)alignmentType;
/**
 *  初始化包含自定义View的弹出框
 *
 *  @param title         标题
 *  @param customView    自定义View
 *  @param buttons       按钮项
 *  @param backgroundImage            按钮背景图片
 *  @param highlightedBackgroundImage 按钮高亮背景图片
 */
- (instancetype)initWithTitle:(NSString *)title
                   customView:(UIView *)customView
                      buttons:(NSArray *)buttons
              backgroundImage:(NSString *)backgroundImage
   highlightedBackgroundImage:(NSString *)highlightedBackgroundImage;
+ (instancetype)alertViewWithTitle:(NSString *)title
                        customView:(UIView *)customView
                           buttons:(NSArray *)buttons
                   backgroundImage:(NSString *)backgroundImage
        highlightedBackgroundImage:(NSString *)highlightedBackgroundImage;
/**
 *  初始化包含自定义View的弹出框
 *
 *  @param title         标题
 *  @param customView    自定义View
 *  @param buttons       按钮项
 *  @param backgroundImage            按钮背景图片
 *  @param highlightedBackgroundImage 按钮高亮背景图片
 *  @param alignmentType              按钮布局方式(水平布局|垂直布局)
 */
- (instancetype)initWithTitle:(NSString *)title
                   customView:(UIView *)customView
                      buttons:(NSArray *)buttons
              backgroundImage:(NSString *)backgroundImage
   highlightedBackgroundImage:(NSString *)highlightedBackgroundImage
                alignmentType:(SXAlertViewButtonAlignmentType)alignmentType;
+ (instancetype)alertViewWithTitle:(NSString *)title
                        customView:(UIView *)customView
                           buttons:(NSArray *)buttons
                   backgroundImage:(NSString *)backgroundImage
        highlightedBackgroundImage:(NSString *)highlightedBackgroundImage
                     alignmentType:(SXAlertViewButtonAlignmentType)alignmentType;
/**
 *  显示弹出框
 */
- (void)show;
/**
 *  以动画方式显示弹出框
 */
- (void)showAnimationsWithDuration:(NSTimeInterval)duration
                           options:(UIViewAnimationOptions)options
                        completion:(void (^)(BOOL finished))completion;
/**
 *  在指定view上显示弹出框
 */
- (void)showInView:(UIView *)view;
/**
 *  以动画方式在指定view上显示弹出框
 */
- (void)showAnimationsInView:(UIView *)view
                    duration:(NSTimeInterval)duration
                     options:(UIViewAnimationOptions)options
                  completion:(void (^)(BOOL finished))completion;
/**
 *  销毁弹出框
 */
- (void)dismiss;

@property (nonatomic, assign) id<SXAlertViewDelegate> delegate;

@end
