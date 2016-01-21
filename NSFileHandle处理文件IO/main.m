//
//  main.m
//  NSFileHandle处理文件IO
//
//  Created by SpiColorPendra on 16/1/21.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 通常来说基本步骤是:
        // 1.创建一个NSFileHandle 该NSFileHandle将会打开指定的文件
        // 2.对打开的文件执行IO操作
        // 3.关闭文件

        //打开一份文件准备读取
        NSFileHandle *fh = [NSFileHandle fileHandleForReadingAtPath:@"main.m"];
        NSData* data;
        //读取fh中的256字节
        while ([(data = [fh readDataOfLength:512]) length] > 0) {
            NSLog(@"%ld" , [data length]);
            //将NSData的数据用UTF-8格式转换成字符串
            NSString* content = [[NSString alloc]initWithData:data
                                                     encoding:NSUTF8StringEncoding];
            NSLog(@"读取输出512个字节的内容");
            NSLog(@"%@",content);
        }
        [fh closeFile]; //关闭文件
        
        NSFileHandle* fh2 = [NSFileHandle fileHandleForWritingAtPath:@"abc.txt"];
        if (!fh2) {
            //创建一个NSFileManager对象
            NSFileManager* fm = [NSFileManager defaultManager];
            //创建一份空文件
            [fm createFileAtPath:@"abc.txt"
                        contents:nil
                      attributes:nil];
            fh2 = [NSFileHandle fileHandleForWritingAtPath:@"abc.txt"];
        }
        NSString* mybook = @"iOS";
        [fh2 writeData:[mybook
                        dataUsingEncoding:NSUTF8StringEncoding]];
        [fh2 closeFile];
    }
    return 0;
}
