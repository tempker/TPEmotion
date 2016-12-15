//
//  UIImage+TPEmotion.h
//  TPEmotion
//
//  Created by WPF on 16/12/15.
//  Copyright © 2016年 Tempker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (TPEmotion)


/**
 从bundle中取出图片

 @param imageName imageName
 @return 返回一张图片
 */
+(UIImage *)tp_imageWithName:(NSString *)imageName;

@end
