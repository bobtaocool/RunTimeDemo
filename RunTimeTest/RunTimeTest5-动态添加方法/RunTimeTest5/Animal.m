//
//  Animal.m
//  RunTimeTest5
//
//  Created by bob on 2017/7/20.
//  Copyright © 2017年 bob. All rights reserved.
//

#import "Animal.h"
#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif
@implementation Animal

+(BOOL)resolveInstanceMethod:(SEL)sel
{
    //没有声明play方法，需要动态添加
    
    if ([NSStringFromSelector(sel) isEqualToString:@"play"]) {
        
        class_addMethod([self class], sel, (IMP)playBasketball, "v@:");
        
        return YES;
    }

    return [super resolveInstanceMethod:sel];
    
}

//id self, SEL cmd 为默认参数，可以不写

void playBasketball(id self, SEL cmd)
{
    
    NSLog(@"%@ 玩篮球",((Animal*)self).name);
    
}


@end
