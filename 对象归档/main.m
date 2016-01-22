//
//  main.m
//  对象归档
//
//  Created by SpiColorPendra on 16/1/22.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 所谓对象归档，其实类似于语言中的 序列化 机制 ，归档就是用某种格式把一个或者多个对象保存到指定的文件中，
        //方便以后从文件中恢复 通常来说归档包括以下操作:
        // 1.一方面是需要把对象写入指定文件中   (压缩)
        // 2.另一方面需要从文件中恢复这些对象   (解压缩)
        // 使用NSKeyedArchiver归档
        
        //创建多个value,key对象
        NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithInt:89],@"Objective-C",
                              [NSNumber numberWithInt:69],@"Ruby",
                              [NSNumber numberWithInt:75],@"Python",
                              [NSNumber numberWithInt:109],@"Perl",
                              nil];
        //对dict对象进行归档
        [NSKeyedArchiver archiveRootObject:dict
                                    toFile:@"myDict.archive"];
        
        // 从myDict.archive中恢复文件内容
        NSDictionary* dict2 = [NSKeyedUnarchiver unarchiveObjectWithFile:@"myDict.archive"];
        // 打印dict2的内容
        NSLog(@"%@",dict2);
        /*
         "Objective-C" = 89;
         Perl = 109;
         Python = 75;
         Ruby = 69;
`         */
    }
    return 0;
}
