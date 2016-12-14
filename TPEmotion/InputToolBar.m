//
//  InputToolBar.m
//  TPEmotcion
//
//  Created by WPF on 16/12/14.
//  Copyright © 2016年 Tempker. All rights reserved.
//

#import "InputToolBar.h"
#import "Masonry.h"

#define kmagin 5
@implementation InputToolBar


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor: [UIColor whiteColor]];
        [self prepareUi];
    }
    return self;
}

-(void)prepareUi{
    
    _emoticonBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_emoticonBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [_emoticonBtn sizeToFit];
    [self addSubview:_emoticonBtn];
    
    _inputTextBkgImage = [[UIImageView alloc]init];
    [_inputTextBkgImage setImage:[UIImage imageNamed:@""]];
    [self addSubview:_inputTextBkgImage];
    
    _inputTextView = [[UITextField alloc]init];
    _inputTextView.placeholder = @"请输入内容";
    [self addSubview:_inputTextView];
    
    _moreMediaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_moreMediaBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [self addSubview:_moreMediaBtn];
}



-(void)layoutSubviews{
    [super layoutSubviews];
    //布局子控件
    
    [_emoticonBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.left.equalTo(self).offset(kmagin);
        make.top.equalTo(self).offset(kmagin);
    }];
    [_moreMediaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.right.equalTo(self).offset(kmagin);
        make.top.equalTo(self).offset(kmagin);
    }];
    
    [_inputTextBkgImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self).offset(kmagin);
        make.left.equalTo(self.emoticonBtn).offset(kmagin);
        make.right.equalTo(self.moreMediaBtn).offset(kmagin);
        make.bottom.equalTo(self).offset(kmagin);
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
