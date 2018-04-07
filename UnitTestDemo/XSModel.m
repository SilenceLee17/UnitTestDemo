//
//  XSModel.m
//  UnitTestDemo
//
//  Created by 李兴东 on 2018/4/7.
//  Copyright © 2018年 xingshao. All rights reserved.
//

#import "XSModel.h"

@implementation XSModelData
@end


@implementation XSModel

- (void)getData:(NSObject *)params success:(void(^)(XSModelData * responseObject))success fail:(void(^)(void))fail{
    if (params) {
        if (success) {
            XSModelData *data = [XSModelData new];
            data.name = NSStringFromClass([params class]);
            success(data);
        }
    }else{
        if (fail) {
            fail();
        }
    }
}

@end
