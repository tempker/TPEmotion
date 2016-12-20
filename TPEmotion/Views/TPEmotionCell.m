//
//  TPEmotionCell.m
//  TPEmotion
//
//  Created by WPF on 16/12/16.
//  Copyright © 2016年 Tempker. All rights reserved.
//

#import "TPEmotionCell.h"
#import "TPEmotionBtn.h"
@implementation TPEmotionCell
{
    UILabel *_recentLabel;
    TPEmotionBtn *_deleteBtn;
    
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self prepareUI];
    }
    return self;
}


#pragma mark - 设置数据
-(void)setEmotions:(NSArray<TPEmotion *> *)emotions{
    _emotions = emotions;
    
    NSInteger index = 0;
    
    for (TPEmotion *emotion in emotions) {
        TPEmotionBtn *btn = self.contentView.subviews[index ++];
        //传递数据
        btn.emotion = emotion;
    }
}


-(void)setIndexPath:(NSIndexPath *)indexPath{
    
    _indexPath = indexPath;
    //
    _recentLabel.hidden = indexPath.section != 0;
}

#pragma mark - UI
-(void)prepareUI{

        NSInteger rowCount = 3;
        NSInteger colCount = 7;
        
        CGFloat leftMargin = 8;
        CGFloat bottomMargin = 20;
        
        CGFloat w = ceil((self.bounds.size.width - 2 * leftMargin) / colCount);
        CGFloat h = ceil((self.bounds.size.height - bottomMargin) / rowCount);
        
        for (NSInteger i = 0; i < 21; i++) {
            NSInteger col = i % colCount;
            NSInteger row = i / colCount;
            
            CGRect rect = CGRectMake(col * w + leftMargin, row * h, w, h);
            TPEmotionBtn *button = [TPEmotionBtn emotionBtnWithFrame:rect tag:i];
            
//            button.backgroundColor = [UIColor redColor];
            [self.contentView addSubview:button];
            
            [button addTarget:self
                       action:@selector(clickEmoticonButton:)
             forControlEvents:UIControlEventTouchUpInside];
        }
    // 删除按钮
    _deleteBtn = ((TPEmotionBtn *)self.contentView.subviews.lastObject);
    _deleteBtn.deletedBtn = YES;
    
    // 提示视图
//    _tipView = [[HMEmoticonTipView alloc] init];
    
    _recentLabel = [[UILabel alloc] init];
    _recentLabel.text = @"最近使用的表情";
    _recentLabel.textColor = [UIColor lightGrayColor];
    _recentLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:_recentLabel];
    
    _recentLabel.translatesAutoresizingMaskIntoConstraints = false;
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_recentLabel
                                                                 attribute:NSLayoutAttributeCenterX
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeCenterX
                                                                multiplier:1
                                                                  constant:0]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_recentLabel
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1
                                                                  constant:-5]];
    
}

- (void)clickEmoticonButton:(TPEmotionBtn *)button {
    
    if ([_delegate respondsToSelector:@selector(emotionCellDidSellectedEmotion:isRemoved:)]) {
        [_delegate emotionCellDidSellectedEmotion:button.emotion isRemoved:button.isDeletedBtn];
    }
}


+ (NSString *)reuseID{
    
    return NSStringFromClass([self class]);
}


@end
