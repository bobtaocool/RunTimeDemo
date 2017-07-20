//
//  main.m
//  RuntimeTest1
//
//  Created by bob on 2017/7/19.
//  Copyright © 2017年 bob. All rights reserved.
//

#import <Foundation/Foundation.h>
#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

//自定义方法
void PlayMethod(id self, SEL _cmd, id some)
{
    NSLog(@"%@岁的%@玩：%@", object_getIvar(self, class_getInstanceVariable([self class], "_age")),[self valueForKey:@"name"],some);
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //动态创建对象 ，继承于NSObject
        Class Animal=objc_allocateClassPair([NSObject class], "Annial", 0);
        
        // 为该类添加NSString *_name成员变量
        class_addIvar(Animal, "_name", sizeof(NSString*), sizeof(NSString*), @encode(NSString*));
        
        class_addIvar(Animal, "_age", sizeof(int), sizeof(int), @encode(int));
        
        // 注册方法名为play的方法
        SEL s=sel_registerName("_play:");
        
        // 为该类增加名为play的方法
        class_addMethod(Animal, s, (IMP)PlayMethod, "v@:@");
        
        // 注册该类
        objc_registerClassPair(Animal);
        
        //创建一个实例
        id catAnimal=[[Animal alloc]init];
        
        // KVC 动态改变 对象peopleInstance 中的实例变量
        [catAnimal setValue:@"小猫" forKey:@"name"];
        
        // 从类中获取成员变量Ivar
        Ivar ageIvar=class_getInstanceVariable(Animal, "_age");
        
        object_setIvar(catAnimal, ageIvar, @2);
        
        ((void (*)(id, SEL, id))objc_msgSend)(catAnimal, s, @"篮球");
        
        //因此这里要先销毁实例对象后才能销毁类；
        catAnimal = nil;
        
        // 销毁类
        objc_disposeClassPair(Animal);
         
        // insert code here...

    }
    return 0;
}
