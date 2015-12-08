//
//  AlertView.m
//  CarAppBuyers
//
//  Created by 沧海小鱼 on 15/5/26.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import "SXAlertView.h"
#import "UIImage+Extension.h"
#import "UIView+Extension.h"
#import "NSString+Extension.h"

@interface SXAlertView () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, assign) SXAlertViewButtonAlignmentType alignmentType;
@property (nonatomic, strong) NSMutableArray *checkedIconItems;
@property (nonatomic, strong) NSArray *source;

@end

@implementation SXAlertView

- (NSMutableArray *)menuItems {
    if (_menuItems == nil) {
        _menuItems = [NSMutableArray array];
    }
    return _menuItems;
}

- (NSMutableArray *)checkedIconItems {
    if (_checkedIconItems == nil) {
        _checkedIconItems = [NSMutableArray array];
    }
    return _checkedIconItems;
}

- (NSMutableArray *)buttonItems {
    if (_buttonItems == nil) {
        _buttonItems = [NSMutableArray array];
    }
    return _buttonItems;
}

#pragma mark 初始化弹出框

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupStyle];
        [self setupContainer];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupStyle];
        [self setupContainer];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupStyle];
        [self setupContainer];
    }
    return self;
}

/**
 *  初始化SXAlertView样式
 */
- (void)setupStyle {
    
    self.frame = CGRectMake(0, 0, kAlertViewAlertViewW, kAlertViewAlertViewH);
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    self.backgroundTouch = YES; //默认设置背景(弹出框以外区域)可触摸
    
    // 添加弹出框监听事件
    [self addTarget:self action:@selector(touch) forControlEvents:UIControlEventTouchDown];
}

/**
 *  初始化SXAlertView中container对象
 */
- (void)setupContainer {
    
    UIImageView *container = [[UIImageView alloc] init];
    
    container.userInteractionEnabled = YES;
    container.image = [UIImage resizedImageWithName:kAlertViewContainerBackgroundImage];
    
    [self addSubview:container];
    
    self.container = container;
}

/**
 *  显示弹出框
 */
- (void)show {
    
    [self showInView:[UIApplication sharedApplication].keyWindow];
}

/**
 *  以动画方式显示弹出框
 */
- (void)showAnimationsWithDuration:(NSTimeInterval)duration
                           options:(UIViewAnimationOptions)options
                        completion:(void (^)(BOOL finished))completion {
    [self showAnimationsInView:[UIApplication sharedApplication].keyWindow
                      duration:duration
                       options:options
                    completion:completion];
}

/**
 *  在指定view上显示弹出框
 */
- (void)showInView:(UIView *)view {
    
    [view addSubview:self];
}

/**
 *  以动画方式在指定view上显示弹出框
 */
- (void)showAnimationsInView:(UIView *)view
                    duration:(NSTimeInterval)duration
                     options:(UIViewAnimationOptions)options
                  completion:(void (^)(BOOL finished))completion {
    [UIView transitionWithView:view
                      duration:duration
                       options:options
                    animations:^{
                        [view addSubview:self];
                    }
                    completion:completion];
}

/**
 *  触摸遮罩层(弹出框以外的区域)
 */
- (void)touch {
    if (self.backgroundTouch) { // 触摸遮罩层销毁弹出框
        [self dismiss];
    } else { //自定义触摸事件
        if ([self.delegate respondsToSelector:@selector(sxAlertViewDidBackgroundTouch:)]) {
            [self.delegate sxAlertViewDidBackgroundTouch:self];
        }
    }
}

/**
 *  销毁面板
 */
- (void)dismiss {
    // 销毁前要执行的代理方法
    if ([self.delegate respondsToSelector:@selector(sxAlertViewWillDismiss:)]) {
        [self.delegate sxAlertViewWillDismiss:self];
    }
    [self removeFromSuperview];
}

/**
 *  设置弹出框背景图片
 */
- (void)setBackgroundImage:(NSString *)backgroundImage {
    
    _backgroundImage = backgroundImage;
    
    self.container.image = [UIImage resizedImageWithName:_backgroundImage];
}

/**
 *  设置按钮项背景图片
 */
- (void)setButtonBackgroundImage:(NSString *)buttonBackgroundImage {
    
    _buttonBackgroundImage = buttonBackgroundImage;
    
    for (UIButton *button in self.buttonItems) {
        [button setBackgroundImage:[UIImage resizedImageWithName:_buttonBackgroundImage] forState:UIControlStateNormal];
    }
}

/**
 *  设置按钮项高亮背景图片
 */
- (void)setButtonHighlightedBackgroundImage:(NSString *)buttonHighlightedBackgroundImage {
    
    _buttonHighlightedBackgroundImage = buttonHighlightedBackgroundImage;
    
    for (UIButton *button in self.buttonItems) {
        [button setBackgroundImage:[UIImage resizedImageWithName:_buttonHighlightedBackgroundImage] forState:UIControlStateHighlighted];
    }
}

#pragma mark 初始化消息弹出框

/**
 *  初始化包含消息内容的弹出框
 *
 *  @param title   标题
 *  @param message 消息内容
 */
- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message {
    return [self initWithTitle:title
                       message:message buttons:nil];
}

+ (instancetype)alertViewWithTitle:(NSString *)title
                           message:(NSString *)message {
    return [[self alloc] initWithTitle:title
                               message:message buttons:nil];
}

/**
 *  初始化包含消息内容的弹出框
 *
 *  @param title   标题
 *  @param message 消息内容
 *  @param buttons 按钮项
 */
- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                      buttons:(NSArray *)buttons {
    return [self initWithTitle:title
                       message:message
                       buttons:buttons
                 alignmentType:SXAlertViewButtonAlignmentTypeHorizontal];
}

+ (instancetype)alertViewWithTitle:(NSString *)title
                           message:(NSString *)message
                           buttons:(NSArray *)buttons {
    return [[self alloc] initWithTitle:title
                               message:message
                               buttons:buttons
                         alignmentType:SXAlertViewButtonAlignmentTypeHorizontal];
}

/**
 *  初始化包含消息内容的弹出框
 *
 *  @param title         标题
 *  @param message       消息内容
 *  @param buttons       按钮项
 *  @param alignmentType 按钮排列方式(水平排列|垂直排列)
 */
- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                      buttons:(NSArray *)buttons
                alignmentType:(SXAlertViewButtonAlignmentType)alignmentType {
    return [self initWithTitle:title
                       message:message
                       buttons:buttons
               backgroundImage:kAlertViewButtonBackgroundImage
    highlightedBackgroundImage:kAlertViewButtonBackgroundHighlightedImage
                 alignmentType:alignmentType];
}

+ (instancetype)alertViewWithTitle:(NSString *)title
                           message:(NSString *)message
                           buttons:(NSArray *)buttons
                     alignmentType:(SXAlertViewButtonAlignmentType)alignmentType {
    return [[self alloc] initWithTitle:title
                               message:message
                               buttons:buttons
                       backgroundImage:kAlertViewButtonBackgroundImage
            highlightedBackgroundImage:kAlertViewButtonBackgroundHighlightedImage
                         alignmentType:alignmentType];
}

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
   highlightedBackgroundImage:(NSString *)highlightedBackgroundImage {
    return [self initWithTitle:title
                       message:message
                       buttons:buttons
               backgroundImage:backgroundImage
    highlightedBackgroundImage:highlightedBackgroundImage
                 alignmentType:SXAlertViewButtonAlignmentTypeHorizontal];
}

+ (instancetype)alertViewWithTitle:(NSString *)title
                           message:(NSString *)message
                           buttons:(NSArray *)buttons
                   backgroundImage:(NSString *)backgroundImage
        highlightedBackgroundImage:(NSString *)highlightedBackgroundImage {
    return [[self alloc] initWithTitle:title
                               message:message
                               buttons:buttons
                       backgroundImage:backgroundImage
            highlightedBackgroundImage:highlightedBackgroundImage
                         alignmentType:SXAlertViewButtonAlignmentTypeHorizontal];
}

/**
 *  初始化包含消息内容的弹出框
 *
 *  @param title                      标题
 *  @param message                    消息内容
 *  @param buttons                    按钮项
 *  @param backgroundImage            按钮背景图片
 *  @param highlightedBackgroundImage 按钮高亮背景图片
 *  @param alignmentType              按钮排列方式(水平排列|垂直排列)
 */
- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                      buttons:(NSArray *)buttons
              backgroundImage:(NSString *)backgroundImage
   highlightedBackgroundImage:(NSString *)highlightedBackgroundImage
                alignmentType:(SXAlertViewButtonAlignmentType)alignmentType {
    
    if (self = [super init]) {
        
        if (title != nil) {
            [self createTitleView:title];
        }
        
        if (message != nil) {
            
            UILabel *contentView = [[UILabel alloc] init];
            
            contentView.font = kAlertViewMessageFontSize;
            contentView.backgroundColor = [UIColor clearColor];
            contentView.numberOfLines = 0;
            contentView.text = message;
            
            // 给lable添加行间距让高度自动也随着拉伸
            NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:message];
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            [paragraphStyle setLineSpacing:kAlertViewMessageLineSpacing];
            [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [message length])];
            [contentView setAttributedText:attributedString];
            [contentView sizeToFit];
            
            CGFloat contentViewX = kAlertViewMessageBorderLeft;
            CGFloat contentViewY = kAlertViewMessageBorderTop;
            if (title != nil) {
                contentViewY += _titleView.height;
            }
            CGFloat contentViewW = kAlertViewContainerW - kAlertViewMessageBorderLeft * 2;
            CGFloat contentViewH = [message heightWithFont:contentView.font lineSpacing:kAlertViewMessageLineSpacing constrainedToSize:CGSizeMake(contentViewW, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
            contentView.frame = CGRectMake(contentViewX, contentViewY, contentViewW, contentViewH);
            
            _contentView = contentView;
            
            [self.container addSubview:_contentView];
        }
        
        if (buttons != nil) {
            [self createButtonItems:buttons backgroundImage:backgroundImage highlightedBackgroundImage:highlightedBackgroundImage alignmentType:alignmentType];
        }
        
        [self resizeContainer];
    }
    return self;
}

+ (instancetype)alertViewWithTitle:(NSString *)title
                           message:(NSString *)message
                           buttons:(NSArray *)buttons
                   backgroundImage:(NSString *)backgroundImage
        highlightedBackgroundImage:(NSString *)highlightedBackgroundImage
                     alignmentType:(SXAlertViewButtonAlignmentType)alignmentType {
    return [[self alloc] initWithTitle:title
                               message:message
                               buttons:buttons
                       backgroundImage:backgroundImage
            highlightedBackgroundImage:highlightedBackgroundImage
                         alignmentType:alignmentType];
}

#pragma mark 初始化一个带菜单选择内容的弹出框

/**
 *  初始化包含菜单选择内容的弹出框
 *
 *  @param title 标题
 *  @param items 菜单项
 */
- (instancetype)initWithTitle:(NSString *)title
                        items:(NSArray *)items {
    return [self initWithTitle:title
                         items:items buttons:nil];
}

+ (instancetype)alertViewWithTitle:(NSString *)title
                             items:(NSArray *)items {
    return [[self alloc] initWithTitle:title
                                 items:items buttons:nil];
}

/**
 *  初始化包含菜单选择内容的弹出框
 *
 *  @param title 标题
 *  @param items 菜单项
 *  @param buttons 按钮项
 */
- (instancetype)initWithTitle:(NSString *)title
                        items:(NSArray *)items
                      buttons:(NSArray *)buttons {
    return [self initWithTitle:title
                         items:items
                       buttons:buttons
                 alignmentType:SXAlertViewButtonAlignmentTypeHorizontal];
}

+ (instancetype)alertViewWithTitle:(NSString *)title
                             items:(NSArray *)items
                           buttons:(NSArray *)buttons {
    return [[self alloc] initWithTitle:title
                                 items:items
                               buttons:buttons
                         alignmentType:SXAlertViewButtonAlignmentTypeHorizontal];
}

/**
 *  初始化包含菜单选择内容的弹出框
 *
 *  @param title 标题
 *  @param items 菜单项
 *  @param buttons 按钮项
 *  @param alignmentType 按钮排列方式(水平排列|垂直排列)
 */
- (instancetype)initWithTitle:(NSString *)title
                        items:(NSArray *)items
                      buttons:(NSArray *)buttons
                alignmentType:(SXAlertViewButtonAlignmentType)alignmentType {
    
    if (self = [super init]) {
        
        if (title != nil) {
            [self createTitleView:title];
        }
        
        if (items != nil) {
            
            CGFloat titleH = title != nil ? _titleView.height : 0;
            
            CGFloat itemX = 0;
            CGFloat itemW = kAlertViewContainerW;
            CGFloat itemH = kAlertViewItemRowButtonH;
            
            for (int index = 0; index < items.count; index++) {
                CGFloat itemY = index * itemH + titleH;
                UIButton *item = [[UIButton alloc] initWithFrame:CGRectMake(itemX, itemY, itemW, itemH)];
                [item setTag:index];
                [item setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
                [item setTitleEdgeInsets:UIEdgeInsetsMake(0, 20, 0, 0)];
                [item setTitle:items[index] forState:UIControlStateNormal];
                [item setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [item setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
                [item.titleLabel setFont:[UIFont systemFontOfSize:15.0f]];
                if (index != items.count - 1) { //添加的项的分割线
                    [item setBackgroundImage:[UIImage resizedImageWithName:kAlertViewItemRowLineImage] forState:UIControlStateNormal];
                    [item setBackgroundImage:[UIImage resizedImageWithName:kAlertViewItemRowLineImage] forState:UIControlStateHighlighted];
                }
                [item addTarget:self action:@selector(menuClick:) forControlEvents:UIControlEventTouchUpInside];
                
                UIImageView *checkedIcon = [[UIImageView alloc] init];
                checkedIcon.image = [UIImage imageNamed:kAlertViewItemRowCheckedIcon];
                CGFloat checkedIconW = checkedIcon.image.size.width;
                CGFloat checkedIconH = checkedIcon.image.size.height;
                CGFloat checkedIconX = item.width - checkedIconW - 15;
                CGFloat checkedIconY = item.size.height * 0.5 - checkedIconH * 0.5;
                checkedIcon.frame = CGRectMake(checkedIconX, checkedIconY, checkedIconW, checkedIconH);
                checkedIcon.hidden = YES;
                [item addSubview:checkedIcon];
                [self.checkedIconItems addObject:checkedIcon];
                
                [self.container addSubview:item];
                [self.menuItems addObject:item];
            }
        }
        
        if (buttons != nil) {
            [self createButtonItems:buttons backgroundImage:kAlertViewButtonBackgroundImage highlightedBackgroundImage:kAlertViewButtonBackgroundHighlightedImage alignmentType:alignmentType];
        }
        
        [self resizeContainer];
    }
    return self;
}

+ (instancetype)alertViewWithTitle:(NSString *)title
                             items:(NSArray *)items
                           buttons:(NSArray *)buttons
                     alignmentType:(SXAlertViewButtonAlignmentType)alignmentType {
    return [[self alloc] initWithTitle:title
                                 items:items
                               buttons:buttons
                         alignmentType:alignmentType];
}

/**
 *  设置菜单选中项
 */
- (void)setCheckedIndex:(NSInteger)checkedIndex {
    
    _checkedIndex = checkedIndex;
    
    [self.checkedIconItems[checkedIndex] setHidden:NO];
}

/**
 *  设置菜单选中多项
 */
- (void)setCheckedIndexs:(NSMutableArray *)checkedIndexs {
    
    _checkedIndexs = checkedIndexs;
    
    [checkedIndexs enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [self.checkedIconItems[[obj integerValue]] setHidden:NO];
    }];
}

#pragma mark 初始化一个带pickerView的弹出框

/**
 *  初始化包含选择器的弹出框
 *
 *  @param title  标题
 *  @param source 数据源
 */
- (instancetype)initWithTitle:(NSString *)title
             pickerViewSource:(NSArray *)source {
    return [self initWithTitle:title
              pickerViewSource:source buttons:nil];
}

+ (instancetype)alertViewWithTitle:(NSString *)title
                  pickerViewSource:(NSArray *)source {
    return [[self alloc] initWithTitle:title
                      pickerViewSource:source buttons:nil];
}

/**
 *  初始化包含选择器的弹出框
 *
 *  @param title   标题
 *  @param source  数据源
 *  @param buttons 按钮项
 */
- (instancetype)initWithTitle:(NSString *)title
             pickerViewSource:(NSArray *)source
                      buttons:(NSArray *)buttons {
    return [self initWithTitle:title pickerViewSource:source buttons:buttons alignmentType:SXAlertViewButtonAlignmentTypeHorizontal];
}

+ (instancetype)alertViewWithTitle:(NSString *)title
                  pickerViewSource:(NSArray *)source
                           buttons:(NSArray *)buttons {
    return [[self alloc] initWithTitle:title pickerViewSource:source buttons:buttons alignmentType:SXAlertViewButtonAlignmentTypeHorizontal];
}

/**
 *  初始化包含选择器的弹出框
 *
 *  @param title         标题
 *  @param source        数据源
 *  @param buttons       按钮项
 *  @param alignmentType 按钮排列方式(水平排列|垂直排列)
 */
- (instancetype)initWithTitle:(NSString *)title
             pickerViewSource:(NSArray *)source
                      buttons:(NSArray *)buttons
                alignmentType:(SXAlertViewButtonAlignmentType)alignmentType {
    return [self initWithTitle:title
              pickerViewSource:source
                       buttons:buttons
               backgroundImage:kAlertViewButtonBackgroundImage
    highlightedBackgroundImage:kAlertViewButtonBackgroundHighlightedImage
                 alignmentType:alignmentType];
}

+ (instancetype)alertViewWithTitle:(NSString *)title
                  pickerViewSource:(NSArray *)source
                           buttons:(NSArray *)buttons
                     alignmentType:(SXAlertViewButtonAlignmentType)alignmentType {
    return [[self alloc] initWithTitle:title
                      pickerViewSource:source
                               buttons:buttons
                       backgroundImage:kAlertViewButtonBackgroundImage
            highlightedBackgroundImage:kAlertViewButtonBackgroundHighlightedImage
                         alignmentType:alignmentType];
}

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
   highlightedBackgroundImage:(NSString *)highlightedBackgroundImage {
    return [self initWithTitle:title
              pickerViewSource:source
                       buttons:buttons
               backgroundImage:backgroundImage
    highlightedBackgroundImage:highlightedBackgroundImage
                 alignmentType:SXAlertViewButtonAlignmentTypeHorizontal];
}

+ (instancetype)alertViewWithTitle:(NSString *)title
                  pickerViewSource:(NSArray *)source
                           buttons:(NSArray *)buttons
                   backgroundImage:(NSString *)backgroundImage
        highlightedBackgroundImage:(NSString *)highlightedBackgroundImage {
    return [[self alloc] initWithTitle:title
                      pickerViewSource:source
                               buttons:buttons
                       backgroundImage:backgroundImage
            highlightedBackgroundImage:highlightedBackgroundImage
                         alignmentType:SXAlertViewButtonAlignmentTypeHorizontal];
}

/**
 *  初始化包含选择器的弹出框
 *
 *  @param title                      标题
 *  @param source                     数据源
 *  @param buttons                    按钮项
 *  @param backgroundImage            按钮背景图片
 *  @param highlightedBackgroundImage 按钮高亮背景图片
 *  @param alignmentType              按钮排列方式(水平排列|垂直排列)
 */
- (instancetype)initWithTitle:(NSString *)title
             pickerViewSource:(NSArray *)source
                      buttons:(NSArray *)buttons
              backgroundImage:(NSString *)backgroundImage
   highlightedBackgroundImage:(NSString *)highlightedBackgroundImage
                alignmentType:(SXAlertViewButtonAlignmentType)alignmentType {
    
    if (self = [super init]) {
        
        if (title != nil) {
            [self createTitleView:title];
        }
        
        if (source != nil) {
            
            UIPickerView *pickerView = [[UIPickerView alloc] init];
            
            pickerView.dataSource = self;
            pickerView.delegate = self;
            
            _pickerView = pickerView;
            _source = source;
            
            //覆盖pickerView视图的宽度
            _pickerView.width = kAlertViewContainerW;
            
            if (title != nil) {
                _pickerView.y = _titleView.height;
            }
            
            [self.container addSubview:_pickerView];
        }
        
        if (buttons != nil) {
            [self createButtonItems:buttons backgroundImage:backgroundImage highlightedBackgroundImage:highlightedBackgroundImage alignmentType:alignmentType];
        }
        
        [self resizeContainer];
    }
    return self;
}

+ (instancetype)alertViewWithTitle:(NSString *)title
                  pickerViewSource:(NSArray *)source
                           buttons:(NSArray *)buttons
                   backgroundImage:(NSString *)backgroundImage
        highlightedBackgroundImage:(NSString *)highlightedBackgroundImage
                     alignmentType:(SXAlertViewButtonAlignmentType)alignmentType {
    return [[self alloc] initWithTitle:title
                      pickerViewSource:source
                               buttons:buttons
                       backgroundImage:backgroundImage
            highlightedBackgroundImage:highlightedBackgroundImage
                         alignmentType:alignmentType];
}

#pragma mark 可以传一个自定义View

/**
 *  初始化包含自定义View的弹出框
 *
 *  @param title      标题
 *  @param customView 自定义View
 */
- (instancetype)initWithTitle:(NSString *)title
                   customView:(UIView *)customView {
    return [self initWithTitle:title
                    customView:customView buttons:nil];
}

+ (instancetype)alertViewWithTitle:(NSString *)title
                        customView:(UIView *)customView {
    return [[self alloc] initWithTitle:title
                            customView:customView buttons:nil];
}

/**
 *  初始化包含自定义View的弹出框
 *
 *  @param title      标题
 *  @param customView 自定义View
 *  @param buttons    按钮项
 */
- (instancetype)initWithTitle:(NSString *)title
                   customView:(UIView *)customView
                      buttons:(NSArray *)buttons {
    return [self initWithTitle:title
                    customView:customView
                       buttons:buttons
                 alignmentType:SXAlertViewButtonAlignmentTypeHorizontal];
}

+ (instancetype)alertViewWithTitle:(NSString *)title
                        customView:(UIView *)customView
                           buttons:(NSArray *)buttons {
    return [[self alloc] initWithTitle:title
                            customView:customView
                               buttons:buttons
                         alignmentType:SXAlertViewButtonAlignmentTypeHorizontal];
}

/**
 *  初始化包含自定义View的弹出框
 *
 *  @param title         标题
 *  @param customView    自定义View
 *  @param buttons       按钮项
 *  @param alignmentType 按钮排列方式(水平排列|垂直排列)
 */
- (instancetype)initWithTitle:(NSString *)title
                   customView:(UIView *)customView
                      buttons:(NSArray *)buttons
                alignmentType:(SXAlertViewButtonAlignmentType)alignmentType {
    return [self initWithTitle:title
                    customView:customView
                       buttons:buttons
               backgroundImage:kAlertViewButtonBackgroundImage
    highlightedBackgroundImage:kAlertViewButtonBackgroundHighlightedImage
                 alignmentType:alignmentType];
}

+ (instancetype)alertViewWithTitle:(NSString *)title
                        customView:(UIView *)customView
                           buttons:(NSArray *)buttons
                     alignmentType:(SXAlertViewButtonAlignmentType)alignmentType {
    return [[self alloc] initWithTitle:title
                            customView:customView
                               buttons:buttons
                       backgroundImage:kAlertViewButtonBackgroundImage
            highlightedBackgroundImage:kAlertViewButtonBackgroundHighlightedImage
                         alignmentType:alignmentType];
}

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
   highlightedBackgroundImage:(NSString *)highlightedBackgroundImage {
    return [self initWithTitle:title
                    customView:customView
                       buttons:buttons
               backgroundImage:backgroundImage
    highlightedBackgroundImage:highlightedBackgroundImage
                 alignmentType:SXAlertViewButtonAlignmentTypeHorizontal];
}

+ (instancetype)alertViewWithTitle:(NSString *)title
                        customView:(UIView *)customView
                           buttons:(NSArray *)buttons
                   backgroundImage:(NSString *)backgroundImage
        highlightedBackgroundImage:(NSString *)highlightedBackgroundImage {
    return [[self alloc] initWithTitle:title
                            customView:customView
                               buttons:buttons
                       backgroundImage:backgroundImage
            highlightedBackgroundImage:highlightedBackgroundImage
                         alignmentType:SXAlertViewButtonAlignmentTypeHorizontal];
}

/**
 *  初始化包含自定义View的弹出框
 *
 *  @param title         标题
 *  @param customView    自定义View
 *  @param buttons       按钮项
 *  @param backgroundImage            按钮背景图片
 *  @param highlightedBackgroundImage 按钮高亮背景图片
 *  @param alignmentType              按钮排列方式(水平排列|垂直排列)
 */
- (instancetype)initWithTitle:(NSString *)title
                   customView:(UIView *)customView
                      buttons:(NSArray *)buttons
              backgroundImage:(NSString *)backgroundImage
   highlightedBackgroundImage:(NSString *)highlightedBackgroundImage
                alignmentType:(SXAlertViewButtonAlignmentType)alignmentType {
    
    if (self = [super init]) {
        
        if (title != nil) {
            [self createTitleView:title];
        }
        
        if (customView != nil) {
            
            _customView = customView;
            
            //覆盖自定义视图的宽度
            _customView.width = kAlertViewContainerW;
            
            if (title != nil) {
                _customView.y = _titleView.height;
            }
            
            [self.container addSubview:_customView];
        }
        
        if (buttons != nil) {
            [self createButtonItems:buttons backgroundImage:backgroundImage highlightedBackgroundImage:highlightedBackgroundImage alignmentType:alignmentType];
        }
        
        [self resizeContainer];
    }
    return self;
}

+ (instancetype)alertViewWithTitle:(NSString *)title
                        customView:(UIView *)customView
                           buttons:(NSArray *)buttons
                   backgroundImage:(NSString *)backgroundImage
        highlightedBackgroundImage:(NSString *)highlightedBackgroundImage
                     alignmentType:(SXAlertViewButtonAlignmentType)alignmentType {
    return [[self alloc] initWithTitle:(NSString *)title
                            customView:customView
                               buttons:buttons
                       backgroundImage:backgroundImage
            highlightedBackgroundImage:highlightedBackgroundImage
                         alignmentType:alignmentType];
}

/**
 *  创建标题标签
 *
 *  @param title 标题内容
 */
- (void)createTitleView:(NSString *)title {
    
    CGFloat titleBgX = 0;
    CGFloat titleBgY = 0;
    CGFloat titleBgW = kAlertViewContainerW;
    CGFloat titleBgH = kAlertViewTitleH;
    UIImageView *titleBg = [[UIImageView alloc] init];
    titleBg.frame = CGRectMake(titleBgX, titleBgY, titleBgW, titleBgH);
    titleBg.image = [UIImage resizedImageWithName:kAlertViewTitleBackgroundImage];
    
    UILabel *titleView = [[UILabel alloc] init];
    titleView.frame = titleBg.frame;
    titleView.backgroundColor = [UIColor clearColor];
    titleView.font = kAlertViewTitleFontSize;
    titleView.textColor = [UIColor whiteColor];
    titleView.text = title;
    titleView.textAlignment = NSTextAlignmentCenter;
    
    [titleBg addSubview:titleView];
    
    [self.container addSubview:titleBg];
    
    self.titleView = titleView;
}

/**
 *  创建按钮项
 *
 *  @param buttons                    按钮项集合
 *  @param backgroundImage            按钮背景图片
 *  @param highlightedBackgroundImage 按钮高亮背景图片
 *  @param alignmentType              按钮排列方式
 */
- (void)createButtonItems:(NSArray *)buttons backgroundImage:(NSString *)backgroundImage highlightedBackgroundImage:(NSString *)highlightedBackgroundImage alignmentType:(SXAlertViewButtonAlignmentType)alignmentType {
    
    _alignmentType = alignmentType;
    
    if (_alignmentType) { //垂直排列
        
        CGFloat buttonsX = kAlertViewButtonBorder;
        CGFloat buttonsW = kAlertViewContainerW - buttonsX * 2;
        CGFloat buttonsH = kAlertViewButtonH;
        
        for (int index = 0; index < buttons.count; index++) {
            
            UIButton *button = [[UIButton alloc] init];
            
            CGFloat buttonsY = (kAlertViewButtonBorder + buttonsH) * index;
            
            if (_titleView != nil) {
                buttonsY += _titleView.height;
            }
            if (_contentView != nil) {
                buttonsY += _contentView.height + kAlertViewMessageBorderTop * 2;
            }
            if (_menuItems != nil) {
                buttonsY += _menuItems.count * kAlertViewItemRowButtonH;
            }
            if (_pickerView != nil) {
                buttonsY += _pickerView.height;
            }
            if (_customView != nil) {
                buttonsY += _customView.height;
            }
            // 没有任何内容区视图则给按钮添加上边距
            if (!_contentView && !_menuItems && !_pickerView && !_customView) {
                buttonsY += kAlertViewButtonBorder;
            }
            [button setTag:index];
            [button setFrame:CGRectMake(buttonsX, buttonsY, buttonsW, buttonsH)];
            [button.titleLabel setFont:kAlertViewButtonFontSize];
            [button setTitle:buttons[index] forState:UIControlStateNormal];
            [button setTitleColor:kAlertViewButtonColor forState:UIControlStateNormal];
            [button setTitleColor:kAlertViewButtonColorHighlighted forState:UIControlStateHighlighted];
            [button setBackgroundImage:[UIImage resizedImageWithName:backgroundImage] forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage resizedImageWithName:highlightedBackgroundImage] forState:UIControlStateHighlighted];
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.container addSubview:button];
            [self.buttonItems addObject:button];
        }
        
    } else { //水平排列
        
        CGFloat buttonsY = 0;
        
        if (_titleView != nil) {
            buttonsY += _titleView.height;
        }
        if (_contentView != nil) {
            buttonsY += _contentView.height + kAlertViewMessageBorderTop * 2;
        }
        if (_menuItems != nil) {
            buttonsY += _menuItems.count * kAlertViewItemRowButtonH;
        }
        if (_pickerView != nil) {
            buttonsY += _pickerView.height;
        }
        if (_customView != nil) {
            buttonsY += _customView.height;
        }
        // 没有任何内容区视图则给按钮添加上边距
        if (!_contentView && !_menuItems && !_pickerView && !_customView) {
            buttonsY += kAlertViewButtonBorder;
        }
        CGFloat buttonsW = (kAlertViewContainerW - (buttons.count + 1) * kAlertViewButtonBorder) / buttons.count;
        CGFloat buttonsH = kAlertViewButtonH;
        for (int index = 0; index < buttons.count; index++) {
            UIButton *button = [[UIButton alloc] init];
            CGFloat buttonsX = (buttonsW + kAlertViewButtonBorder) * index + kAlertViewButtonBorder;
            [button setTag:index];
            [button setFrame:CGRectMake(buttonsX, buttonsY, buttonsW, buttonsH)];
            [button.titleLabel setFont:kAlertViewButtonFontSize];
            [button setTitle:buttons[index] forState:UIControlStateNormal];
            [button setTitleColor:kAlertViewButtonColor forState:UIControlStateNormal];
            [button setTitleColor:kAlertViewButtonColorHighlighted forState:UIControlStateHighlighted];
            [button setBackgroundImage:[UIImage resizedImageWithName:backgroundImage] forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage resizedImageWithName:highlightedBackgroundImage] forState:UIControlStateHighlighted];
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.container addSubview:button];
            [self.buttonItems addObject:button];
        }
    }
}

/**
 *  点击菜单调用代理方法
 *
 *  @param button 当前点击的按钮
 */
- (void)menuClick:(UIButton *)button {
    if (self.checkedMultiterm) { //菜单多选
        if (button.tag) { //选择其他项目
            [[self.checkedIconItems firstObject] setHidden:YES]; //取消第一项勾选
            //获取当前选中项目
            UIImageView *checkedIcon = self.checkedIconItems[button.tag];
            //判断当前项是否已选中
            if (checkedIcon.hidden) { //未已选中则勾选
                [checkedIcon setHidden:NO];
                //添加索引数组
                [self.checkedIndexs addObject:@(button.tag)];
            } else { //已选中则反选
                [checkedIcon setHidden:YES];
                //移除索引数组
                [self.checkedIndexs removeObject:@(button.tag)];
            }
        } else { //选择一项，则取消所有勾选
            [self.checkedIconItems enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [self.checkedIconItems[idx] setHidden:(idx != button.tag)];
            }];
            //清空索引数组
            [self.checkedIndexs removeAllObjects];
            [self.checkedIndexs addObject:@(0)];
        }
    } else { //菜单单选
        if ([self.delegate respondsToSelector:@selector(sxAlertView:clickedMenuAtIndex:)]) {
            [self.delegate sxAlertView:self clickedMenuAtIndex:button.tag];
        }
    }
}

/**
 *  点击按钮调用代理方法
 *
 *  @param button 当前点击的按钮
 */
- (void)buttonClick:(UIButton *)button {
    if ([self.delegate respondsToSelector:@selector(sxAlertView:clickedButtonAtIndex:)]) {
        [self.delegate sxAlertView:self clickedButtonAtIndex:button.tag];
    }
}

/**
 *  重新调整面板的大小
 */
- (void)resizeContainer {
    
    _container.width = kAlertViewContainerW;
    _container.x = (ScreenWidth - _container.width) * 0.5;
    
    if (_titleView != nil) {
        _container.height += _titleView.height;
    }
    if (_contentView != nil) {
        _container.height += _contentView.height + kAlertViewMessageBorderTop * 2;
    }
    if (_menuItems != nil) {
        _container.height += _menuItems.count * kAlertViewItemRowButtonH;
    }
    if (_pickerView != nil) {
        _container.height += _pickerView.height;
    }
    if (_customView != nil) {
        _container.height += _customView.height;
    }
    if (!_contentView && !_menuItems && !_pickerView && !_customView) {
        _container.height += kAlertViewButtonBorder;
    }
    
    if (self.buttonItems.count > 0) {
        if (_alignmentType) { //垂直排列
            for (int index = 0; index < self.buttonItems.count; index++) {
                //_container.height += kAlertViewButtonH + kAlertViewButtonBorder;
                _container.height += kAlertViewButtonH + kAlertViewButtonBorder;
            }
        } else { //水平排列
            //_container.height += kAlertViewButtonH + kAlertViewButtonBorder * 2;
            _container.height += kAlertViewButtonH + kAlertViewButtonBorder;
        }
    }
    
    // 调整整个面板位置(屏幕正中间)
    _container.y = ScreenHeight * 0.5 - _container.height * 0.5;
}

#pragma mark pickerView data source

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return self.source.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [[self.source objectAtIndex:component] count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger) component {
    
    return [NSString stringWithFormat:@"%@", [self.source objectAtIndex:component][row]];
}

#pragma mark pickerView delegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if ([self.delegate respondsToSelector:@selector(sxAlertView:didSelectRow:inComponent:)]) {
        [self.delegate sxAlertView:self didSelectRow:row inComponent:component];
    }
}

@end
