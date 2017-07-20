//
//  UIImageView+PlaceHolderImage.m
//  BobRunTimeDemo
//
//  Created by bob on 2016/11/29.
//  Copyright © 2016年 bob. All rights reserved.
//

#import "UIImageView+PlaceHolderImage.h"
#import <objc/runtime.h>
@implementation UIImageView (PlaceHolderImage)

+ (void)load
{
    // 获取 UIImage 方法 -imageNamed: 的 Method
    Method imageNameMethod = class_getClassMethod(self, @selector(imageNamed:));
    
    // 获取 UIImage+PlaceHolderImage 方法 -replaced_imageNamed: 的 Method
    Method replaced_imageNamedMethod = class_getClassMethod(self, @selector(replaced_imageNamed:));
    
    // 将两个方法进行交换，现在如果调用 -imageNamed: 则调用的是下方 +replaced_imageNamed: 的实现
    method_exchangeImplementations(imageNameMethod, replaced_imageNamedMethod);
}

+ (UIImage *)replaced_imageNamed:(NSString *)imageName
{
    // 这里是递归调用吗？不是。因为现在调用 +replaced_imageNamed: 实现则是苹果框架内的  -imageNamed: 的实现。
    UIImage *image = [[UIImage class] replaced_imageNamed:imageName];
    if (!image)
    {
        image = [[UIImage class] replaced_imageNamed:@"placeImage"];
    }
    return image;
}

@end
