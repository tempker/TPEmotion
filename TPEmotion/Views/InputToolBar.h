//
//  InputToolBar.h
//  TPEmotcion
//
//  Created by WPF on 16/12/14.
//  Copyright © 2016年 Tempker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputTextField.h"
#import "ChatEmojiView.h"
@interface InputToolBar : UIView 


/** emoticonBtn   */
@property (nonatomic,strong) UIButton *emoticonBtn;

/** moreMediaBtn   */
@property (nonatomic,strong) UIButton *moreMediaBtn;

/** imageView   */
@property (nonatomic,strong) UIImageView *inputTextBkgImage;

/** textView   */
@property (nonatomic,strong) InputTextField *inputTextView;

/** chatEmojiView   */
@property (nonatomic,strong) ChatEmojiView *chatEmojiView;

@end
