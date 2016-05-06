//
//  bannerView.m
//  bannerView
//
//  Created by 丁贵强 on 16/3/22.
//  Copyright © 2016年 丁贵强. All rights reserved.
//

#import "bannerView.h"
#import "Masonry.h"

@implementation bannerView
{
    NSTimer * _timer;
}



/**
 *  当前播放的索引值
 */
static int countIndex = 0;



#pragma mark - Lazy load


#pragma mark getter

- (NSArray *)bannerList{
    if (!_bannerList) {
        _bannerList = [NSArray array];
    }
    return _bannerList;
}

#pragma mark - view lifecycle

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor  whiteColor];
        [self initContentView];
    }
    return  self;
}

- (void)layoutSubviews{
    [self.bannerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX).with.offset(0);
        make.centerY.mas_equalTo(self.mas_centerY).with.offset(0);
        make.height.mas_equalTo(@25);
    }];
}




#pragma mark - Private Methods

- (void)initContentView{
    
    self.bannerLabel = [UILabel new];
    self.bannerLabel.font = [UIFont systemFontOfSize:15.0];
    self.bannerLabel.text = @"即将播放广告";
    self.bannerLabel.textColor =[UIColor purpleColor];
    [self addSubview:self.bannerLabel];
    
    // 每2s 切换 广告标语
    _timer =  [NSTimer scheduledTimerWithTimeInterval:2.0f
                                               target:self
                                             selector:@selector(changeBanner)
                                             userInfo:nil
                                              repeats:YES];

}

/**
 *  切换 广告标语
 */
- (void)changeBanner{
    

    
    CATransition *anim = [CATransition animation];
    anim.delegate = self;
    anim.duration = 0.5f;
    anim.timingFunction = UIViewAnimationCurveEaseInOut;
    anim.fillMode = kCAFillModeForwards;
    anim.removedOnCompletion = YES;
    // type :fade moveIn push reveal
    //  cube
    anim.type = @"cube";
    // kCATransitionReveal;
    //@"cube";
    
    
    // key可以随意指定，可以为nil
    [self.bannerLabel.layer addAnimation:anim forKey:nil];
    
     self.bannerLabel.text = self.bannerList[countIndex];
    
    
    // 更新索引
    // 不是太安全，self.noticeList count]可能为0
    countIndex =(countIndex + 1)%[self.bannerList count];// wrap-around
    //   替代解决办法：
    //    countIndex++;
    //    if (countIndex >= [self.noticeList count]) {
    //        countIndex = 0;
    //    }
}

- (void)dealloc
{
    // purge resources
    
    self.bannerList = nil;
    self.bannerLabel = nil;
    
    // invalidate timer
    
    if ([_timer isValid]) {
        [_timer invalidate];
    }
}


@end
