//
//  TPEmotionPackage.m
//  TPEmotion
//
//  Created by WPF on 16/12/15.
//  Copyright © 2016年 Tempker. All rights reserved.
//

#import "TPEmotionPackage.h"
#import "NSBundle+TPEmotion.h"
#import "TPEmotion.h"
@implementation TPEmotionPackage

+(nonnull instancetype)packageWithDict:(NSDictionary * _Nonnull)dict{
    
    return [[self alloc]initWithDict:dict];
}
-(nonnull instancetype)initWithDict:(NSDictionary * _Nonnull)dict{
    
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        
        //创建表情包数组
        _emoticonsList = [[NSMutableArray alloc]init];
        
        if (dict != nil) {
            NSString *fileName = [NSString stringWithFormat:@"%@/info.plist", _directory];
            NSString *path = [[NSBundle tp_emotionBundle] pathForResource:fileName ofType:nil];
            NSArray *array = [NSArray arrayWithContentsOfFile:path];
            
            for (NSDictionary *dict in array) {
                //还需要一个emotion模型
                [_emoticonsList addObject:[TPEmotion emoticonWithDict:dict]];
                //逻辑:每添加一个 就是lastObject 
                _emoticonsList.lastObject.directory = _directory;
                
            }
        }
    }
    
    return self;
}
@end
