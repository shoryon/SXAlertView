//
//  NSString+Extension.h
//  FJLottery
//
//  Created by 沧海小鱼 on 15/5/26.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (Extension)

/**
 *  根据字符串长度来计算所占尺寸
 *
 *  @param font          字体
 *  @param lineSpacing   行间距
 *  @param size          约束尺寸
 *  @param lineBreakMode 换行模式
 */
- (CGSize)sizeWithFont:(UIFont *)font lineSpacing:(CGFloat)lineSpacing constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode;
/**
 *  根据字符串长度来计算所占尺寸
 *
 *  @param font          字体
 *  @param size          约束尺寸
 *  @param lineBreakMode 换行模式
 */
- (CGFloat)widthWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode;
/**
 *  根据字符串长度来计算所占宽度
 *
 *  @param font          字体
 *  @param lineSpacing   行间距
 *  @param size          约束尺寸
 *  @param lineBreakMode 换行模式
 */
- (CGFloat)widthWithFont:(UIFont *)font lineSpacing:(CGFloat)lineSpacing constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode;
/**
 *  根据字符串长度来计算所占高度
 *
 *  @param font          字体
 *  @param lineSpacing   行间距
 *  @param size          约束尺寸
 *  @param lineBreakMode 换行模式
 */
- (CGFloat)heightWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode;
/**
 *  根据字符串长度来计算所占高度
 *
 *  @param font          字体
 *  @param lineSpacing   行间距
 *  @param size          约束尺寸
 *  @param lineBreakMode 换行模式
 */
- (CGFloat)heightWithFont:(UIFont *)font lineSpacing:(CGFloat)lineSpacing constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode;

@end
