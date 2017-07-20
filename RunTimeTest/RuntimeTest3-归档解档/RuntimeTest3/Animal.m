//
//  Animal.m
//  RuntimeTest3
//
//  Created by bob on 2017/7/20.
//  Copyright © 2017年 bob. All rights reserved.
//

#import "Animal.h"
#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif
@implementation Animal

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int count=0;
    
    Ivar *ivars=class_copyIvarList([self class], &count);
    
    NSLog(@"%d",count);
    
    for (NSUInteger i = 0; i < count; i ++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
    free(ivars);
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    
    unsigned int count=0;
    
    Ivar *ivars=class_copyIvarList([self class], &count);
    
    for (NSUInteger i = 0; i < count; i ++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        id value = [aDecoder decodeObjectForKey:key];
        [self setValue:value forKey:key];
        
    }
    free(ivars);
    
    return self;
    
}


@end
