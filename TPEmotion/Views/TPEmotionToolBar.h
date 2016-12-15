//
//  TPEmotionToolBar.h
//  TPEmotion
//
//  Created by WPF on 16/12/15.
//  Copyright © 2016年 Tempker. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  TPEmotionToolBarDelegate <NSObject>

//传递secton 让collectionView进行切换
-(void)emotionToolBarSelectSection:(NSInteger)section;

@required


@end

///下面的图片包分类
@interface TPEmotionToolBar : UIView


-(void)selectPackageSection:(NSInteger )section;

/** delegate   */
@property (nonatomic,weak) id<TPEmotionToolBarDelegate> delegate;


@end
