//
//  ViewController.m
//  bannerView
//
//  Created by 丁贵强 on 16/3/22.
//  Copyright © 2016年 丁贵强. All rights reserved.
//

#import "ViewController.h"
#import "bannerView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    bannerView *bannerV = [[bannerView alloc]
                           initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 50)];
    bannerV.bannerList = @[@"北京好",@"江西是个好地方",@"上海也不错啊~"];
    [self.view addSubview:bannerV];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
