//
//  main.m
//  查看目录包含的内容
//
//  Created by SpiColorPendra on 16/1/21.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSFileManager* fm = [NSFileManager defaultManager];
        // 获取指定目录下的所有文件和文件夹
        NSArray* array = [fm contentsOfDirectoryAtPath:@"."
                                                 error:nil];
        
        for (NSString* item in array) {
            NSLog(@"%@", item);
        }
        //获取指定目录下所有文件和文件夹对应的枚举器
        NSDirectoryEnumerator* dirEnum =
        [fm enumeratorAtPath:@"."];
        NSString* file;
        //枚举dirEnum中包含每个文件
        while ((file = [dirEnum nextObject])) {
            //如果文件的文件名以.m结尾
            if ([[file pathExtension] isEqualToString:@"m"]) {
                //直接获取文件内容
                NSData* data = [fm contentsAtPath:file];
                //直接将NSData的数据用UTF-8的格式转换字符串
                NSString* content = [[NSString alloc] initWithData:data
                                                          encoding:NSUTF8StringEncoding];
                NSLog(@"输出文件内容");
                NSLog(@"%@",content);
            }
        }
        //获取当前目录下的所有子目录
        NSArray* subArr = [fm subpathsAtPath:@"."];
        for (NSString* item in subArr) {
            NSLog(@"%@",item);
        }
    }
    return 0;
}
