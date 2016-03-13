//
//  PanelView.h
//  画板
//
//  Created by Macx on 15/12/24.
//  Copyright © 2015年 Macx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PanelView : UIView
{
    CGMutablePathRef path;
    NSMutableArray * pathArr;
}

- (void)undoAction;
- (void)clearAction;

@property(nonatomic , strong) UIColor *currentColor;
@property(nonatomic , assign) CGFloat currentWidth;

@end
