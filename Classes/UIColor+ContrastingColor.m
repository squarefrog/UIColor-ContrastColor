//
//  UIColor+ContrastingColor.m
//  Demo
//
//  Created by Paul Williamson on 30/06/2014.
//
//

#import "UIColor+ContrastingColor.h"

@implementation UIColor (ContrastingColor)

- (UIColor *)sqf_contrastingColorWithMethod:(SQFContrastingColorMethod)method
{
    switch (method) {
            
        case SQFContrastingColorFiftyPercentMethod:
            return [self sqf_contrastingColorFiftyPercentMethod];
            break;
            
        case SQFContrastingColorYIQMethod:
            return [self sqf_contrastingColorYIQMethod];
    }
}

- (UIColor *)sqf_contrastingColorFiftyPercentMethod
{
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha = 0.0;
    [self getRed:&red green:&green blue:&blue alpha:&alpha];
    
    NSInteger redDecimal = (NSInteger)(red * 255);
    NSInteger greenDecimal = (NSInteger)(green * 255);
    NSInteger blueDecimal = (NSInteger)(blue * 255);
    
    NSString *hex = [NSString stringWithFormat:@"%02x%02x%02x", (unsigned int)redDecimal, (unsigned int)greenDecimal, (unsigned int)blueDecimal];
    
    unsigned int result = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hex];
    [scanner scanHexInt:&result];
    
    return (result > 0xffffff / 2) ? [UIColor blackColor] : [UIColor whiteColor];
}

- (UIColor *)sqf_contrastingColorYIQMethod
{
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha = 0.0;
    [self getRed:&red green:&green blue:&blue alpha:&alpha];
    
    CGFloat yiq = ((( red * 255 ) * 299 ) + (( green * 255 ) * 587 ) + (( blue * 255 ) * 114 )) / 1000;
    
    return (yiq >= 128.0) ? [UIColor blackColor] : [UIColor whiteColor];
}

@end
