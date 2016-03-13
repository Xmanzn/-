//
//  PanelView.m
//  画板
//
//  Created by Macx on 15/12/24.
//  Copyright © 2015年 Macx. All rights reserved.
//

#import "PanelView.h"
#import "PathModle.h"

@implementation PanelView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        pathArr = [[NSMutableArray alloc] init];
        _currentColor = [UIColor blackColor];
        _currentWidth = 3;
    }
    return self;
}


- (void)drawRect:(CGRect)rect {

    
    for (PathModle * modle in pathArr) {
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextAddPath(context, modle.path);
        [modle.linecolor setStroke];
        CGContextSetLineWidth(context, modle.lineWidth);
        CGContextDrawPath(context, kCGPathStroke);
     
    }
    
    if (path != nil) {
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextAddPath(context, path);
        [_currentColor setStroke];
        CGContextSetLineWidth(context, _currentWidth);
        CGContextDrawPath(context, kCGPathStroke);
        
    }
    

    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch * touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    path = CGPathCreateMutable();
//    记得释放
    CGPathMoveToPoint(path, NULL, point.x,point.y );

    
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch * touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    CGPathAddLineToPoint(path, NULL, point.x, point.y);
    
    [self setNeedsDisplay];
    
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    PathModle * pModle = [[PathModle alloc] init];
    pModle.lineWidth = _currentWidth ;
    pModle.linecolor = _currentColor;
    pModle.path = path;
    
    [pathArr addObject:pModle];
    CGPathRelease(path);
    path = nil;
    
}

- (void)undoAction{
    
    [pathArr removeLastObject];
    [self setNeedsDisplay];
    
}
- (void)clearAction{
    
    [pathArr removeAllObjects];
    [self setNeedsDisplay];
    
}




@end
