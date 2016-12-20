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
#import "TPEmotionCell.h"

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


@interface TPEmotionInputView () <UICollectionViewDelegate,UICollectionViewDataSource,TPEmotionToolBarDelegate,TPEmotionCellDlegate>
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
        
        self.backgroundColor = [UIColor redColor];
        _selectEmotionCallBack = selectEmotionBlock;
        [self prePareUI];
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:1];
        [_collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
        //更新pageControl
        
        
        [_toolBar selectSection:indexPath.section];
    }
    return self;
}



#pragma mark - UICollectionViewDelegate UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return [[TPEmotionToolManager shareManager] packages].count;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [[TPEmotionToolManager shareManager] numberPageInSection:section];
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    TPEmotionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[TPEmotionCell reuseID] forIndexPath:indexPath];
    
    cell.emotions = [[TPEmotionToolManager shareManager] emoticonsWithIndexPath:indexPath];
    cell.delegate = self;
    return cell;
}


#pragma mark - TPEmoticonCellDelegate
-(void)emotionCellDidSellectedEmotion:(TPEmotion *)emotion isRemoved:(BOOL)isRemoved{
    if (_selectEmotionCallBack != nil) {
        _selectEmotionCallBack(emotion,isRemoved);
    }
    
    //TODO: 添加最近使用的表情
}

#pragma mark - UIScrollView Delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint center = scrollView.center;
    center.x += scrollView.contentOffset.x;
    
    NSArray *indexPaths = [_collectionView indexPathsForVisibleItems];
    
    NSIndexPath *targetPath = nil;
    for (NSIndexPath *indexPath in indexPaths) {
        UICollectionViewCell *cell = [_collectionView cellForItemAtIndexPath:indexPath];
        
        if (CGRectContainsPoint(cell.frame, center)) {
            targetPath = indexPath;
            break;
        }
    }
    
    if (targetPath != nil) {
//        [self updatePageControlWithIndexPath:targetPath];
        [_toolBar selectSection:targetPath.section];
    }

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
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerClass:[TPEmotionCell class] forCellWithReuseIdentifier:[TPEmotionCell reuseID]];
    
    //设置pageControl
    _pageControl = [[UIPageControl alloc]init];
    [self addSubview:_pageControl];
    
    _pageControl.hidesForSinglePage = YES;
    _pageControl.userInteractionEnabled = NO;
    [_pageControl setValue:[UIImage tp_imageWithName:@"compose_keyboard_dot_selected"] forKey:@"_currentPageImage"];
    [_pageControl setValue:[UIImage tp_imageWithName:@"compose_keyboard_dot_normal"] forKey:@"pageImage"];
    
    //布局
    _pageControl.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_pageControl attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_toolBar attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_toolBar attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
    
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
