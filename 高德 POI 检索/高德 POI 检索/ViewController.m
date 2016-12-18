//
//  ViewController.m
//  高德 POI 检索
//
//  Created by liushaohua on 16/12/18.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import "ViewController.h"
#import "LLMapViewController.h"




@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)searchBtn:(id)sender {
    
    LLMapViewController *mapV = [[LLMapViewController alloc]init];
    [self.navigationController pushViewController:mapV animated:YES];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
