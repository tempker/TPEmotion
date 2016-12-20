//
//  TPEmotionBtn.h
//  TPEmotion
//
//  Created by WPF on 16/12/16.
//  Copyright © 2016年 Tempker. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TPEmotion;
///表情按钮
@interface TPEmotionBtn : UIButton

/** isDelected   */
@property (nonatomic,assign,getter=isDeletedBtn) BOOL deletedBtn;

/** emotion   */
@property (nonatomic,strong) TPEmotion *emotion;


+(instancetype)emotionBtnWithFrame:(CGRect)frame tag:(NSInteger)tag;
@end
