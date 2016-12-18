//
//  LLBusinessModel.h
//  高德 POI 检索
//
//  Created by liushaohua on 16/12/18.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface LLBusinessModel : NSObject<MKAnnotation>

/** 商户名*/
@property (nonatomic, copy) NSString * _Nullable name;

/** 地址*/
@property (nonatomic, copy) NSString * _Nullable address;

/** 纬度坐标*/
@property (nonatomic, assign) CGFloat latitude;

/** 经度坐标*/
@property (nonatomic, assign) CGFloat longitude;

/** 分类*/
@property (nonatomic, strong) NSArray * _Nullable categories;

#pragma mark - 可以直接在此遵守协议 成为大头针模型

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

@property (nonatomic, readonly, copy, nullable) NSString *title;

@property (nonatomic, readonly, copy, nullable) NSString *subtitle;




@end
