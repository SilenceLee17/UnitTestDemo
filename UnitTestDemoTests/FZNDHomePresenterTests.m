//
//  FZNDHomePresenterTests.m
//  FZTests
//
//  Created by 李兴东 on 07/02/2018.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "XSPresenter.h"
#import "XSModel.h"

@interface FZNDHomePresenterTests : XCTestCase

@property (nonatomic, strong) XSPresenter *presenter;
@property (nonatomic, strong) id model;

@end

@implementation FZNDHomePresenterTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.presenter = [XSPresenter new];
    self.model = OCMClassMock([XSModel class]);
    self.presenter.model = self.model;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.model = nil;
    self.presenter = nil;
    [super tearDown];
}

- (void)testFetchDataWithIndexPathWithParamsSuccess{
    OCMExpect([self.model getData:OCMOCK_ANY success:OCMOCK_ANY fail:OCMOCK_ANY]).
    andDo(^(NSInvocation *invocation){
        void(^successResponse)(XSModelData *response);
        [invocation getArgument:&successResponse atIndex:3];
        XSModelData *testResponse=[XSModelData new];
        testResponse.name = @"testString";
        successResponse(testResponse);
    });
    
    NSIndexPath *indexPath = OCMClassMock([NSIndexPath class]);
    [self.presenter fetchDataWithIndexPath:indexPath withMarketType:0 success:^(XSModelData *responseObject) {
        XCTAssertNotNil(responseObject);
        XCTAssertTrue([responseObject.name isEqualToString:@"testString"]);
    } fail:^() {
    }];
    OCMVerifyAll(self.model);
}


- (void)testFetchDataWithIndexPathCache{
    
    OCMExpect([self.model getData:OCMOCK_ANY success:OCMOCK_ANY fail:OCMOCK_ANY]).
    andDo(^(NSInvocation *invocation){
        void(^success)(XSModelData *response);
        [invocation getArgument:&success atIndex:3];
        XSModelData *testResponse=[XSModelData new];
        testResponse.name = @"testString";
        success(testResponse);
    });
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.presenter fetchDataWithIndexPath:indexPath withMarketType:0 success:^(XSModelData *responseObject) {

        OCMVerify([self.model getData:OCMOCK_ANY success:OCMOCK_ANY fail:OCMOCK_ANY]);
        
        [[self.model reject] getData:OCMOCK_ANY success:OCMOCK_ANY fail:OCMOCK_ANY];
        
        [self.presenter fetchDataWithIndexPath:indexPath withMarketType:0 success:^(XSModelData *responseObject) {
        } fail:^() {
        }];

    } fail:^() {
    }];
    OCMVerifyAll(self.model);
}


- (void)testFetchDataWithIndexPath{
    OCMStub([self.model getData:OCMOCK_ANY success:OCMOCK_ANY fail:OCMOCK_ANY]).
    andDo(^(NSInvocation *invocation){
        void(^successResponse)(XSModelData *response);
        [invocation getArgument:&successResponse atIndex:3];
        XSModelData *testResponse=[XSModelData new];
        testResponse.name = @"testString";
        successResponse(testResponse);
    });

    NSIndexPath *indexPath = OCMClassMock([NSIndexPath class]);
    [self.presenter fetchDataWithIndexPath:indexPath withMarketType:0 success:^(XSModelData *responseObject) {
        XCTAssertNotNil(responseObject);
        XCTAssertTrue([responseObject.name isEqualToString:@"testString"]);
    } fail:^() {
    }];
}

- (void)testVerifyFetchDataWithIndexPath {
    NSIndexPath *indexPath = OCMClassMock([NSIndexPath class]);
    [self.presenter fetchDataWithIndexPath:indexPath withMarketType:0 success:^(XSModelData *responseObject) {
        OCMVerify([self.model getData:OCMOCK_ANY success:OCMOCK_ANY fail:OCMOCK_ANY]);
    } fail:^() {
        OCMVerify([self.model getData:OCMOCK_ANY success:OCMOCK_ANY fail:OCMOCK_ANY]);
    }];
    
    
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
