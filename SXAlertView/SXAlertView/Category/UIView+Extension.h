//
//  UIView+Extension.h
//  OrderMeal
//
//  Created by 沧海小鱼 on 15/4/20.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

@property (assign, nonatomic) CGFloat x;
@property (assign, nonatomic) CGFloat y;
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGSize size;
@property (assign, nonatomic) CGPoint origin;

/**
 *  获取view的所有层级结构
 */
- (NSString *)digView;

/**
 *  设置view的圆角
 */
- (void)setCornerRadius:(float)radius;

@end
