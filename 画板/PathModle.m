//
//  PathModle.m
//  画板
//
//  Created by Macx on 15/12/24.
//  Copyright © 2015年 Macx. All rights reserved.
//

#import "PathModle.h"

@implementation PathModle


-(void)setPath:(CGPathRef)path{
    
    if (_path != path) {
    
        CGPathRelease(_path);
        
        _path = CGPathRetain(path);
    }
}
@end
