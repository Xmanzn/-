//
//  PathModle.h
//  画板
//
//  Created by Macx on 15/12/24.
//  Copyright © 2015年 Macx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PathModle : NSObject

@property(nonatomic ,assign)  CGFloat lineWidth;
@property(nonatomic ,strong) UIColor *linecolor;
@property(nonatomic ,assign) CGPathRef path;


@end
