//
//  main.m
//  使用ProcessInfo
//
//  Created by SpiColorPendra on 16/1/21.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // ProcessInfo获取进程信息
        // 还可以获取 主机名 操作系统名 操作系统版本信息
        // 获取当前进程对应的ProcessInfo对象
        NSProcessInfo* proInfo = [NSProcessInfo processInfo];
        //获取运行该程序所指定的参数
        NSArray* arr = [proInfo arguments];
        NSLog(@"运行程序的参数 %@",arr);
        NSLog(@"进程标识符%d",[proInfo processIdentifier]);
        NSLog(@"进程的进程名: %@",[proInfo processName]);
        NSLog(@"进程所在的主机名:%@",[proInfo hostName]);
        NSLog(@"进程所在系统的操作系统为 : %ld",[proInfo operatingSystem]);
        NSLog(@"进程所在系统的操作系统名为 : %@",[proInfo operatingSystemName]);
        NSLog(@"进程所在系统的操作系统版本字符串 : %@",[proInfo operatingSystemVersionString]);;
        NSLog(@"进程所在系统的物理内存数量为 : %lld", [proInfo physicalMemory]);
        NSLog(@"进程所在系统的处理器数量为 : %ld",[proInfo processorCount]);
        NSLog(@"进程所在系统的激活的处理器数量为 : %ld",[proInfo activeProcessorCount]);
        NSLog(@"进程所在的系统的运行时间为 : %f",[proInfo systemUptime]);
    }
    return 0;
}
