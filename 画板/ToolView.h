//
//  ToolView.h
//  画板
//
//  Created by Macx on 15/12/24.
//  Copyright © 2015年 Macx. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef  void(^ColorBlockType)(UIColor *color);
typedef  void(^WidthBlockType)(CGFloat width);
typedef  void(^ListBlockType)(void);

@interface ToolView : UIView
{

    UIView * colorView;
    UIView * widthView;
    
    NSArray* colorArr;
    NSArray *widthArr;
}

@property (nonatomic,copy) ColorBlockType colorBlock;
@property (nonatomic,copy) WidthBlockType widthBlock;
@property (nonatomic,copy) ListBlockType eraseBlock;
@property (nonatomic,copy) ListBlockType undoBlock;
@property (nonatomic,copy) ListBlockType clearBlock;

@end
