//
//  TPEmotionToolManager.m
//  TPEmotion
//
//  Created by WPF on 16/12/15.
//  Copyright © 2016年 Tempker. All rights reserved.
//

#import "TPEmotionToolManager.h"
#import "NSBundle+TPEmotion.h"

static NSInteger kEmitionCountOfPage = 20;
@implementation TPEmotionToolManager


#pragma mark - 单例 & 构造函数
+(instancetype)shareManager {
    static id instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        _packages = [NSMutableArray array];
        
        [self loadPackages];
    }
    return self;
}



#pragma mark - 加载表情包数据
-(void)loadPackages{
    
    //先获取有几种表情包
    NSString *path = [[NSBundle tp_emotionBundle] pathForResource:@"emoticons.plist" ofType:nil];
    NSArray *emotionPackages = [NSArray arrayWithContentsOfFile:path];
    
    for (NSDictionary *dict in emotionPackages) {
        
        //包表情包装进_packages 里面  字典转模型
        [_packages addObject:[TPEmotionPackage packageWithDict:dict]];
    }
    
}



#pragma mark - 数据源方法
-(NSInteger)numberPageInSection:(NSInteger)section{
    
    TPEmotionPackage *package = _packages[section];
    
    return ((NSInteger)package.emoticonsList.count - 1 ) /kEmitionCountOfPage + 1;
    
}


-(NSArray *)emoticonsWithIndexPath:(NSIndexPath *)indexPath{
    
    TPEmotionPackage *package = self.packages[indexPath.section];
    
    NSInteger location = indexPath.item * kEmitionCountOfPage;
    NSInteger length = kEmitionCountOfPage;
    
    //判断是否越界
    if ((location + length) > package.emoticonsList.count)  {
        length = package.emoticonsList.count - location;
    }
    NSRange range = NSMakeRange(location, length);
    
    return [package.emoticonsList subarrayWithRange:range];
}






@end
