//
//  UIColor+ContrastingColor.h
//  Demo
//
//  Created by Paul Williamson on 30/06/2014.
//
//

#import <UIKit/UIKit.h>

/**
 * This class has two contrast methods: the 50% method, and YIQ method.
 *
 * ## 50% method
 * The self color is converted to hex then checked if it is >= 0x808080. If the
 * color is >= 0x808080 then black color is returned, otherwise white color is
 * returned.
 *
 * ## YIQ method
 * The YIQ method is arguably better as it applies weighting to the colors, 
 * which could result in better contrast matches.
 */
typedef NS_ENUM(NSInteger, SQFContrastingColorMethod) {
    SQFContrastingColorFiftyPercentMethod,
    SQFContrastingColorYIQMethod
};

@interface UIColor (ContrastingColor)

/**
 * Returns either black or white depending on the contrast calculated by the supplied `SQFContrastingColorMethod`
 @param method The `SQFContrastingColorMethod` to use during the contrast calculation
 @return Either `[UIColor blackColor]` or `[UIColor whiteColor]`, whichever has
 the greatest contrast
 */
- (UIColor *)sqf_contrastingColorWithMethod:(SQFContrastingColorMethod)method;

@end
