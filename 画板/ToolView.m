//
//  ToolView.m
//  画板
//
//  Created by Macx on 15/12/24.
//  Copyright © 2015年 Macx. All rights reserved.
//
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#import "ToolView.h"



@implementation ToolView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self _creativeButtonView];
        [self _creativeWidthView];
        [self _creativeColorView];
    }
    return self;
}


- (void)_creativeButtonView{
    
    CGFloat buttonWidth = kScreenWidth / 5;
    NSArray *buttonName = @[@"颜色",@"宽度",@"橡皮",@"撤销",@"清屏"];
//    listView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];


    for (int i = 0; i < 5; i++) {
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(buttonWidth * i , 0, buttonWidth, 50)];
        button.backgroundColor = [UIColor grayColor];
        [button setTitle:buttonName[i] forState:UIControlStateNormal];
        button.tag = 100 + i ;
        [button addTarget:self action:@selector(methodSelect:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    
}

- (void)_creativeColorView{
    colorArr = @[[UIColor redColor],
                 [UIColor orangeColor],
                 [UIColor yellowColor],
                 [UIColor greenColor],
                 [UIColor blueColor],
                 [UIColor cyanColor],
                 [UIColor purpleColor]];
    
    colorView = [[UIView alloc] initWithFrame:CGRectMake(0, 50, kScreenWidth, 50)];
//    colorView.userInteractionEnabled = YES;
    
    [self addSubview:colorView];
    CGFloat colorWidth=  kScreenWidth / colorArr.count;
    
    for (int i = 0; i < colorArr.count; i++) {
        
        UIButton * colorButton = [[UIButton alloc]initWithFrame:CGRectMake(i * colorWidth, 0, colorWidth, 50)];
        colorButton.backgroundColor = colorArr[i];
        colorButton.tag = 100 + i ;
        
        [colorButton addTarget:self action:@selector(colorAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [colorView addSubview:colorButton];
    }
    
    
    

    
}
- (void)_creativeWidthView{
    
    widthView = [[UIView alloc] initWithFrame:CGRectMake(0, 50, kScreenWidth, 50)];
    widthView.backgroundColor = [UIColor grayColor];
    [self addSubview:widthView];
    widthArr = @[@2,@4,@6,@8,@10];
    colorView.userInteractionEnabled = YES;
    
    CGFloat buttonWidth = kScreenWidth / widthArr.count;
    for (int i = 0; i < widthArr.count; i++) {
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i * buttonWidth, 0, buttonWidth, 50)];
        [button setTitleColor: [UIColor cyanColor] forState:UIControlStateNormal];
        [button setTitle:[NSString stringWithFormat:@"%@",widthArr[i]] forState:UIControlStateNormal];
        button.tag = 100 + i;
        
        [button addTarget:self action:@selector(widthAction:) forControlEvents:UIControlEventTouchUpInside];
        [widthView addSubview:button];
        widthView.hidden = YES;
        
        
        
    }
}





- (void)methodSelect:(UIButton *)button{
    
    if (button.tag == 100) {
        
        colorView.hidden = NO;
        widthView.hidden = YES;
        
        
    }
    
    if (button.tag == 101) {
        

        colorView.hidden = YES;
        widthView.hidden = NO;
        
    }
    if (button.tag == 102) {
        
        self.eraseBlock();
        
    }
    if (button.tag == 103) {
     
        self.undoBlock();
    }
    if (button.tag == 104) {
        
        self.clearBlock();
    }
    
    
}

- (void)colorAction:(UIButton *)button{
    
    UIColor *color = colorArr[button.tag - 100];
    if (_colorBlock) {
    
        _colorBlock(color);
    }
  
}

- (void)widthAction:(UIButton *)button{
    
      NSNumber * num = widthArr[button.tag - 100];
    
    if (_widthBlock) {
        _widthBlock([num floatValue]);
    }
    
}







@end
