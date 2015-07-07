//
//  UIImage+Extension.h
//  OrderMeal
//
//  Created by 沧海小鱼 on 15/4/20.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/**
 *  加载图片
 */
+ (instancetype)imageWithName:(NSString *)name;
/**
 *  将UIColor变换为UIImage
 */
+ (instancetype)imageWithColor:(UIColor *)color;
/**
 *  返回一张自由拉伸的图片
 */
+ (instancetype)resizedImageWithName:(NSString *)name;
+ (instancetype)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;
/**
 *  返回一张圆角的图片
 */
+ (instancetype)circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

@end
