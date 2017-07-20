//
//  main.m
//  RuntimeTest2
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
#import "Annimal.h"
#import "Annimal+Associated.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        Annimal *dog = [[Annimal alloc] init];
        dog.name = @"狗";
        dog.age = 2;
        [dog setValue:@"白色" forKey:@"color"];
        
         [dog setValue:@"哈士奇" forKey:@"type"];
        
        dog.block=^()
        {
            
            NSLog(@"玩耍");
        };
        
        NSDictionary *propertyResultDic = [dog getallProperties];
        for (NSString *propertyName in propertyResultDic.allKeys) {
            NSLog(@"propertyName:%@, propertyValue:%@",propertyName, propertyResultDic[propertyName]);
        }
        
        NSDictionary *ivarResultDic = [dog getallIvars];
        for (NSString *ivarName in ivarResultDic.allKeys) {
            NSLog(@"ivarName:%@, ivarValue:%@",ivarName, ivarResultDic[ivarName]);
        }
        
        NSDictionary *methodResultDic = [dog getallMethods];
        for (NSString *methodName in methodResultDic.allKeys) {
            NSLog(@"methodName:%@, argumentsCount:%@", methodName, methodResultDic[methodName]);
        }

        
    }
    return 0;
}
