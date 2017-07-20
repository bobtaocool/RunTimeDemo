//
//  UIAlertView+Block.m
//  BobRunTimeDemo
//
//  Created by bob on 2017/7/20.
//  Copyright © 2017年 bob. All rights reserved.
//

#import "UIAlertView+Block.h"
#import <objc/runtime.h>
@implementation UIAlertView (Block)

- (void)setCallBack:(AlertBlockBack)callBack
{
    objc_setAssociatedObject(self, @selector(callBack), callBack, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.delegate = self;
}

- (AlertBlockBack)callBack
{
    return objc_getAssociatedObject(self, @selector(callBack));
}

#pragma mark - delegate method

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.callBack) {
        self.callBack(alertView, buttonIndex);
    }
}


@end
