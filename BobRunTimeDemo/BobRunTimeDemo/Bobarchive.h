//
//  Bobarchive.h
//  BobRunTimeDemo
//
//  Created by bob on 16/11/26.
//  Copyright © 2016年 bob. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bobarchive : NSObject<NSCoding>

+(NSArray*)allProperty;

+(BOOL)archiveModel:(Bobarchive*)model andName:(NSString*)name;

+(id)unarchveandName:(NSString*)name;

@end
