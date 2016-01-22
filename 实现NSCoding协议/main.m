//
//  main.m
//  实现NSCoding协议
//
//  Created by SpiColorPendra on 16/1/22.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Apple.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 实现对象归档 恢复很简单，但是是否可以使用于自定义对象呢？
        // 这个是不能直接使用的，需要自己实现NSCoding协议
        // 并实现协议中的两个方法 :
        // 1.initWithCoder:  //该方法负责恢复该对象
        // 2.encodeWithCoder: //该方法负责归档该对象
        Apple* apple = [[Apple alloc] initWithColor:@"红色"
                                             weight:3.4
                                               size:20];
        //对apple对象进行归档
       [NSKeyedArchiver archiveRootObject:apple
                                   toFile:@"apple.archive"];
        
        //进行解档操作
        Apple* apple2 = [NSKeyedUnarchiver unarchiveObjectWithFile:@"apple.archive"];
        NSLog(@"%@",apple2);
        
    }
    return 0;
}
