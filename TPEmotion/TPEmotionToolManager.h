//
//  TPEmotionToolManager.h
//  TPEmotion
//
//  Created by WPF on 16/12/15.
//  Copyright © 2016年 Tempker. All rights reserved.
//

#import <Foundation/Foundation.h>
///表情工具类-------提供所有数据及处理逻辑

@interface TPEmotionToolManager : NSObject

///工具单例类
+(nonnull instancetype)shareManager;



/** 表情包数组   */
@property (nonatomic,strong,nonnull ) NSMutableArray *packages;





@end
