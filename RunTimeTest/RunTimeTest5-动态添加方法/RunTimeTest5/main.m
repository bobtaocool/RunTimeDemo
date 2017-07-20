//
//  main.m
//  RunTimeTest5
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
        Animal *dog=[[Animal alloc]init];
        
        dog.name=@"狗";
        
        [dog play];
        
    }
    return 0;
}
