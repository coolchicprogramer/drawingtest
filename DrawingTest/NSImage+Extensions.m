//
//  NSImage+Extensions.m
//  hypershow
//
//  Created by JM on 18/11/2012.
//  Copyright (c) 2012 the foundry. All rights reserved.
//

#import "NSImage+Extensions.h"
#import <QuartzCore/QuartzCore.h>

@implementation NSImage (Extensions)

- (NSInteger) pixelsWide
{
    /*
     returns the pixel width of NSImage.
     Selects the largest bitmapRep by preference
     If there is no bitmapRep returns largest size reported by any imageRep.
     */
    NSInteger result = 0;
    NSInteger bitmapResult = 0;
    
    for (NSImageRep* imageRep in [self representations]) {
        if ([imageRep isKindOfClass:[NSBitmapImageRep class]]) {
            if (imageRep.pixelsWide > bitmapResult)
                bitmapResult = imageRep.pixelsWide;
        } else {
            if (imageRep.pixelsWide > result)
                result = imageRep.pixelsWide;
        }
    }
    if (bitmapResult) result = bitmapResult;
    return result;
    
}

- (NSInteger) pixelsHigh
{
    /*
     returns the pixel height of NSImage.
     Selects the largest bitmapRep by preference
     If there is no bitmapRep returns largest size reported by any imageRep.
     */
    NSInteger result = 0;
    NSInteger bitmapResult = 0;
    
    for (NSImageRep* imageRep in [self representations]) {
        if ([imageRep isKindOfClass:[NSBitmapImageRep class]]) {
            if (imageRep.pixelsHigh > bitmapResult)
                bitmapResult = imageRep.pixelsHigh;
        } else {
            if (imageRep.pixelsHigh > result)
                result = imageRep.pixelsHigh;
        }
    }
    if (bitmapResult) result = bitmapResult;
    return result;
}

- (NSSize) pixelSize
{
    return NSMakeSize(self.pixelsWide,self.pixelsHigh);
}

@end
