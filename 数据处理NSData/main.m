//
//  main.m
//  数据处理NSData
//
//  Created by SpiColorPendra on 16/1/21.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // NSData 代表OC的数据缓冲区 NSData的作用有两个 1是对数据读取NSData 。2是输出NSData的数据
        //  data开头 init开头 都是创建NSData
        // data:
        // dataWithBytes:length:/initWithBytes:length: //复制C数组所包含的数据来初始化NSData的数据
        // dataWuthBytesNoCopy:length:/initWithBytesNoCopy:length // 直接利用C数组来初始化NSData对象 当对象
        // 被执行malloc方法销毁自己时，程序会释放该C数组
        // dataWithBytesNoCopy:length:freeWhenDone: / ...直接利用C数组来初始化NSData对象 只有当最后一个参数是YES时，
        // 且对象被执行malloc方法销毁自己时，程序才会释放该C数组
        // dataWithContensOfFile:/ initWithContentsOfFile: 直接读取文件内容，并利用内容初始化NSData对象
        // dataWithContentsOfURL:/ initWithContentsOfURL: 直接读取URL关联的内容，并利用该URL关联的内容初始化NSData
        // dataWithData:/initWithData: 直接使用另一个NSData所包含的数据来初始化新创建的NSData
       
        //   得到NSData对象之后，接下来程序即可调用NSData来访问NSData所包含的数据:
        /*
         1.bytes: 返回该NSData所包含的数据
         2.getBytes:range:获取NSData所包含的指定范围的数据
         3.subdataWithRange:获取NSData所包含的指定范围的数据组成的NSData对象
         4.writeToFile:atomically: 将NSData的数据写入文件
         5.writeToURL:atomically: 将NSData的数据写入指定URL对应的资源
                  */
        NSData* data = [NSData dataWithContentsOfURL:
                        [NSURL URLWithString:@"http://www.crazyit.org/ethos.php"]];
        NSLog(@"%ld",[data length]); // 12802
        //定义一个长度100的字符数组
        char buffer[100];
        //将NSData指定范围的数据读入数组
        [data getBytes:buffer range:NSMakeRange(103, 100)];
        NSLog(@"%s",buffer);
        // Java中的字符流？还是字节流?
        //直接将NSData的数据用UTF-8的格式转换字符串
        NSString* content = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"输出网页内容");
        NSLog(@"%@",content);
    }
    return 0;
}
