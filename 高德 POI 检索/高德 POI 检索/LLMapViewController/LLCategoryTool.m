//
//  LLCategoryTool.m
//  高德 POI 检索
//
//  Created by liushaohua on 16/12/18.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import "LLCategoryTool.h"
#import <YYModel.h>

static NSArray *_categories;

@implementation LLCategoryTool


//获取分类数据
+ (NSArray <LLCategoryModel *> *)getCategories{
    
    //获取分类数据  categories.plist 中
    NSArray *dictArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"categories.plist" ofType:nil]];
    //字典转模型   YYModel
    _categories = [NSArray yy_modelArrayWithClass:[LLCategoryModel class] json:dictArr];
    
    return _categories;
}


+ (NSString *)imgNameWithCategoryName:(NSString *)categoryName{
    //需要将返回数据的分类信息和 category.plist 中的分类的一级数据&二级数据分别比对,如果名称一致,则使用该分类对应的图片
    for (LLCategoryModel *category in [self getCategories]) {
        //比对一级数据
        
        if ([category.name isEqualToString:categoryName]) {
            return category.map_icon;
        }
        //比对二级数据
        for (NSString *subCategory in category.subcategories) {
            
            if ([subCategory isEqualToString:categoryName]) {
                
                return category.map_icon;
            }
        }
    }
    return @"ic_category_default";
}

@end
