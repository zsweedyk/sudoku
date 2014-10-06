//
//  sudokuTests.m
//  sudokuTests
//
//  Created by Rachel Wilson and Amit Maor on 9/11/14.
//  Copyright (c) 2014 Rachel Wilson and Amit Maor. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RWAMGridModel.h"

@interface sudokuTests : XCTestCase
{
    RWAMGridModel* _gridModel;
}

@end

@implementation sudokuTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _gridModel = [[RWAMGridModel alloc] init];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMutable
{
    XCTAssertTrue([_gridModel isMutableAtRow:0 andColumn:0] == NO, @"Mutability at 0,0 - should not be mutable");
    XCTAssertTrue([_gridModel isMutableAtRow:1 andColumn:0] == YES, @"Mutability at 1,0 - should be mutable");
}

- (void)testConsistency
{
    XCTAssertTrue([_gridModel isConsistentAtRow:0 andColumn:2 forValue:3] == YES, @"Consistency with 3 at 0,2 - should be yes");
    XCTAssertTrue([_gridModel isConsistentAtRow:0 andColumn:2 forValue:9] == NO, @"Consistency with 9 at 0,2 - should be no");
}

- (void)testGetAndSetValue
{
    XCTAssertTrue([_gridModel getValueAtRow:8 andColumn:8] == 0, @"Value of initial grid at 8,8 should be 0.");
    XCTAssertTrue([_gridModel getValueAtRow:5 andColumn:5] == 5, @"Value of initial grid at 5,5 should be 5.");
    
    [_gridModel setValueAtRow:8 andColumn:8 toValue:5];
    [_gridModel setValueAtRow:0 andColumn:1 toValue:3];
    
    XCTAssertTrue([_gridModel getValueAtRow:8 andColumn:8] == 5, @"Value of changed grid at 8,8 should be 5.");
    XCTAssertTrue([_gridModel getValueAtRow:0 andColumn:1] == 3, @"Value of changed grid at 0,1 should be 3.");
}

@end
