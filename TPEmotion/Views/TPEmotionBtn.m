//
//  TPEmotionBtn.m
//  TPEmotion
//
//  Created by WPF on 16/12/16.
//  Copyright © 2016年 Tempker. All rights reserved.
//

#import "TPEmotionBtn.h"
#import "UIImage+TPEmotion.h"
#import "TPEmotion.h"
@implementation TPEmotionBtn


-(void)setDeletedBtn:(BOOL)deletedBtn{
    _deletedBtn = deletedBtn;
    
    [self setImage:[UIImage tp_imageWithName:@"compose_emotion_delete"] forState:UIControlStateNormal];
    [self setImage:[UIImage tp_imageWithName:@"compose_emotion_delete_highlighted"] forState:UIControlStateHighlighted];
}

-(void)setEmotion:(TPEmotion *)emotion{
    _emotion = emotion;
    
    self.hidden = (emotion == nil);
    [self setImage:[UIImage tp_imageWithName:emotion.imagePath] forState:UIControlStateNormal];
    [self setTitle:emotion.emoji forState:UIControlStateNormal];
}

//构造函数
+(instancetype)emotionBtnWithFrame:(CGRect)frame tag:(NSInteger)tag{
    TPEmotionBtn *btn = [[TPEmotionBtn alloc]initWithFrame:frame];
    
    btn.tag = tag;
    return btn;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.font = [UIFont systemFontOfSize:32];
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 4, 0, 0);
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
