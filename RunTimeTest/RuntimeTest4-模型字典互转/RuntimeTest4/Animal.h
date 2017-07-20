//
//  Animal.h
//  RuntimeTest3
//
//  Created by bob on 2017/7/20.
//  Copyright © 2017年 bob. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject

@property (nonatomic, copy) NSString *name; // 姓名
@property (nonatomic, strong) NSNumber *age; // 年龄
@property (nonatomic, copy) NSString *color; //颜色
@property (nonatomic, copy) NSString *type; //品种

// 生成model
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

// 转换成字典
- (NSDictionary *)ModelToDictionary;

@end
