//
//  UIAlertView+Block.h
//  BobRunTimeDemo
//
//  Created by bob on 2017/7/20.
//  Copyright © 2017年 bob. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^AlertBlockBack)(UIAlertView *, NSInteger);

@interface UIAlertView (Block)<UIAlertViewDelegate>

@property (nonatomic, copy) AlertBlockBack callBack;

@end
