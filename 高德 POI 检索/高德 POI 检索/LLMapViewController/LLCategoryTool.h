//
//  LLCategoryTool.h
//  高德 POI 检索
//
//  Created by liushaohua on 16/12/18.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LLCategoryModel.h"

@interface LLCategoryTool : NSObject

//获取分类数据
+ (NSArray <LLCategoryModel *> *)getCategories;

//根据商户的分类名称 比对出其对应的图标名称
+ (NSString *)imgNameWithCategoryName:(NSString *)categoryName;


@end
