//
//  UIGestureRecognizer+BobGestureBlock.h
//  BobRunTimeDemo
//
//  Created by bob on 16/11/26.
//  Copyright © 2016年 bob. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BobTapGestureBlock)(id gestureRecongnizer);

@interface UIGestureRecognizer (BobGestureBlock)

+(instancetype)TapgestureWithBlock:(BobTapGestureBlock)block;
@end

