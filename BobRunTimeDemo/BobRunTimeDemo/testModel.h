//
//  testModel.h
//  BobRunTimeDemo
//
//  Created by bob on 16/11/26.
//  Copyright © 2016年 bob. All rights reserved.
//

#import "Bobarchive.h"

@interface testModel : Bobarchive

@property(nonatomic,copy)NSString *name;

@property(nonatomic,copy)NSString*home;

@property(nonatomic,assign)int age;

@property(nonatomic,strong)NSArray *arr;

@end
