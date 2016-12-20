//
//  TPEmotionCell.h
//  TPEmotion
//
//  Created by WPF on 16/12/16.
//  Copyright © 2016年 Tempker. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TPEmotion;


@protocol TPEmotionCellDlegate <NSObject>

/**
 选中表情

 @param emotion 选中的表情
 @param isRemoved 是否是删除按钮
 */
-(void)emotionCellDidSellectedEmotion:(TPEmotion *)emotion isRemoved:(BOOL)isRemoved;

@end
/// 表情页cell  每个表情页包含20个表情和一个删除按钮
@interface TPEmotionCell : UICollectionViewCell


/** emojiArray   */
@property (nonatomic,strong) NSArray<TPEmotion *> *emotions;


/** delegate   */
@property (nonatomic,weak) id<TPEmotionCellDlegate> delegate;

/** cell对应的IndexPath   */
@property (nonatomic,assign)NSIndexPath * indexPath ;


+ (NSString *)reuseID;

@end
