//
//  main.m
//  使用NSData完成自定义归档
//
//  Created by SpiColorPendra on 16/1/22.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Apple.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // NSData完成自定义归档
        // 如果一次需要将多个对象归档到单个文件档案中 怎么办？
        // 此时可借助 NSMutableData 和 NSKeyedArchiver 和 NSKeyedUnarchiver
        
        NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithInt:89],@"Objective-C",
                              [NSNumber numberWithInt:69],@"Ruby",
                              [NSNumber numberWithInt:75],@"Python",
                              [NSNumber numberWithInt:109],@"Perl",
                              nil];
        //创建一个NSSet对象
        NSSet* set = [NSSet setWithObjects:
                      @"iOS",
                      @"Android",
                      @"Ajax",
                      nil];
        //创建一个Apple对象
        Apple* apple = [[Apple alloc] initWithColor:
                        @"Red" weight:3.4 size:20];
        //创建一个NSMutableData对象，用于保存数据
        NSMutableData* data = [NSMutableData data];
        //以NSMutableData对象作为参数，创建NSKeyedArchiver对象
        NSKeyedArchiver* arch = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
        //重复调用encodeObject:forKey方法归档所有需要归档的对象
        [arch encodeObject:dict forKey:@"myDict"];
        [arch encodeObject:set forKey:@"set"];
        [arch encodeObject:apple forKey:@"myApp"];
        //结束归档
        [arch finishEncoding];
        //程序将NSData缓存区保存的数据写入文件
        if ([data writeToFile:@"multi.archive" atomically:YES] == NO) {
            NSLog(@"归档失败");
        }
        
        
        //解档
        NSKeyedUnarchiver* uarch = [[NSKeyedUnarchiver alloc]
                                    initForReadingWithData:data];
        //重读调用decodeObjectForKey:方法恢复所有需要恢复的对象
        NSDictionary* dict2 = [uarch decodeObjectForKey:@"myDict"];
        NSSet* set2 = [uarch decodeObjectForKey:@"set"];
        Apple* apple2 = [uarch decodeObjectForKey:@"myApp"];
        //下面代码验证是否恢复成功
        NSLog(@"dict2 = %@" , dict2);
        NSLog(@"set2 = %@" , set);
        NSLog(@"apple2 = %@",apple2);
        /*
         2016-01-22 12:57:20.906 使用NSData完成自定义归档[1044:46860] dict2 = {
         "Objective-C" = 89;
         Perl = 109;
         Python = 75;
         Ruby = 69;
         }
         2016-01-22 12:57:20.907 使用NSData完成自定义归档[1044:46860] set2 = {(
         iOS,
         Android,
         Ajax
         )}
         2016-01-22 12:57:20.907 使用NSData完成自定义归档[1044:46860] apple2 = <Apple:[color=Red, weight=3.4, size=20]>
         */
    }
    return 0;
}
