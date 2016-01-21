//
//  main.m
//  文件的创建、删除、移动、复制
//
//  Created by SpiColorPendra on 16/1/21.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSFileManager* fm = [NSFileManager defaultManager];
        //创建目录
        // 如果目录不存在则，创建父目录
        [fm createDirectoryAtPath:@"xyz/abc"
      withIntermediateDirectories:YES
                       attributes:nil
                            error:nil];
        NSString* content = @"iOS studying";
        //创建一份文件
        [fm createFileAtPath:@"myInfo.txt"
                    contents:[content dataUsingEncoding:NSUTF8StringEncoding]
                  attributes:nil];
        //复制一份新文件
        [fm copyItemAtPath:@"myInfo.txt"
                    toPath:@"copyInfo.txt"
                     error:nil];
    }
    return 0;
}
