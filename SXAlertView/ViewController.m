//
//  ViewController.m
//  SXAlertView
//
//  Created by 沧海小鱼 on 15/7/6.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import "ViewController.h"
#import "SXAlertView.h"

@interface ViewController () <SXAlertViewDelegate>

@end

@implementation ViewController

- (IBAction)show_01:(id)sender {
    
    SXAlertView *alertView = [[SXAlertView alloc] initWithTitle:nil
                                                        message:@"我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容。"];
    
    /*SXAlertView *alertView = [SXAlertView alertViewWithTitle:nil
                                                     message:@"我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容。"];*/
    
    alertView.delegate = self;
    /*alertView.backgroundTouch = NO;*/ //设置不可触摸背景消失
    
    [alertView show];
    
    /*[alertView showAnimationsWithDuration:0.5
                                    options:UIViewAnimationOptionTransitionCrossDissolve
                                completion:^(BOOL finished) {
                                    NSLog(@"finished - %d", finished);
                                }];*/
}

- (IBAction)show_02:(id)sender {
    
    SXAlertView *alertView = [[SXAlertView alloc] initWithTitle:@"我是标题"
                                                        message:@"我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容。"];
    
    alertView.delegate = self;
    
    [alertView show];
}

- (IBAction)show_03:(id)sender {
    
    SXAlertView *alertView = [[SXAlertView alloc] initWithTitle:@"我是标题"
                                                        message:@"我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容。"
                                                        buttons:@[@"确定", @"取消"]];
    
    alertView.delegate = self;
    
    [alertView show];
}

- (IBAction)show_04:(id)sender {
    
    SXAlertView *alertView = [[SXAlertView alloc] initWithTitle:@"我是标题"
                                                        message:@"我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容,我是内容。"
                                                        buttons:@[@"确定", @"取消"]
                                                  alignmentType:SXAlertViewButtonAlignmentTypeVertical];
    
    alertView.delegate = self;
    alertView.backgroundTouch = NO; //设置不可触摸背景消失
    
    [alertView show];
}

- (IBAction)show_05:(id)sender {
    
    SXAlertView *alertView = [[SXAlertView alloc] initWithTitle:nil
                                                          items:@[@"男",@"女"]];
    
    alertView.checkedIndex = 0;
    
    alertView.delegate = self;
    
    [alertView show];
}

- (IBAction)show_06:(id)sender {
    
    SXAlertView *alertView = [[SXAlertView alloc] initWithTitle:@"选择性别"
                                                          items:@[@"男",@"女"]];
    
    alertView.checkedIndex = 0;
    
    alertView.delegate = self;
    
    [alertView show];
}

- (IBAction)show_07:(id)sender {
    
    SXAlertView *alertView = [[SXAlertView alloc] initWithTitle:@"选择性别"
                                                          items:@[@"不限", @"男", @"女"]
                                                        buttons:@[@"确定", @"取消"]];
    
    alertView.checkedIndex = 1;
    
    alertView.delegate = self;
    
    [alertView show];
}

- (IBAction)show_08:(id)sender {
    
    SXAlertView *alertView = [[SXAlertView alloc] initWithTitle:@"选择性别"
                                                          items:@[@"不限", @"男", @"女"]
                                                        buttons:@[@"确定", @"取消"]
                                                  alignmentType:SXAlertViewButtonAlignmentTypeVertical];
    
    alertView.checkedIndex = 1;
    
    alertView.delegate = self;
    alertView.backgroundTouch = NO; //设置不可触摸背景消失
    
    [alertView show];
}

- (IBAction)show_09:(id)sender {
    
    SXAlertView *alertView = [[SXAlertView alloc] initWithTitle:nil
                                               pickerViewSource:@[@[@"2001", @"2002", @"2003", @"2004", @"2005"],
                                                                  @[@"1", @"2", @"3", @"4", @"5"],
                                                                  @[@"1", @"2", @"3", @"4", @"5"]]];
    
    alertView.delegate = self;
    
    [alertView show];
}

- (IBAction)show_10:(id)sender {
    
    SXAlertView *alertView = [[SXAlertView alloc] initWithTitle:@"请选择日期"
                                               pickerViewSource:@[@[@"2001", @"2002", @"2003", @"2004", @"2005"],
                                                                  @[@"1", @"2", @"3", @"4", @"5"],
                                                                  @[@"1", @"2", @"3", @"4", @"5"]]];
    
    alertView.delegate = self;
    
    [alertView.pickerView selectRow:1 inComponent:0 animated:NO];
    [alertView.pickerView selectRow:1 inComponent:1 animated:NO];
    [alertView.pickerView selectRow:1 inComponent:2 animated:NO];
    
    [alertView show];
}

- (IBAction)show_11:(id)sender {
    
    SXAlertView *alertView = [[SXAlertView alloc] initWithTitle:@"请选择日期"
                                               pickerViewSource:@[@[@"2001", @"2002", @"2003", @"2004", @"2005"],
                                                                  @[@"1", @"2", @"3", @"4", @"5"],
                                                                  @[@"1", @"2", @"3", @"4", @"5"]]
                                                        buttons:@[@"确定", @"取消"]];
    
    alertView.delegate = self;
    
    [alertView.pickerView selectRow:1 inComponent:0 animated:NO];
    [alertView.pickerView selectRow:1 inComponent:1 animated:NO];
    [alertView.pickerView selectRow:1 inComponent:2 animated:NO];
    
    [alertView show];
}

- (IBAction)show_12:(id)sender {
    
    SXAlertView *alertView = [[SXAlertView alloc] initWithTitle:@"请选择日期"
                                               pickerViewSource:@[@[@"2001", @"2002", @"2003", @"2004", @"2005"],
                                                                  @[@"1", @"2", @"3", @"4", @"5"],
                                                                  @[@"1", @"2", @"3", @"4", @"5"]]
                                                        buttons:@[@"确定", @"取消"]
                                                  alignmentType:SXAlertViewButtonAlignmentTypeVertical];
    
    alertView.delegate = self;
    alertView.backgroundTouch = NO; //设置不可触摸背景消失
    
    [alertView.pickerView selectRow:1 inComponent:0 animated:NO];
    [alertView.pickerView selectRow:1 inComponent:1 animated:NO];
    [alertView.pickerView selectRow:1 inComponent:2 animated:NO];
    
    [alertView show];
}

- (IBAction)show_13:(id)sender {
    
    CGFloat border = 10.0f;
    CGFloat height = 44.0f;
    
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kAlertViewContainerW, height + border * 2)];
    
    backgroundView.backgroundColor = [UIColor clearColor];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(border, border, kAlertViewContainerW - border * 2, height)];
    
    textField.borderStyle = UITextBorderStyleRoundedRect;
    
    textField.text = @"我是文本框";
    
    [backgroundView addSubview:textField];
    
    SXAlertView *alertView = [[SXAlertView alloc] initWithTitle:nil customView:backgroundView];
    
    alertView.delegate = self;
    
    [alertView show];
}

- (IBAction)show_14:(id)sender {
    
    CGFloat border = 10.0f;
    CGFloat height = 44.0f;
    
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kAlertViewContainerW, height + border * 2)];
    
    backgroundView.backgroundColor = [UIColor clearColor];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(border, border, kAlertViewContainerW - border * 2, height)];
    
    textField.borderStyle = UITextBorderStyleRoundedRect;
    
    textField.text = @"我是文本框";
    
    [backgroundView addSubview:textField];
    
    SXAlertView *alertView = [[SXAlertView alloc] initWithTitle:@"我是标题" customView:backgroundView];
    
    alertView.delegate = self;
    
    [alertView show];
}

- (IBAction)show_15:(id)sender {
    
    CGFloat border = 10.0f;
    CGFloat height = 44.0f;
    
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kAlertViewContainerW, height + border * 2)];
    
    backgroundView.backgroundColor = [UIColor clearColor];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(border, border, kAlertViewContainerW - border * 2, height)];
    
    textField.borderStyle = UITextBorderStyleRoundedRect;
    
    textField.text = @"我是文本框";
    
    [backgroundView addSubview:textField];
    
    SXAlertView *alertView = [[SXAlertView alloc] initWithTitle:@"我是标题"
                                                     customView:backgroundView
                                                        buttons:@[@"确定", @"取消"]];
    
    alertView.delegate = self;
    
    [alertView show];
}

- (IBAction)show_16:(id)sender {
    
    CGFloat border = 10.0f;
    CGFloat height = 44.0f;
    
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kAlertViewContainerW, height + border * 2)];
    
    backgroundView.backgroundColor = [UIColor clearColor];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(border, border, kAlertViewContainerW - border * 2, height)];
    
    textField.borderStyle = UITextBorderStyleRoundedRect;
    
    textField.text = @"我是文本框";
    
    [backgroundView addSubview:textField];
    
    SXAlertView *alertView = [[SXAlertView alloc] initWithTitle:@"我是标题"
                                                     customView:backgroundView
                                                        buttons:@[@"确定", @"取消"]
                                                  alignmentType:SXAlertViewButtonAlignmentTypeVertical];
    
    alertView.delegate = self;
    alertView.backgroundTouch = NO; //设置不可触摸背景消失
    
    [alertView show];
}

#pragma mark - alert view delegate

- (void)sxAlertView:(SXAlertView *)alertView clickedMenuAtIndex:(NSInteger)index {
    
    NSLog(@"clicked menu at index:%ld", index);
}

- (void)sxAlertView:(SXAlertView *)alertView clickedButtonAtIndex:(NSInteger)index {
    
    NSLog(@"clicked button at index:%ld", index);
    
    [alertView dismiss];
}

- (void)sxAlertView:(SXAlertView *)alertView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    NSLog(@"selectRow:%ld component:%ld", row, component);
}

- (void)sxAlertViewWillDismiss:(SXAlertView *)alertView {
    
    NSLog(@"I'm dead");
}

@end
