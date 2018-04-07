//
//  XSModel.h
//  UnitTestDemo
//
//  Created by 李兴东 on 2018/4/7.
//  Copyright © 2018年 xingshao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XSModelData: NSObject

@property (nonatomic, copy)NSString *name;

@end

@interface XSModel : NSObject

- (void) getData:(NSObject *)params
         success:(void(^)(XSModelData * responseObject))success
            fail:(void(^)(void))fail;
@end
