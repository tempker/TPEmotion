//
//  TPEmotionInputView.m
//  TPEmotion
//
//  Created by WPF on 16/12/15.
//  Copyright © 2016年 Tempker. All rights reserved.
//

#import "TPEmotionInputView.h"
#import "TPEmotionToolBar.h"
#import "UIImage+TPEmotion.h"
@interface TPEmotionInputViewLayout : UICollectionViewFlowLayout

@end


@implementation TPEmotionInputViewLayout

-(void)prepareLayout{
    [super prepareLayout];
    
    self.itemSize = self.collectionView.bounds.size;
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView.pagingEnabled = NO;
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
}

@end


@interface TPEmotionInputView () <UICollectionViewDelegate,UICollectionViewDataSource,TPEmotionToolBarDelegate>
{
    UICollectionView *_collectionView;
    TPEmotionToolBar *_toolBar;
    UIPageControl *_pageControl;
    void(^_selectEmotionCallBack)(TPEmotion *emotion ,BOOL isRemoved);
    
}

@end

@implementation TPEmotionInputView

-(instancetype)initWitSelectedEmotion:(void(^)(TPEmotion *emotion , BOOL isRemoved))selectEmotionBlock{
    CGRect frame = [UIScreen mainScreen].bounds;
    frame.size.height = 216;

    self = [super initWithFrame:frame];
    if (self) {
        _selectEmotionCallBack = selectEmotionBlock;
        [self prePareUI];
        
    }
    
    
    return self;
}



#pragma mark - UI
-(void)prePareUI{
    
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage tp_imageWithName:@"emoticon_keyboard_background"]];
    
    //添加工具栏
    _toolBar = [[TPEmotionToolBar alloc]init];
    [self addSubview:_toolBar];
    
    //设置工具栏位置
    // 设置工具栏位置 y  height
    CGFloat toolbarHeight = 42;
    CGRect toolbarRect = self.bounds;
    toolbarRect.origin.y = toolbarRect.size.height - toolbarHeight;
    toolbarRect.size.height = toolbarHeight;
    _toolBar.frame = toolbarRect;
    
    _toolBar.delegate = self;
    
    //设置collectionView
    
    CGRect collectionViewRect = self.bounds;
    collectionViewRect.size.height -= toolbarHeight;
    _collectionView = [[UICollectionView alloc]initWithFrame:collectionViewRect collectionViewLayout:[[TPEmotionInputViewLayout alloc]init]];
    
    [self addSubview:_collectionView];
    
    //设置collectionView
    
    
    //设置pageControl
    
    
    //布局
    
    
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
