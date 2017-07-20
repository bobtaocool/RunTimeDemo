//
//  Annimal+Associated.h
//  RuntimeTest2
//
//  Created by bob on 2017/7/20.
//  Copyright © 2017年 bob. All rights reserved.
//

#import "Annimal.h"

typedef void(^PlayBlock)();

@interface Annimal (Associated)

@property(nonatomic,copy)PlayBlock block;

@end
