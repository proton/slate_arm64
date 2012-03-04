//
//  NSColor+Conversions.m
//  Slate
//
//  Created by Jigish Patel on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSColor+Conversions.h"

@implementation NSColor (Conversions)

- (CGColorRef)cgColor
{
  NSColor *colorRGB = [self colorUsingColorSpaceName:NSCalibratedRGBColorSpace];
  CGFloat components[4];
  [colorRGB getRed:&components[0] green:&components[1] blue:&components[2] alpha:&components[3]];
  CGColorSpaceRef theColorSpace = CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB);
  CGColorRef theColor = CGColorCreate(theColorSpace, components);
  CGColorSpaceRelease(theColorSpace);
  return theColor;
}

+ (NSColor *)colorWithCGColor:(CGColorRef)aColor
{
  const CGFloat *components = CGColorGetComponents(aColor);
  CGFloat red = components[0];
  CGFloat green = components[1];
  CGFloat blue = components[2];
  CGFloat alpha = components[3];
  return [self colorWithDeviceRed:red green:green blue:blue alpha:alpha];
}

@end