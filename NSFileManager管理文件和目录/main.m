//
//  main.m
//  NSFileManager管理文件和目录
//
//  Created by SpiColorPendra on 16/1/21.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // NSFileManager 代表文件管理器 通过NSFileManage 开发者可以完成许多通用的文件操作
        // 使用NSFileManager执行移动 复制 链接 删除文件 或 目录  程序可以为NSFileManager提供一套事件委托(实现NSFileManagerDelegate)对象
        // 该委托对象用于保证 文件移动 复制 链接 删除操作的成功完成，并在操作失败时候提供相应的方法
        // NSFileManager 采用文件名作为文件唯一的标识 每个文件名都是一个普通的NSString对象，它既可以使用相对路径
        // 也可以是绝对路径
        //  就Mac OSX 系统而言:
        //  相对路径: 不以斜线开头的路径都是相对路径 main.m代表当前目录下的main.m文件  codes/main.m 代表codes目录下的main.m文件
        //  绝对路径: 以斜线开头 eg /User/spi.../Documents/main.m  这个就是绝对路径 绝对路径是唯一的
        //  特殊路径:  ~: 代表当前用户的Home目录     .:代表当前当前目录        ..:代表上一级目录
        //程序可以调用NSFileManager的defaultManager类方法来获取系统默认的NSFileManager对象，一旦获取了NSFileManager对象，就可以调用NSFileManager的方法来操作
        // 系统的文件项目
        
        /*
         NSFileManager:提供了如下的方法
         fileExistsAtPath:判断指定文件名对应的文件是否存在
         fileExistsAtPath:isDirectory: 判断该指定文件名对应的文件或目录是否存在，后一个参数用于返回该文件名是否为目录
         isReadableFileAtPath: 判断指定目录是否下的文件是否可读
         isWritableFileAtPath: 判断指定目录下文件是否可写
         isExecutableFileAtPath: 判断指定目录下文件是否可执行
         isDeletableFileAtPath: 判断指定目录下的文件是否可删除
         componentsToDisplayForPath: 获取指定文件名对应的各个路径组件
         displayNameAtPath 获取指定文件名对应的简单文件名
         attributesOfItemSystemForPath:error: 获取指定文件名对应文件的属性
         attributesOfFileSystemForPath:error: 获取指定文件名对应文件所在系统的属性
         setAttributes:ofItemAtPath:error: 设置指定文件名对应文件的属性
         contentsAtPath:获取指定文件名对应文件的内容
         contentsEqualAtPath:andPath: 判断两个文件名自定的文件内容是否相同

         */
        
        NSFileManager* fm = [NSFileManager defaultManager];
        NSLog(@"main.m是否存在: %d",[fm fileExistsAtPath:@"/Users/spicolorpendra/Documents/Objective-C-IO/NSFileManager管理文件和目录/main.m"]);
        BOOL isDir;
        NSLog(@"@Objective-C-IO folder  : %d",
              [fm fileExistsAtPath:@"/Users/spicolorpendra/Documents/Objective-C-IO/NSFileManager管理文件和目录/main.m"
                       isDirectory:&isDir]);
        
        //将会输出 0
        NSLog(@"main.m是否为目录 : %d",isDir);
        //将会输出 1
        NSLog(@"main.m是否可读 : %d",[fm
                                  isReadableFileAtPath:@"/Users/spicolorpendra/Documents/Objective-C-IO/NSFileManager管理文件和目录/main.m"]);
        //将会输出 1
        NSLog(@"main.m是否可写 : %d",[fm isWritableFileAtPath:@"/Users/spicolorpendra/Documents/Objective-C-IO/NSFileManager管理文件和目录/main.m"]);
        //将会输出 0
        NSLog(@"main.m是否为可执行文件 : %d",[fm isExecutableFileAtPath:@"/Users/spicolorpendra/Documents/Objective-C-IO/NSFileManager管理文件和目录/main.m"]);
        //将会输出 1
        NSLog(@"main.m是否是可删除文件 : %d",[fm isDeletableFileAtPath:@"/Users/spicolorpendra/Documents/Objective-C-IO/NSFileManager管理文件和目录/main.m"]);
        //获取main.m文件所在路径的组件
        NSArray* array = [fm componentsToDisplayForPath:@"/Users/spicolorpendra/Documents/Objective-C-IO/NSFileManager管理文件和目录/main.m"];
        NSLog(@"main.m所在所在路径的完整路径组件为:");
        for (NSObject* ele in array) {
            NSLog(@"%@ , ",ele);
        }
        //获取文件的相关属性
        NSDictionary* attr = [fm attributesOfItemAtPath:@"/Users/spicolorpendra/Documents/Objective-C-IO/NSFileManager管理文件和目录/main.m"
                                                  error:nil];
        //获取文件属性的详情
        NSLog(@"创建时间 : %@",[attr fileCreationDate]);
        NSLog(@"属主账户 : %@",[attr fileOwnerAccountName]);
        NSLog(@"文件大小 : %lld",[attr fileSize]);
        /*
         2016-01-21 17:39:54.252 NSFileManager管理文件和目录[2752:89259] 创建时间 : 2016-01-21 07:02:11 +0000
         2016-01-21 17:39:54.252 NSFileManager管理文件和目录[2752:89259] 属主账户 : spicolorpendra
         2016-01-21 17:39:54.252 NSFileManager管理文件和目录[2752:89259] 文件大小 : 4970
         */
        //直接获取文件内容
        NSData* data = [fm contentsAtPath:@"/Users/spicolorpendra/Documents/Objective-C-IO/NSFileManager管理文件和目录/main.m"];
        //将NSData的数据用UTF-8的格式转换成字符串
        NSString* content = [[NSString alloc] initWithData:
                             data encoding:NSUTF8StringEncoding];
        NSLog(@"输出文件内容");
        NSLog(@"%@",content);
    }
    return 0;
}
