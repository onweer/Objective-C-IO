//
//  main.m
//  利用归档实现深复制
//
//  Created by SpiColorPendra on 16/1/22.
//  Copyright © 2016年 SpiColorPendra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Apple.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:
                              [[Apple alloc]
                               initWithColor:@"红色"
                               weight:3.4
                               size:20],@"one",
                              [[Apple alloc]
                               initWithColor:@"绿色"
                               weight:2.5
                               size:18],@"two",
                              nil];
        // 归档对象，将归档对象的数据写入NSData中
        NSData* data = [NSKeyedArchiver
                        archivedDataWithRootObject:dict];
        //从NSdata对象中恢复对象,这样既可完成深复制
        NSDictionary* dictCopy = [NSKeyedUnarchiver
                                  unarchiveObjectWithData:data];
        //获取复制的NSDictionary对象中的key为one对应的apple对象
        Apple* appCopy = [dictCopy objectForKey:@"one"];
        Apple* app = [dict objectForKey:@"one"];
        //修改该对象的color
        [app setColor:@"紫色"];
        NSLog(@"dictCopy中的key为one对应的appCopy颜色为 : %@",appCopy.color);
        NSLog(@"dict中的key为one对应的app颜色为 : %@",app.color);
        /*
         dict中的key为one对应的appCopy颜色为 : 红色
         dictCopy中的key为one对应的app颜色为 : 紫色
         */
        /*
         浅层复制：只复制指向对象的指针，而不复制引用对象本身。
         
         计数器+1 ,就像比如retain
         
         深层复制：复制引用对象本身。
         
         计数器不变，产生新对象
         */
        
    }
    return 0;
}
