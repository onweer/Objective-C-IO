//
//  main.m
//  NSBundle处理项目相关资源
//
//  Created by SpiColorPendra on 16/1/21.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 如果应用程序使用绝对路径或相对路径去访问文件，必然导致程序的可移植性降低 因为我们把应用程序部署到客户机上时，
        // 客户机对应的路径下可能根本没有这些文件
        // 使用NSBundle获取应用自包含的制定资源文件的路径
        NSString* filePath = [[NSBundle mainBundle] pathForResource:@"bookinf"
                                                             ofType:@"txt"];
        //使用指定文件内容来初始化NSString
        NSString* content = [NSString stringWithContentsOfFile:filePath
                                                      encoding:NSUTF8StringEncoding
                                                         error:nil];
        NSLog(@"文件内容 : %@" , content);
        
    }
    return 0;
}
