//
//  Annimal+Associated.m
//  RuntimeTest2
//
//  Created by bob on 2017/7/20.
//  Copyright © 2017年 bob. All rights reserved.
//

#import "Annimal+Associated.h"
#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

@implementation Annimal (Associated)

-(void)setBlock:(PlayBlock)block
{
    objc_setAssociatedObject(self, @selector(block), block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    
    
}

-(PlayBlock)block
{
    
    return objc_getAssociatedObject(self, @selector(block));
    
}
@end
