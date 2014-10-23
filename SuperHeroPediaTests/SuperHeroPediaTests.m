//
//  SuperHeroPediaTests.m
//  SuperHeroPediaTests
//
//  Created by Dave Krawczyk on 9/6/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "SuperHero.h"

@interface SuperHeroPediaTests : XCTestCase

@property SuperHero *hero1;
@property SuperHero *hero2;

@end

@implementation SuperHeroPediaTests

- (void)setUp {
    [super setUp];
    NSDictionary *dic1 = @{@"name":@"Kevin", @"description":@"Really great guy!"};
    NSDictionary *dic2 = @{@"name":@"Dave", @"description":@"Also an awesome guy"};

    self.hero1 = [[SuperHero alloc]initWithDictionary:dic1];
    self.hero2 = [[SuperHero alloc]initWithDictionary:dic2];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testAllyCountStartAtZero{
    XCTAssert(self.hero1.allies.count == 0);
}

-(void)testAddingAnAllyWorks{
    [self.hero1 addAlly:self.hero2];
    XCTAssertEqual(self.hero1, self.hero2.allies.firstObject);
    XCTAssertEqual(self.hero2, self.hero1.allies.firstObject);
}

-(void)testAllyStartsNotNil{
    XCTAssert(self.hero1.allies != nil);
}

-(void)testSuperheroRetrievable{
    XCTestExpectation *expectation = [self expectationWithDescription:@"retrieving superheroes"];
    [SuperHero retrieveSuperHerosWithCompletion:^(NSArray *superHeros) {
        XCTAssertEqual(25, superHeros.count);
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:0.001 handler:nil];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        XCTestExpectation *expectation = [self expectationWithDescription:@"retrieving superheroes"];
        [SuperHero retrieveSuperHerosWithCompletion:^(NSArray *superHeros) {
            XCTAssertEqual(25, superHeros.count);
            [expectation fulfill];
        }];
        [self waitForExpectationsWithTimeout:10.0 handler:nil];
    }];
}

@end
