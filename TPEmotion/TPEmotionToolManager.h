//
//  TPEmotionToolManager.h
//  TPEmotion
//
//  Created by WPF on 16/12/15.
//  Copyright © 2016年 Tempker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TPEmotionPackage.h"
///表情工具类-------提供所有数据及处理逻辑

@interface TPEmotionToolManager : NSObject

///工具单例类
+(instancetype)shareManager;



/** 表情包数组   */
@property (nonatomic,strong,) NSMutableArray <TPEmotionPackage *>*packages;




#pragma mark - 数据源方法

/**
 返回每一个section中所包含的表情页数

 @param section 表情分组的下标
 
 @return 对应的页数
 */
-(NSInteger)numberPageInSection:(NSInteger)section;


-(NSArray *)emoticonsWithIndexPath:(NSIndexPath *)indexPath;




@end
