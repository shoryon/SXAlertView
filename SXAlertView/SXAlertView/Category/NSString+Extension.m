//
//  NSString+Extension.m
//  FJLottery
//
//  Created by 沧海小鱼 on 15/5/26.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (CGFloat)widthWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode {
    
    return [self sizeWithFont:font lineSpacing:0 constrainedToSize:size lineBreakMode:lineBreakMode].width;
}

- (CGFloat)widthWithFont:(UIFont *)font lineSpacing:(CGFloat)lineSpacing constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode {
    
    return [self sizeWithFont:font lineSpacing:lineSpacing constrainedToSize:size lineBreakMode:lineBreakMode].width;
}

- (CGFloat)heightWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode {
    
    return [self sizeWithFont:font lineSpacing:0 constrainedToSize:size lineBreakMode:lineBreakMode].height;
}

- (CGFloat)heightWithFont:(UIFont *)font lineSpacing:(CGFloat)lineSpacing constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode {
    
    return [self sizeWithFont:font lineSpacing:lineSpacing constrainedToSize:size lineBreakMode:lineBreakMode].height;
}

- (CGSize)sizeWithFont:(UIFont *)font lineSpacing:(CGFloat)lineSpacing constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode {
    
    CGSize textSize;
    
    if (CGSizeEqualToSize(size, CGSizeZero)) {
        //NSDictionary *attributes = @{NSFontAttributeName:font}
        NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
        //textSize = [self sizeWithAttributes:attributes];
        //textSize = []
        
        textSize = [self sizeWithAttributes:attributes];
        
    } else {
        
        NSStringDrawingOptions option = NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
        //NSStringDrawingTruncatesLastVisibleLine如果文本内容超出指定的矩形限制，文本将被截去并在最后一个字符后加上省略号。 如果指定了NSStringDrawingUsesLineFragmentOrigin选项，则该选项被忽略 NSStringDrawingUsesFontLeading计算行高时使用行间距。（字体大小+行间距=行高）
        
        NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
        
        [attributes setValue:font forKey:NSFontAttributeName];
        
        if (lineSpacing) {
            
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            
            [paragraphStyle setLineSpacing:lineSpacing];
            
            [attributes setValue:paragraphStyle forKey:NSParagraphStyleAttributeName];
        }
        
        CGRect rect = [self boundingRectWithSize:size options:option attributes:attributes context:nil];
        
        textSize = rect.size;
    }
    
    return textSize;
}

@end
