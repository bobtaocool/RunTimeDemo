//
//  main.m
//  RuntimeTest3
//
//  Created by bob on 2017/7/20.
//  Copyright © 2017年 bob. All rights reserved.
//

#import <Foundation/Foundation.h>
#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

#import "Animal.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Animal *anni=[[Animal alloc]init];
        
        anni.name=@"狗";
        anni.age=@2;
        anni.color=@"黄色";
        anni.type=@"阿拉斯加";
        
        NSString *path=NSTemporaryDirectory();
        
        path=[path stringByAppendingPathComponent:@"dog.dog"];
        
        NSLog(@"%@",path);
        
        [NSKeyedArchiver archiveRootObject:anni toFile:path];
        
        
        Animal *newAnimal=[NSKeyedUnarchiver unarchiveObjectWithFile:path];
        
        NSLog(@"%@-%@-%@-%@",newAnimal.name,newAnimal.age,newAnimal.type,newAnimal.color);
        
        
        // insert code here...
      
    }
    return 0;
}
