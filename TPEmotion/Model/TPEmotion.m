//
//  TPEmotion.m
//  TPEmotion
//
//  Created by WPF on 16/12/15.
//  Copyright © 2016年 Tempker. All rights reserved.
//

#import "TPEmotion.h"

@implementation TPEmotion



- (NSString *)imagePath {
    
    if (_type == 1) {
        return nil;
    }
    
    return [NSString stringWithFormat:@"%@/%@", _directory, _png];
}

//- (void)setCode:(NSString *)code {
//    _emoji = code.hm_emoji;
//}

- (BOOL)isEmoji {
    return _emoji != nil;
}

#pragma mark - 构造函数
+ (instancetype)emoticonWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}

#pragma mark - 公共方法
- (NSDictionary *)dictionary {
    NSArray *keys = @[@"type", @"chs", @"directory", @"png", @"code", @"times"];
    
    return [self dictionaryWithValuesForKeys:keys];
}

@end
