//
//  LLBusinessModel.m
//  高德 POI 检索
//
//  Created by liushaohua on 16/12/18.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import "LLBusinessModel.h"

@implementation LLBusinessModel

- (CLLocationCoordinate2D)coordinate{
    
    return CLLocationCoordinate2DMake(self.latitude, self.longitude);
}

- (NSString *)title{
    
    return self.name;
    
}

- (NSString *)subtitle {
    
    return self.address;
}




@end
