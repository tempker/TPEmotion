//
//  UIImage+TPEmotion.m
//  TPEmotion
//
//  Created by WPF on 16/12/15.
//  Copyright © 2016年 Tempker. All rights reserved.
//

#import "UIImage+TPEmotion.h"
#import "NSBundle+TPEmotion.h"
@implementation UIImage (TPEmotion)

+(UIImage *)tp_imageWithName:(NSString *)imageName{
    
    return [UIImage imageNamed:imageName inBundle:[NSBundle tp_emotionBundle] compatibleWithTraitCollection:nil];
    

}


@end
