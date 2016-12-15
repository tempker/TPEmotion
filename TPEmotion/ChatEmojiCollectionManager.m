//
//  ChatEmojiCollectionManager.m
//  TPEmotion
//
//  Created by WPF on 16/12/15.
//  Copyright © 2016年 Tempker. All rights reserved.
//

#import "ChatEmojiCollectionManager.h"
#import "EmojiCollectionViewCell.h"

#define ITEM_COUNT      6
#define kItemMargin     ([UIScreen mainScreen].bounds.size.width  - 260 )/ 5 /2
@interface ChatEmojiCollectionManager ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation ChatEmojiCollectionManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:[EmojiCollectionViewCell class] forCellWithReuseIdentifier:[EmojiCollectionViewCell reuseID]];
        
    }
    return self;
}


-(void)setEmojiItemArray:(NSArray *)emojiItemArray{
    
    _emojiItemArray = emojiItemArray;
    [_collectionView reloadData];
    
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%@被单击了",indexPath);
}


#pragma mark - UICollectionViewDataSource

//定义展示的UICollectionViewCell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _emojiItemArray.count;
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    EmojiCollectionViewCell *cell = (EmojiCollectionViewCell*) [collectionView dequeueReusableCellWithReuseIdentifier:[EmojiCollectionViewCell reuseID] forIndexPath:indexPath];
    //传递给cell数据
    
    return cell;
}

#pragma mark --UICollectionViewDelegateFlowLayout
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(40, 40);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    CGFloat top =  kItemMargin;
    CGFloat left = kItemMargin;
    return UIEdgeInsetsMake(top, left, top, left);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    CGFloat doubleMargin = kItemMargin * 2;
    return doubleMargin ;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    CGFloat doubleMargin = kItemMargin * 2;
    return doubleMargin;
}
















@end
