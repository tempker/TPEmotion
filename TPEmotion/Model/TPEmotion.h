//
//  TPEmotion.h
//  TPEmotion
//
//  Created by WPF on 16/12/15.
//  Copyright © 2016年 Tempker. All rights reserved.
//

#import <Foundation/Foundation.h>
//表情模型
@interface TPEmotion : NSObject

/// 表情类型 0 图片/1 emoji
@property (nonatomic, assign) NSInteger type;
/// 表情描述文字
@property (nonatomic, copy, nullable) NSString *chs;
/// 表情所在目录
@property (nonatomic, copy, nullable) NSString *directory;
/// 表情图片
@property (nonatomic, copy, nullable) NSString *png;
/// 图片表情路径
@property (nonatomic, readonly, nullable) NSString *imagePath;
/// emoji 编码
@property (nonatomic, copy, nullable) NSString *code;
/// emoji 字符串
@property (nonatomic, copy, nullable) NSString *emoji;
/// 是否 emoji
@property (nonatomic, readonly) BOOL isEmoji;
/// 使用次数
@property (nonatomic, assign) NSInteger times;

+ (nonnull instancetype)emoticonWithDict:(NSDictionary * _Nonnull)dict;

/// 保存使用的字典
- (NSDictionary * _Nonnull)dictionary;


@end
