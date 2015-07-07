//
//  SXAlertViewConfig.h
//  SXAlertView
//
//  Created by 沧海小鱼 on 15/7/7.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#ifndef SXAlertView_SXAlertViewConfig_h
#define SXAlertView_SXAlertViewConfig_h

/**
 *  屏幕的宽度
 */
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
/**
 *  屏幕的高度
 */
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
/**
 *  以RGB值取颜色
 */
#define RGBColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
/**
 *  以RGBA值取颜色
 */
#define RGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
/**
 *  随机颜色
 */
#define RandomColor RGBColor(arc4random_uniform(255),arc4random_uniform(255),arc4random_uniform(255))

#define kAlertViewAlertViewW ScreenWidth
#define kAlertViewAlertViewH 9999
#define kAlertViewContainerBorder 25
#define kAlertViewContainerW (ScreenWidth - kAlertViewContainerBorder * 2)
#define kAlertViewContainerBackgroundImage @"SXAlertView.bundle/alert_bg"
#define kAlertViewTitleH 47
#define kAlertViewTitleFontSize 16
#define kAlertViewTitleBackgroundImage @"SXAlertView.bundle/alert_title_top"
#define kAlertViewItemRowLineImage @"SXAlertView.bundle/alert_item_line"
#define kAlertViewItemRowCheckedIcon @"SXAlertView.bundle/alert_item_checked"
#define kAlertViewMessageBorderLeft 13
#define kAlertViewMessageBorderTop 13
#define kAlertViewMessageFontSize 12
#define kAlertViewMessageLineSpacing 8
#define kAlertViewMenuButtonH 45
#define kAlertViewButtonBorder 13
#define kAlertViewButtonH 35
#define kAlertViewButtonFontSize 14
#define kAlertViewButtonColor RGBColor(140, 140, 140)
#define kAlertViewButtonColorHighlighted [UIColor whiteColor]
#define kAlertViewButtonBackgroundImage @"SXAlertView.bundle/alert_button_gray"
#define kAlertViewButtonBackgroundHighlightedImage @"SXAlertView.bundle/alert_button"

#endif
