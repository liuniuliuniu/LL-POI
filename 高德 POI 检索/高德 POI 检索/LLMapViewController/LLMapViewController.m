//
//  LLMapViewController.m
//  高德 POI 检索
//
//  Created by liushaohua on 16/12/18.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import "LLMapViewController.h"
#import "LLBusinessModel.h"
#import <MapKit/MapKit.h>
#import "DPRequest.h"
#import "DPAPI.h"
#import <YYModel.h>
#import "LLCategoryTool.h"

static NSString *identifier = @"anno";

@interface LLMapViewController ()<DPRequestDelegate,MKMapViewDelegate>
// 位置管理者
@property (nonatomic, strong)CLLocationManager *mgr;

@property (nonatomic, strong)MKMapView *mapView;

//纬度
@property (nonatomic, assign) CGFloat latitude;
//经度
@property (nonatomic, assign) CGFloat longitude;


//当前分类
//@property (nonatomic, copy) NSString *currentCategoryName;


@end

@implementation LLMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"地图";
    
    [self setupMapView];
    
}
- (void)setupMapView{
    
    self.mapView = [MKMapView new];
    [self.view addSubview:self.mapView];
    self.mapView.frame = self.view.bounds;
    
    // 请求授权
    self.mgr = [CLLocationManager new];
    [self.mgr requestWhenInUseAuthorization];
    
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
    // 监听地图区域的变化  设置代理
    self.mapView.delegate = self;
    
}


#pragma mark - MKMapViewDelegate

//当地图的区域发生变化后调用
- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    //获取地图中心点的经纬度
    self.latitude = mapView.region.center.latitude;
    self.longitude = mapView.region.center.longitude;
    //进行网络请求
    [self requestDataFromDPAPI];
}



#pragma mark - 网络请求

- (void)requestDataFromDPAPI{

    //设置参数  周边的经纬度
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    //设置经纬度   发送的是地图的中心点
    [param setValue:@(self.latitude) forKey:@"latitude"];
    [param setValue:@(self.longitude) forKey:@"longitude"];
    
    //限定条数 条数太多会卡 限制一些个数
    [param setValue:@10 forKey:@"limit"];
    
    //设置分类参数
//    [param setValue:self.currentCategoryName forKey:@"category"];
    //进行请求
    [[DPAPI new] requestWithURL:@"v1/business/find_businesses" params:param delegate:self];


}


//得到结果后调用
- (void)request:(DPRequest *)request didFinishLoadingWithResult:(id)result{
    
    //获取数据
    NSArray *dictArr = result[@"businesses"];
    NSArray *businesses = [NSArray yy_modelArrayWithClass:[LLBusinessModel class] json:dictArr ];
    
    NSLog(@"%zd",businesses.count);
    
    //添加大头针模型  查了资料发现遵守    MKAnnotation 协议的对象都可以作为大头针模型添加到地图上 所以可以用地图模型遵守协议
    for (LLBusinessModel *business in businesses) {
    
        [self.mapView addAnnotation:business];
    }
}

// 点击选中的是哪一个大头针
- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    
    NSLog(@"%zd",mapView.centerCoordinate);
    

}




@end
