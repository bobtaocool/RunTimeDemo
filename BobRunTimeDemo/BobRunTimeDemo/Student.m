//
//  Student.m
//  BobRunTimeDemo
//
//  Created by bob on 2016/11/29.
//  Copyright © 2016年 bob. All rights reserved.
//

#import "Student.h"
#import <objc/runtime.h>
@implementation Student

/*
 开发使用场景：如果一个类方法非常多，加载类到内存的时候也比较耗费资源，需要给每个方法生成映射表，可以使用动态给某个类，添加方法解决。
 
 经典面试题：有没有使用performSelector，其实主要想问你有没有动态添加过方法。
 
 // 动态去判断下eat方法有没有实现,如果没有实现,动态添加.
 // 作用:处理未实现的对象方法
 // 调用时刻:只要调用了一个不存在的对象方法就会调用
 // sel:就是未实现方法编号
 
 // 判断对象方法有没有实现
 +(BOOL)resolveInstanceMethod:(SEL)sel
 
 // 判断类方法有没有实现
 + (BOOL)resolveClassMethod:(SEL)sel
 
 
 3, 进入苹果系统内部查看如何动态添加方法(这是官方文档中的方法)
 // dynamicMethodIMP方法
 // 动态添加这个dynamicMethodIMP方法
 void dynamicMethodIMP(id self, SEL _cmd) {
 // implementation ....
 }
 
 // 苹果内部的动态添加方法
 @implementation MyClass
 + (BOOL)resolveInstanceMethod:(SEL)aSEL
 {
 if (aSEL == @selector(resolveThisMethodDynamically)) {
 class_addMethod([self class], aSEL, (IMP) dynamicMethodIMP, "v@:");
 return YES;
 }
 return [super resolveInstanceMethod:aSEL];
 }
 
 
 */


void play(id self,SEL sel)
{
    
    NSLog(@"%@,%@",self,NSStringFromSelector(sel));
    
}

//默认方法都有两个隐式参数
/*
2, C函数中两个隐式参数的意思 :
1, self:方法调用者
_cmd:当前调用方法编号
方法的隐式参数即: 没有暴露出来参数.
*/

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    
    if (sel==NSSelectorFromString(@"play")) {
        
        class_addMethod(self, sel,(IMP)play,"v@:");
    }
    
    return [super resolveInstanceMethod:sel];
}


@end
