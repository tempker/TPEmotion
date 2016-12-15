//
//  ChatEmojiCollectionManager.h
//  TPEmotion
//
//  Created by WPF on 16/12/15.
//  Copyright © 2016年 Tempker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ChatEmojiCollectionManager : NSObject


/** collectionView   */
@property (nonatomic,strong) UICollectionView *collectionView;


/** emojiArray   */
@property (nonatomic,strong) NSArray *emojiItemArray;


@end
