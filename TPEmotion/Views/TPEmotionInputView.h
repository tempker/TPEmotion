//
//  TPEmotionInputView.h
//  TPEmotion
//
//  Created by WPF on 16/12/15.
//  Copyright © 2016年 Tempker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TPEmotionToolManager.h"
#import "TPEmotion.h"
@interface TPEmotionInputView : UIView



/**
 使用选中表情实例化输入视图

 @param selectEmotionBlock 选中表情的回调(表情,是否删除)
 @return 表情输入视图
 */
-(instancetype)initWitSelectedEmotion:(void(^)(TPEmotion *emotion , BOOL isRemoved))selectEmotionBlock;

@end
