//
//  Bobarchive.m
//  BobRunTimeDemo
//
//  Created by bob on 16/11/26.
//  Copyright © 2016年 bob. All rights reserved.
//

#import "Bobarchive.h"
#import <objc/runtime.h>
@implementation Bobarchive


+(NSArray*)allProperty
{
    unsigned int count=0;
    
    Ivar *ivarList=class_copyIvarList(self, &count);
    
    NSMutableArray *proNames=[NSMutableArray array];
    
    for (NSInteger i=0; i<count; i++) {
        
        Ivar iva=ivarList[i];
        
        NSString *name=[NSString stringWithUTF8String:ivar_getName(iva)];
        
        NSString *key=[name substringFromIndex:1];
        
        [proNames addObject:key];
        
    }
    
    free(ivarList);
    
    return [proNames copy];
    
    
}

//归档

- (void)encodeWithCoder:(NSCoder *)aCoder
{
 
    NSArray *properNames=[[self class] allProperty];
    
    for (NSString *propertyName in properNames) {
        
        
        [aCoder encodeObject:[self valueForKey:propertyName] forKey:propertyName];
        
    }

}

//解档
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
     NSArray *properNames=[[self class] allProperty];
    
    for (NSString *propertyName in properNames) {
        
        
        [self setValue:[aDecoder decodeObjectForKey:propertyName] forKey:propertyName];
        
    }
    
    return self;
    
}// NS_DESIGNATED_INITIALIZER


+(BOOL)archiveModel:(Bobarchive*)model andName:(NSString*)name
{
    NSString *path=[self getPath:name];
    
    return [NSKeyedArchiver archiveRootObject:model toFile:path];
}



+(id)unarchveandName:(NSString*)name
{
     NSString *path=[self getPath:name];
    return [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
}


+ (NSString *)getPath:(NSString *)name{
    NSString * docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString * path = [docPath stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@.data",name]];
    NSLog(@"%@",path);
    return path;
}

- (NSString *)description{
    NSMutableString *descriptionString = [NSMutableString stringWithFormat:@"\n"];
    // 取得所有成员变量名
    NSArray *properNames = [[self class] allProperty];
    for (NSString *propertyName in properNames) {
        NSString *propertyNameString = [NSString stringWithFormat:@"%@:%@\n",propertyName,[self valueForKey:propertyName]];
        [descriptionString appendString:propertyNameString];
    }
    
    return [descriptionString copy];
}


@end
