//
//  UIView+Extension.m
//  OrderMeal
//
//  Created by 沧海小鱼 on 15/4/20.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin {
    return self.frame.origin;
}

/**
 *  获取view的所有层级结构
 */
- (NSString *)digView {
    if ([self isKindOfClass:[UITableViewCell class]]) return @"";
    // 1.初始化
    NSMutableString *xml = [NSMutableString string];
    
    // 2.标签开头
    [xml appendFormat:@"<%@ frame=\"%@\"", self.class, NSStringFromCGRect(self.frame)];
    if (!CGPointEqualToPoint(self.bounds.origin, CGPointZero)) {
        [xml appendFormat:@" bounds=\"%@\"", NSStringFromCGRect(self.bounds)];
    }
    
    if ([self isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scroll = (UIScrollView *)self;
        if (!UIEdgeInsetsEqualToEdgeInsets(UIEdgeInsetsZero, scroll.contentInset)) {
            [xml appendFormat:@" contentInset=\"%@\"", NSStringFromUIEdgeInsets(scroll.contentInset)];
        }
    }
    
    // 3.判断是否要结束
    if (self.subviews.count == 0) {
        [xml appendString:@" />"];
        return xml;
    } else {
        [xml appendString:@">"];
    }
    
    // 4.遍历所有的子控件
    for (UIView *child in self.subviews) {
        NSString *childXml = [child digView];
        [xml appendString:childXml];
    }
    
    // 5.标签结尾
    [xml appendFormat:@"</%@>", self.class];
    
    return xml;
}

/**
 *  设置view的圆角
 */
- (void)setCornerRadius:(float)radius {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
}

@end
