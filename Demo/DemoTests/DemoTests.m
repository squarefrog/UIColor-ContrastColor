//
//  DemoTests.m
//  DemoTests
//
//  Created by Paul Williamson on 30/06/2014.
//
//

#import <XCTest/XCTest.h>
#import "UIColor+ContrastingColor.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface DemoTests : XCTestCase
@property (strong, nonatomic) UIColor *whiteColor;
@property (strong, nonatomic) UIColor *blackColor;
@end

@implementation DemoTests

- (void)setUp
{
    [super setUp];
    
    _whiteColor = [UIColor whiteColor];
    _blackColor = [UIColor blackColor];
}

- (void)tearDown
{
    _whiteColor = nil;
    _blackColor = nil;
    
    [super tearDown];
}

#pragma mark - Fifty Percent Method Tests

- (void)testFiftyPercentMethodBlackReturnsWhite
{
    XCTAssertEqualObjects([_blackColor sqf_contrastingColorWithMethod:SQFContrastingColorFiftyPercentMethod], _whiteColor, @"Fifty percent method should return white when given a black color");
}

- (void)testFiftyPercentMethodWhiteReturnsBlack
{
    XCTAssertEqualObjects([_whiteColor sqf_contrastingColorWithMethod:SQFContrastingColorFiftyPercentMethod], _blackColor, @"Fifty percent method should return black when given a white color");
}

- (void)testFiftyPercentMethodRedReturnsBlack
{
    UIColor *redColor = UIColorFromRGB(0xEF4444);
    XCTAssertEqualObjects([redColor sqf_contrastingColorWithMethod:SQFContrastingColorFiftyPercentMethod], _blackColor, @"Fifty percent method should return black when given a red color");
}

- (void)testFiftyPercentMethodTealReturnsWhite
{
    UIColor *tealColor = UIColorFromRGB(0x009F75);
    XCTAssertEqualObjects([tealColor sqf_contrastingColorWithMethod:SQFContrastingColorFiftyPercentMethod], _whiteColor, @"Fifty percent method should return white when given a teal color");
}

- (void)testFiftyPercentMethodPurpleReturnsBlack
{
    UIColor *purpleColor = UIColorFromRGB(0xD54799);
    XCTAssertEqualObjects([purpleColor sqf_contrastingColorWithMethod:SQFContrastingColorFiftyPercentMethod], _blackColor, @"Fifty percent method should return black when given a purple color");
}

#pragma mark - YIQ Method Tests

- (void)testYIQMethodBlackReturnsWhite
{
    XCTAssertEqualObjects([_blackColor sqf_contrastingColorWithMethod:SQFContrastingColorYIQMethod], _whiteColor, @"YIQ method should return white when given a black color");
}

- (void)testYIQMethodWhiteReturnsBlack
{
    XCTAssertEqualObjects([_whiteColor sqf_contrastingColorWithMethod:SQFContrastingColorYIQMethod], _blackColor, @"YIQ method should return black when given a white color");
}

- (void)testYIQMethodRedReturnsWhite
{
    UIColor *redColor = UIColorFromRGB(0xEF4444);
    XCTAssertEqualObjects([redColor sqf_contrastingColorWithMethod:SQFContrastingColorYIQMethod], _whiteColor, @"YIQ method should return white when given a red color");
}

- (void)testYIQMethodTealReturnsWhite
{
    UIColor *tealColor = UIColorFromRGB(0x009F75);
    XCTAssertEqualObjects([tealColor sqf_contrastingColorWithMethod:SQFContrastingColorYIQMethod], _whiteColor, @"YIQ method should return white when given a teal color");
}

- (void)testYIQMethodPurpleReturnsWhite
{
    UIColor *purpleColor = UIColorFromRGB(0xD54799);
    XCTAssertEqualObjects([purpleColor sqf_contrastingColorWithMethod:SQFContrastingColorYIQMethod], _whiteColor, @"YIQ method should return white when given a purple color");
}

@end
