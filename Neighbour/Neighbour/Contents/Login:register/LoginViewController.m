//
//  LoginViewController.m
//  Neighbour
//
//  Created by apple on 15/11/4.
//  Copyright (c) 2015年 com.zhoudao. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *myScroll;

/**
 *  是否是电话
 */
@property (nonatomic, assign) BOOL isPhoneNum;

@property (weak, nonatomic) IBOutlet UITextField *phoneNum;
@property (weak, nonatomic) IBOutlet UITextField *verification;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

/**
 *  用于判断是否删除
 */
@property (nonatomic, assign) int count;
/**
 *  记录登陆/注册按钮的原始坐标
 */
@property (nonatomic, assign) CGRect btnRect;
/**
 *  记录密码框的原始坐标
 */
@property (nonatomic, assign) CGRect passWordRect;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     *  记录原始坐标
     */
    _btnRect = _loginBtn.frame;
    _passWordRect = _passWord.frame;
    [_phoneNum addTarget:self action:@selector(phoneNumValueChange:) forControlEvents:UIControlEventEditingChanged];
    
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow) name:UIKeyboardWillShowNotification object:nil];
}

//- (void)keyboardWillShow
//{
//    _myScroll.contentSize = self.view.frame.size;
//    CGRect rect = _myScroll.frame;
//    rect.size.height -= 200;
//    _myScroll.frame = rect;
//}

- (void)phoneNumValueChange:(UITextField *)textField
{
    /**
     *  用于限制格式为:111 1111 1111
     */
    if ((textField.text.length == 4 || textField.text.length == 9) && _count < textField.text.length) {
        NSMutableString *str = [NSMutableString stringWithString:textField.text];
        [str insertString:@" " atIndex:textField.text.length - 1];
        textField.text = str;
        _count ++;
    }
    if (_count < textField.text.length) {
        _count ++;
    }
    else {
        _count --;
        if (_count == 9 || _count == 4) {
            _count --;
            textField.text = [textField.text substringToIndex:_count];
        }
    }
    
    
    /**
     *  判断注册/登陆
     */
    if (textField.text.length >= 13) {
        textField.text = [textField.text substringToIndex:13];
        _count = (int)textField.text.length;
        if ([textField.text isEqualToString:@"132 0700 4141"]) {
            /**
             *  是账号
             */
            if (_passWord.hidden == YES) {
                CGRect rect = _btnRect;
                rect.origin.y += 50;
                _loginBtn.frame = rect;
                
                CGRect rect1 = _passWord.frame;
                rect1.origin.y -= 50;
                _passWord.frame = rect1;
                
                [_loginBtn setTitle:@"登陆" forState:UIControlStateNormal];

            }
            _passWord.hidden = NO;
        }
        else {
            /**
             *  不是账号
             */
            CGRect rect = _btnRect;
            rect.origin.y += 100;
            _passWord.frame = _passWordRect;
            _loginBtn.frame = rect;
            _verification.hidden = NO;
            _passWord.hidden = NO;
            [_loginBtn setTitle:@"注册" forState:UIControlStateNormal];

        }
    }
    else {
        /**
         *  不是11位,注册
         */
        _passWord.hidden = YES;
        _verification.hidden = YES;
        _passWord.frame = _passWordRect;
        _loginBtn.frame = _btnRect;
        [_loginBtn setTitle:@"登陆/注册" forState:UIControlStateNormal];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
