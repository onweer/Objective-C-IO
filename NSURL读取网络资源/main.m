//
//  main.m
//  NSURL读取网络资源
//
//  Created by SpiColorPendra on 16/1/21.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 资源可以是文件或目录 也可以是对更复杂对象的引用
        // 创建NSURL
        NSURL* url = [NSURL URLWithString:@"http://crazyit.org/index.php"];
        NSLog(@"url的scheme为: %@",[url scheme]);
        NSLog(@"host:%@",[url host]);
        NSLog(@"post:%@",[url port]);
        NSLog(@"path:%@",[url path]);
        //使用URL对应的资源来初始化NSString对象
        NSString* homePage = [NSString stringWithContentsOfURL:url
                                                      encoding:NSUTF8StringEncoding
                                                         error:nil];
        NSLog(@"%@",homePage);
    }
    return 0;
}
