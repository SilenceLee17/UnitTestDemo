//
//  UnitTestDemoTests.m
//  UnitTestDemoTests
//
//  Created by 李兴东 on 2018/2/4.
//  Copyright © 2018年 xingshao. All rights reserved.
//

#import <XCTest/XCTest.h>

static NSString *const NIM_TEST_NOTIFY_KEY = @"nim_test_notification";
#define WAIT_WITH_KEY(key) do{\
[self expectationForNotification:(key) object:nil handler:nil];\
[self waitForExpectationsWithTimeout:30 handler:nil];\
}while(0);

#define NOTIFY_WITH_KEY(key) do{\
dispatch_async(dispatch_get_main_queue(), ^{ \
[[NSNotificationCenter defaultCenter] postNotificationName:(key) object:nil];\
});\
}while(0);


#define WAIT       WAIT_WITH_KEY(NIM_TEST_NOTIFY_KEY)
#define NOTIFY     NOTIFY_WITH_KEY(NIM_TEST_NOTIFY_KEY)

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

- (void)testa001 {
}

- (void)testa002 {
}

- (void)testa003 {
}

- (void)testA001 {
}

- (void)testA002 {
}

- (void)testA003 {
}

- (void)testB001 {
}

- (void)testC002 {
}

- (void)testD003 {
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

