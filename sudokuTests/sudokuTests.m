//
//  sudokuTests.m
//  sudokuTests
//
//  Created by Josh Petrack on 9/11/14.
//  Copyright (c) 2014 Josh Petrack. All rights reserved.
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

@end
