//
//  XSPresenter.m
//  UnitTestDemo
//
//  Created by 李兴东 on 2018/4/7.
//  Copyright © 2018年 xingshao. All rights reserved.
//

#import "XSPresenter.h"

@interface XSPresenter()

@property (strong , nonatomic) NSMutableArray * cachelist;

@end

@implementation XSPresenter

- (instancetype)init{
    self = [super init];
    if (self) {
        _cachelist = [NSMutableArray array];
    }
    return self;
}

- (void)fetchDataWithIndexPath:(NSIndexPath *)indexPath withMarketType:(NSInteger)type success:(void(^)(XSModelData * responseObject))success fail:(void(^)(void))fail{

    XSModelData * resonpseModel = [self getCache];
    if (resonpseModel) {
        if (success) {
            success(resonpseModel);
        }
        return;
    }
    
    NSObject * model = [NSObject new];
    
    __typeof(self) __weak weakSelf = self;
    [self.model getData:model success:^(XSModelData *responseObject) {
        //缓存起来，避免tableView性能问题
        [weakSelf.cachelist addObject:responseObject];
        
        if (success) {
            success(responseObject);
        }
        
    } fail:^() {
        if (fail) {
            fail();
        }
        
    }];
}

- (XSModelData *) getCache{
    return [_cachelist firstObject];
}

@end
