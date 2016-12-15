//
//  InputToolBar.m
//  TPEmotcion
//
//  Created by WPF on 16/12/14.
//  Copyright © 2016年 Tempker. All rights reserved.
//

#import "InputToolBar.h"
#import "Masonry.h"
#import "UIView+Cateory.h"

#define kmagin 5

@interface InputToolBar () <UITextViewDelegate>

@end
@implementation InputToolBar 


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _inputTextView.delegate = self;
        [self addTextFieldNotification];
        [self setBackgroundColor: [UIColor whiteColor]];
        [self prepareUi];
    }
    return self;
}

-(void)prepareUi{
    
    _emoticonBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_emoticonBtn setImage:[UIImage imageNamed:@"emojiButton"] forState:UIControlStateNormal];
    [_emoticonBtn addTarget:self action:@selector(emoticonBtnClick:) forControlEvents:UIControlEventTouchDown];
    [_emoticonBtn sizeToFit];
    [self addSubview:_emoticonBtn];
    
    _inputTextBkgImage = [[UIImageView alloc]init];
    [_inputTextBkgImage setImage:[UIImage imageNamed:@"icon_input_text_bg"]];
    [self addSubview:_inputTextBkgImage];
    
    _inputTextView = [[InputTextField alloc]init];
    [self addSubview:_inputTextView];
    _moreMediaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_moreMediaBtn setImage:[UIImage imageNamed:@"upload_add"] forState:UIControlStateNormal];
    [self addSubview:_moreMediaBtn];
    
    [self addSubview:self.chatEmojiView];
}



-(void)layoutSubviews{
    [super layoutSubviews];
    //布局子控件
    [_emoticonBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.left.equalTo(self).offset(kmagin);
        make.top.equalTo(self).offset(kmagin);
    }];
    [_moreMediaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.right.equalTo(self).offset(-kmagin);
        make.top.equalTo(self).offset(kmagin);
    }];
    
    [_inputTextBkgImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(4);
        make.left.equalTo(self.emoticonBtn.mas_right).offset(2*kmagin);
        make.right.equalTo(self.moreMediaBtn.mas_left).offset(-2*kmagin);
//        make.bottom.equalTo(self).offset(-4);
        make.height.mas_equalTo(32);
    }];
    
    [_inputTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.inputTextBkgImage).offset(1);
        make.bottom.equalTo(self.inputTextBkgImage).offset(-1);
        make.right.equalTo(self.inputTextBkgImage).offset(-12);
        make.left.equalTo(self.inputTextBkgImage).offset(12);
        
    }];
    
    [_chatEmojiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(250);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.equalTo(self).offset(40);
    }];
}


- (void)addTextFieldNotification{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShowAction:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHideAction:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFiledEditChanged:)
                                                name:@"UITextViewTextDidChangeNotification"
                                              object:nil];
}



#pragma mark - notification
- (void)keyboardWillShowAction:(NSNotification *)notification {
    
    NSDictionary*info = [notification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    [UIView animateWithDuration:0.25 animations:^{
        self.y = [UIScreen mainScreen].bounds.size.height - kbSize.height - 40;
    }];
    
    self.chatEmojiView.hidden = YES;

}

-(void)keyboardWillHideAction:(NSNotification*)notification{
    
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.y = [UIScreen mainScreen].bounds.size.height - self.height + 250;
    }];
    
    
}

-(void)textFiledEditChanged:(NSNotification *)notification{
  
    NSLog(@"正在输入");
}


#pragma mark - 点击事件
-(void)emoticonBtnClick:(UIButton *)btn{
    
    NSLog(@"弹出表情键盘");
    
    [self.inputTextView resignFirstResponder];
    //弹出表情键盘
    _chatEmojiView.hidden = NO;
    [UIView animateWithDuration:0.25 animations:^{
        
        self.y = [UIScreen mainScreen].bounds.size.height - self.height;
    }];
    
    
    
}



#pragma mark - UITextViewDelegate
-(void)textViewDidBeginEditing:(UITextView *)textView{
    
    [textView becomeFirstResponder];
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    
    [textView resignFirstResponder];
}


-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"UITextViewTextDidChangeNotification" object:nil];
}



#pragma mark - 懒加载
-(ChatEmojiView *)chatEmojiView{
    
    if (!_chatEmojiView) {
        _chatEmojiView = [[ChatEmojiView alloc] init];
        _chatEmojiView.backgroundColor = [UIColor yellowColor];
        _chatEmojiView.hidden = YES;
        
    }
    return _chatEmojiView;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
