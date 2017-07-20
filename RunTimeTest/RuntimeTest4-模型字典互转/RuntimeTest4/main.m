//
//  main.m
//  RuntimeTest4
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
        // insert code here...
   
        NSDictionary *dict = @{
                               @"name" : @"猫",
                               @"age"  : @1,
                               @"color" : @"白色",
                               @"type" : @"波斯猫"
                               };
        
        Animal *dog=[[Animal alloc]initWithDictionary:dict];
        
        NSLog(@"%@,%@,%@,%@",dog.name,dog.age,dog.color,dog.type);
        
        NSDictionary *newdict=[dog ModelToDictionary];
        
        NSLog(@"%@",newdict);

    }
    return 0;
}
