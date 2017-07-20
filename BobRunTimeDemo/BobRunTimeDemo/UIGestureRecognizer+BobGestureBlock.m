//
//  UIGestureRecognizer+BobGestureBlock.m
//  BobRunTimeDemo
//
//  Created by bob on 16/11/26.
//  Copyright © 2016年 bob. All rights reserved.
//

#import "UIGestureRecognizer+BobGestureBlock.h"
#import <objc/runtime.h>

static const char target_key;

@implementation UIGestureRecognizer (BobGestureBlock)

+(instancetype)TapgestureWithBlock:(BobTapGestureBlock)block
{
    
    return [[self alloc]initWithActionBlock:block];
    
}


-(instancetype)initWithActionBlock:(BobTapGestureBlock)block
{
    
    self=[self init];

        if (block) {
            
            objc_setAssociatedObject(self, &target_key, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
   
                  }
    
    [self addTarget:self action:@selector(tapAction:)];

   
    return self;
}




-(void)tapAction:(id)sender
{
    
    BobTapGestureBlock block=objc_getAssociatedObject(self, &target_key);
    
    if (block) {
        
        block(sender);
    }
    
    
}

@end
