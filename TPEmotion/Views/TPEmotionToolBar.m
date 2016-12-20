//
//  TPEmotionToolBar.m
//  TPEmotion
//
//  Created by WPF on 16/12/15.
//  Copyright © 2016年 Tempker. All rights reserved.
//

#import "TPEmotionToolBar.h"
#import "TPEmotionToolManager.h"
#import "UIImage+TPEmotion.h"
#import "UIView+Cateory.h"
static NSInteger TPEmotinToolBarButtonValue = 1000;
@interface TPEmotionToolBar ()
{
    //当前选中的btn
    UIButton *_selectBtn;

}


/** containView   */
@property (nonatomic,strong) UIScrollView *containView;

/** sendBtn   */
@property (nonatomic,strong) UIButton *sendBtn;


/** btnArray   */
@property (nonatomic,strong) NSMutableArray *btnArray;

@end

@implementation TPEmotionToolBar


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self prepareUI];
    }
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self prepareUI];
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGRect rect = self.bounds;
    CGFloat w = rect.size.width;
    self.containView.frame = CGRectMake(0, 0, w/4*3, rect.size.height);
    self.sendBtn.frame = CGRectMake(w/4*3, 0, w/4, rect.size.height);
    //布containView局子控件
    self.containView.contentSize = CGSizeMake([[TPEmotionToolManager shareManager] packages].count * w /4, 0);
    
    NSInteger index = 0;
    for (UIButton *btn in self.btnArray) {
        CGFloat btnW = self.containView.width /self.btnArray.count;
        CGFloat x = btnW * index;
        btn.frame = CGRectMake(x, 0, btnW, self.height);
    }
}

#pragma mark - 公共方法
- (void)selectSection:(NSInteger)section {
    UIButton *button = [self viewWithTag:(section + TPEmotinToolBarButtonValue)];
    
    [self selectedButtonWithButton:button];
}




#pragma mark - self prepareUI

-(void)prepareUI{
    
    _containView = [[UIScrollView alloc]init];
    [self addSubview:_containView];
    NSInteger index = 0;
    for (TPEmotionPackage *package in [[TPEmotionToolManager shareManager] packages]) {
        [self addChildButtonWith:package.groupName bgImageName:package.bgImageName type:index++];
    }
}

-(void)addChildButtonWith:(NSString *)title bgImageName:(NSString *)bgImageName type:(NSInteger)type{
    
    
    UIButton *btn = [[UIButton alloc]init];
    
    [self.btnArray addObject:btn];
    btn.tag = type + TPEmotinToolBarButtonValue;
    
    [btn setTitle:title forState:UIControlStateNormal];
    //
    
    NSString *imageName = [NSString stringWithFormat:@"compose_emotion_table_%@_normal", bgImageName];
    NSString *imageNameSL = [NSString stringWithFormat:@"compose_emotion_table_%@_selected", bgImageName];
    [btn setBackgroundImage:[UIImage tp_imageWithName:imageName] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage tp_imageWithName:imageNameSL] forState:UIControlStateSelected];
    
    
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.containView addSubview:btn];
}


#pragma mark - 监听点击事件
/// 将指定的按钮设置为选中按钮
- (void)selectedButtonWithButton:(UIButton *)button {
    button.selected = !button.selected;
    _selectBtn.selected = !_selectBtn.selected;
    _selectBtn = button;
}

-(void)btnClick:(UIButton*)button{
    
    if (button == _selectBtn) {
        return;
    }

    button.selected = !button.selected;
    _selectBtn.selected = !_selectBtn.selected;
    
    if ([self.delegate respondsToSelector:@selector(emotionToolBarSelectSection:)]) {
        
        [self.delegate emotionToolBarSelectSection:button.tag - TPEmotinToolBarButtonValue];
    }
    
}


#pragma mark - 懒加载
-(UIScrollView *)containView{
    
    if (!_containView) {
        _containView = [[UIScrollView alloc]init];
    }
    return _containView;
}


-(NSMutableArray *)btnArray{
    if (!_btnArray) {
        _btnArray = [[NSMutableArray alloc]init];
    }
    return  _btnArray;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
