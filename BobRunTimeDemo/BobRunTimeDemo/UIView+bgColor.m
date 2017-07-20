//
//  UIView+bgColor.m
//  BobRunTimeDemo
//
//  Created by bob on 2016/11/29.
//  Copyright © 2016年 bob. All rights reserved.
//

#import "UIView+bgColor.h"
/** 导入头文件 */
#import <objc/runtime.h>
@implementation UIView (bgColor)

+(void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       
        /** 获取原始setBackgroundColor方法 */
        Method originalM = class_getInstanceMethod([self class], @selector(setBackgroundColor:));
        
        /** 获取自定义的pb_setBackgroundColor方法 */
        Method exchangeM = class_getInstanceMethod([self class], @selector(pb_setBackgroundColor:));
        
        /** 交换方法 */
        method_exchangeImplementations(originalM, exchangeM);
        
    });
 
}

/** 自定义的方法 */
-(void)pb_setBackgroundColor:(UIColor *) color{
    
    NSLog(@"%s",__FUNCTION__);
    
    /**
     1.更改颜色
     2.所有继承自UIView的控件,设置背景色都会设置成自定义的'orangeColor'
     3. 此时调用的方法 'pb_setBackgroundColor' 相当于调用系统的 'setBackgroundColor' 方法,原因是在load方法中进行了方法交换.
     4. 注意:此处并没有递归操作.
     */
    [self pb_setBackgroundColor:[UIColor orangeColor]];
}

@end
