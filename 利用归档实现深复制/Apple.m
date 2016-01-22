//
//  Apple.m
//  Objective-C-IO
//
//  Created by SpiColorPendra on 16/1/22.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import "Apple.h"

@implementation Apple
- (id) initWithColor:(NSString *)color weight:(double)weight size:(int)size
{
    if (self = [super init]) {
        _color = color;
        _weight = weight;
        _size = size;
    }
    return self;
}
// 重写父类decription方法
- (NSString*) description
{
    //返回一个字符串
    return [NSString stringWithFormat:@"<Apple:[color=%@, weight=%g, size=%d]>"
            ,_color,_weight,_size];
}
- (void) encodeWithCoder:(NSCoder *)aCoder
{
    //调用NSCoder的方法归档该对象的每一个实例变量
    [aCoder encodeObject:_color forKey:@"color"];
    [aCoder encodeDouble:_weight forKey:@"weight"];
    [aCoder encodeInt:_size forKey:@"size"];
}

- (id) initWithCoder:(NSCoder *)aDecoder
{
    //使用NSCoder一次恢复成员变量
    //所对应的value，并将恢复的value赋给当前对象的3个实例变量
    _color = [aDecoder decodeObjectForKey:@"color"];
    _weight = [aDecoder decodeDoubleForKey:@"weight"];
    _size = [aDecoder decodeIntForKey:@"size"];
    return self;
}
@end

