//
//  NSBundle+TPEmotion.m
//  TPEmotion
//
//  Created by WPF on 16/12/15.
//  Copyright © 2016年 Tempker. All rights reserved.
//

#import "NSBundle+TPEmotion.h"
#import "ChatEmojiView.h"


NSString *const TPEmotionBundleName = @"TPEmoticon.bundle";
@implementation NSBundle (TPEmotion)

+(nonnull instancetype)tp_emotionBundle{
    
    NSBundle *bundle = [NSBundle bundleForClass:[ChatEmojiView class]];
    NSString *bundlePath = [bundle pathForResource:TPEmotionBundleName ofType:nil];
    
    return [NSBundle bundleWithPath:bundlePath];
    
}

@end
