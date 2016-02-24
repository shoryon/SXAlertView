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

#define kAlertViewAlertViewW ScreenWidth
#define kAlertViewAlertViewH 9999

#define kAlertViewContainerBorder 25.0f
#define kAlertViewContainerW (ScreenWidth - kAlertViewContainerBorder * 2)
#define kAlertViewContainerBackgroundImage @"SXAlertView.bundle/alert_bg"

#define kAlertViewTitleH 44.0f
#define kAlertViewTitleFontSize [UIFont systemFontOfSize:16.0f]
#define kAlertViewTitleBackgroundImage @"SXAlertView.bundle/alert_title_top"

#define kAlertViewMessageBorderLeft 13.0f
#define kAlertViewMessageBorderTop 13.0f
#define kAlertViewMessageTextColor [UIColor blackColor]
#define kAlertViewMessageTextAlignment NSTextAlignmentCenter
#define kAlertViewMessageFontSize [UIFont systemFontOfSize:15.0f]
#define kAlertViewMessageLineSpacing 8.0f

#define kAlertViewItemRowButtonH 40.0f
#define kAlertViewItemRowFontSize [UIFont systemFontOfSize:15.0f]
#define kAlertViewItemRowLineImage @"SXAlertView.bundle/alert_item_line"
#define kAlertViewItemRowCheckedIcon @"SXAlertView.bundle/alert_item_checked"

#define kAlertViewPickerViewRowH 30.0f
#define kAlertViewPickerViewRowBackgroundColor [UIColor clearColor]
#define kAlertViewPickerViewRowTextColor [UIColor blackColor]
#define kAlertViewPickerViewRowTextAlignment NSTextAlignmentCenter
#define kAlertViewPickerViewRowFontSize [UIFont systemFontOfSize:14]

#define kAlertViewButtonBorder 13.0f
#define kAlertViewButtonH 30.0f
#define kAlertViewButtonFontSize [UIFont systemFontOfSize:14.0f]
#define kAlertViewButtonColor RGBColor(140, 140, 140)
#define kAlertViewButtonColorHighlighted [UIColor whiteColor]
#define kAlertViewButtonBackgroundImage @"SXAlertView.bundle/alert_button_gray"
#define kAlertViewButtonBackgroundHighlightedImage @"SXAlertView.bundle/alert_button"

#endif
