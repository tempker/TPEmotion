//
//  EmojiCollectionViewCell.m
//  TPEmotion
//
//  Created by WPF on 16/12/15.
//  Copyright © 2016年 Tempker. All rights reserved.
//

#import "EmojiCollectionViewCell.h"

@implementation EmojiCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor brownColor];
    }
    return self;
}

+ (NSString *)reuseID{
    
    return NSStringFromClass([self class]);
}
@end
