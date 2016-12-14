//
//  ChatEmojiView.m
//  TPEmotion
//
//  Created by WPF on 16/12/14.
//  Copyright © 2016年 Tempker. All rights reserved.
//

#import "ChatEmojiView.h"
#import "Masonry.h"
#import "UIView+Cateory.h"
@interface ChatEmojiView ()


/** uiscrollView   */
@property (nonatomic,strong) UIScrollView *scrollView;


/** pageContrl   */
@property (nonatomic,strong) UIPageControl *pageControl;


/** sendView   */
@property (nonatomic,strong) UIView *sendView;


/** uiscrollView   */
@property (nonatomic,strong) UIScrollView *emojiClassScrollView;


/** sendBtn   */
@property (nonatomic,strong) UIButton *sendBtn;
@end
@implementation ChatEmojiView



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self prepareUi];
    }
    return self;
}


-(void)prepareUi{
    
    
    _pageControl.numberOfPages = 2;
    _scrollView = [[UIScrollView alloc]init];
    
    _scrollView.backgroundColor = [UIColor redColor];
    [self addSubview:_scrollView];
    
    _pageControl = [[UIPageControl alloc]init];
    [_pageControl setBackgroundColor:[UIColor clearColor]];
    [_pageControl setAutoresizesSubviews:YES];
    [_pageControl setAutoresizingMask:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)];
    _pageControl.pageIndicatorTintColor = [UIColor grayColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor darkGrayColor];
    [_pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_pageControl];
    
    _sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_sendBtn setBackgroundImage:[UIImage imageNamed:@"emoji_send_button"] forState:UIControlStateNormal];
    [_sendBtn setBackgroundImage:[UIImage imageNamed:@"emoji_send_button_hover"] forState:UIControlStateHighlighted];
    [_sendBtn setTitle:@"发送" forState: UIControlStateNormal];
    _sendBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_sendBtn addTarget:self action:@selector(onSendButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_sendBtn];
    
    _emojiClassScrollView = [[UIScrollView alloc]init];
    _emojiClassScrollView.backgroundColor = [UIColor greenColor];
    [self addSubview:_emojiClassScrollView];
    
    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.mas_equalTo(self.height/8*7);
    }];
    
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.scrollView);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.mas_equalTo(self.height / 8);
    }];
    
    [_emojiClassScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.scrollView);
        make.left.equalTo(self);
        make.right.equalTo(self).offset(-50);
        make.height.mas_equalTo(self.height / 8);
    }];
    
    [_sendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.scrollView);
        make.left.equalTo(self.emojiClassScrollView);
        make.bottom.equalTo(self);
        make.width.mas_equalTo(50);
    }];
    
    
}




#pragma mark - click
-(void)onSendButton:(UIButton*)btn{
    
    NSLog(@"点击了发送按钮");
}


-(void)changePage:(UIPageControl *)pageControl{
    
    NSLog(@"点击了Page");
}











/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
