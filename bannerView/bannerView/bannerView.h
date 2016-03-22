//
//  bannerView.h
//  bannerView
//
//  Created by 丁贵强 on 16/3/22.
//  Copyright © 2016年 丁贵强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface bannerView : UIView

// 用来展示滚动播放的Label
@property (nonatomic,strong) UILabel *bannerLabel;
// 数据源
@property (nonatomic,strong) NSArray *bannerList;

@end
