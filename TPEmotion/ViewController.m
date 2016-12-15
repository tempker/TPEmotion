//
//  ViewController.m
//  TPEmotion
//
//  Created by WPF on 16/12/14.
//  Copyright © 2016年 Tempker. All rights reserved.
//

#import "ViewController.h"
#import "InputToolBar.h"
#import "UIView+Cateory.h"
@interface ViewController ()


/** ToolBar   */
@property (nonatomic,strong) InputToolBar *toolBar;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _toolBar = [[InputToolBar alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,290)];
    
    _toolBar.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_toolBar];
}

-(void)viewWillLayoutSubviews{
    
    _toolBar.y = self.view.height - 40;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.toolBar.inputTextView resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
