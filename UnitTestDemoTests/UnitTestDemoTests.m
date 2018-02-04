//
//  UnitTestDemoTests.m
//  UnitTestDemoTests
//
//  Created by 李兴东 on 2018/2/4.
//  Copyright © 2018年 xingshao. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface UnitTestDemoTests : XCTestCase

@end

@implementation UnitTestDemoTests

- (void)setUp {
    [super setUp];
    //    初始化的代码，在测试方法调用之前调用
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    //    释放测试用例的资源代码，每个方法在每个测试用例执行后调用。测试失败不调用。
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    //    测试用例
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    //    性能测试用例
    // This is an example of a performance test case.
    [self measureBlock:^{
        //        需要测试性能的代码
        // Put the code you want to measure the time of here.
    }];
}

@end

