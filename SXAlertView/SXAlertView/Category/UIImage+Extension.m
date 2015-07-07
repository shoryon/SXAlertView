//
//  UIImage+Extension.m
//  OrderMeal
//
//  Created by 沧海小鱼 on 15/4/20.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

/**
 *  加载图片
 */
+ (instancetype)imageWithName:(NSString *)name {
    
    //目前此方法功能预留，后期扩展
    return [UIImage imageNamed:name];
}

/**
 *  将UIColor变换为UIImage
 */
+ (instancetype)imageWithColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return theImage;
}

/**
 *  返回一张自由拉伸的图片
 */
+ (instancetype)resizedImageWithName:(NSString *)name {
    
    return [self resizedImageWithName:name left:0.5 top:0.5];
}

/**
 *  返回一张自由拉伸的图片
 */
+ (instancetype)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top {
    
    UIImage *image = [UIImage imageWithName:name];
    
    return [image stretchableImageWithLeftCapWidth:image.size.width * left topCapHeight:image.size.height * top];
}

/**
 *  返回一张圆角的图片
 */
+ (instancetype)circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    
    // 1.加载原图
    UIImage *oldImage = [UIImage imageNamed:name];
    
    // 2.开启上下文
    CGFloat imageW = oldImage.size.width + 2 * borderWidth;
    CGFloat imageH = oldImage.size.height + 2 * borderWidth;
    CGSize imageSize = CGSizeMake(imageW, imageH);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    
    // 3.取得当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 4.画边框(大圆)
    [borderColor set];
    CGFloat bigRadius = imageW * 0.5; // 大圆半径
    CGFloat centerX = bigRadius; // 圆心
    CGFloat centerY = bigRadius;
    CGContextAddArc(ctx, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctx); // 画圆
    
    // 5.小圆
    CGFloat smallRadius = bigRadius - borderWidth;
    CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
    // 裁剪(后面画的东西才会受裁剪的影响)
    CGContextClip(ctx);
    
    // 6.画图
    [oldImage drawInRect:CGRectMake(borderWidth, borderWidth, oldImage.size.width, oldImage.size.height)];
    
    // 7.取图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 8.结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
