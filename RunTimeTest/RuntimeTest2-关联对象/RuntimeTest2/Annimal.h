//
//  Annimal.h
//  RuntimeTest2
//
//  Created by bob on 2017/7/20.
//  Copyright © 2017年 bob. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Annimal : NSObject
{
    NSString *_color;
    NSString *_type;
    NSString *_test;
    
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSUInteger age;

- (NSDictionary *)getallProperties;
- (NSDictionary *)getallIvars;
- (NSDictionary *)getallMethods;

@end
