//
//  XSPresenter.h
//  UnitTestDemo
//
//  Created by 李兴东 on 2018/4/7.
//  Copyright © 2018年 xingshao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XSModel.h"

@interface XSPresenter : NSObject

@property (nonatomic, strong) XSModel *model;
- (void)fetchDataWithIndexPath:(NSIndexPath *)indexPath withMarketType:(NSInteger)type success:(void(^)(XSModelData * responseObject))success fail:(void(^)(void))fail;

@end
