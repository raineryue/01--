//
//  ViewController.m
//  01-加法计算器
//
//  Created by Rainer on 15/5/6.
//  Copyright (c) 2015年 Rainer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    UITextField *_number1;
    UITextField *_number2;
    UITextField *_resultTextField;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 1.设置当前控制器的试图的背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 2.设置控件的位置大小
    // 2.1.设置间隙的大小
    CGFloat kConst = 10.0;
    
    // 2.1.设置标签的位置大小
    CGFloat labelW = 10.0;
    CGFloat labelH = 40.0;
    
    // 2.2.设置文本框的位置大小
    CGFloat textW = (self.view.bounds.size.width - kConst * 6 - labelW * 2) / 3;
    CGFloat textH = 40.0;
    CGFloat textY = 40.0;

    // 3.创建第一个文本框
    _number1 = [[UITextField alloc] initWithFrame:CGRectMake(kConst, textY, textW, textH)];
    _number1.borderStyle = UITextBorderStyleRoundedRect;
    _number1.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:_number1];
    
    // 4.创建加号标签
    UILabel *plusLabel = [[UILabel alloc] initWithFrame:CGRectMake(kConst * 2 + textW, textY, kConst, labelH)];
    plusLabel.text = @"+";
    [self.view addSubview:plusLabel];
    
    // 5.创建第二个文本框
    _number2 = [[UITextField alloc] initWithFrame:CGRectMake(kConst * 3 + textW + labelW, textY, textW, textH)];
    _number2.borderStyle = UITextBorderStyleRoundedRect;
    _number2.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:_number2];
    
    // 6.创建等于号标签
    UILabel *equalLabel = [[UILabel alloc] initWithFrame:CGRectMake(kConst * 4 +textW * 2 + labelW, textY, kConst, labelH)];
    equalLabel.text = @"=";
    [self.view addSubview:equalLabel];
    
    // 7.创建结果标签
    _resultTextField = [[UITextField alloc] initWithFrame:CGRectMake(kConst * 5 + textW *2 +labelW * 2, textY, textW, textH)];
    _resultTextField.borderStyle = UITextBorderStyleRoundedRect;
    _resultTextField.enabled = NO;
    [self.view addSubview:_resultTextField];
    
    // 8.创建一个按钮
    UIButton *plusButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [plusButton setTitle:@"计算" forState:UIControlStateNormal];
    
    // 8.1.计算按钮的位置大小
    CGFloat buttonW = 100.0;
    CGFloat buttonH = 40.0;
    CGFloat buttonX = (self.view.bounds.size.width - buttonW) * 0.5;
    CGFloat buttonY = 100;
    plusButton.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    
    // 8.2.给按钮添加点击事件
    [plusButton addTarget:self action:@selector(plusButtonClickAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:plusButton];
}

/**
 *  计算按钮点击事件
 */
- (void)plusButtonClickAction {
    // 1.计算结果
    CGFloat number1 = [_number1.text floatValue];
    CGFloat number2 = [_number2.text floatValue];
    
    if (0 == number1) {
        _number1.text = @"0";
    }
    
    if (0 == number2) {
        _number2.text = @"0";
    }
    
    _resultTextField.text = [NSString stringWithFormat:@"%.2f", number1 + number2];
    
    // 2.推出键盘
    // 方法一
    [self.view endEditing:YES];
    
    // 方法二
//    [_number1 resignFirstResponder];
//    [_number2 resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
