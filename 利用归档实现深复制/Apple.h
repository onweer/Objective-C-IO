//
//  Apple.h
//  Objective-C-IO
//
//  Created by SpiColorPendra on 16/1/22.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Apple : NSObject<NSCoding>
@property (nonatomic,copy) NSString* color;
@property (nonatomic,assign) double weight;
@property (nonatomic,assign) int size;
- (id) initWithColor:(NSString*) color
             weight :(double) weight
                size:(int) size;

@end