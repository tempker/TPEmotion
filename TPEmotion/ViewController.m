//
//  ViewController.m
//  TPEmotion
//
//  Created by WPF on 16/12/14.
//  Copyright © 2016年 Tempker. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Cateory.h"
#import "TPEmotionInputView.h"
@class TPEmotion;
@interface ViewController ()
{
    TPEmotionInputView *_emotionInputView;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self prepareUI];
    _emotionInputView.y = 100;
    [self.view addSubview:_emotionInputView];
}

-(void)prepareUI{
    
    __weak typeof (self) weakSelf = self;
    
  _emotionInputView = [[TPEmotionInputView alloc] initWitSelectedEmotion:^(TPEmotion *emotion, BOOL isRemoved) {
      
      [weakSelf insertEmoticon:emotion isRemoved:isRemoved];
    }];
    
}


- (void)insertEmoticon:(TPEmotion *)emoticon isRemoved:(BOOL)isRemoved {
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
