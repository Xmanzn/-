//
//  ViewController.m
//  画板
//
//  Created by Macx on 15/12/24.
//  Copyright © 2015年 Macx. All rights reserved.
//

#import "ViewController.h"
#import "ToolView.h"
#import "PanelView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    ToolView *toolView = [[ToolView alloc] initWithFrame:CGRectMake(0,20 , kScreenWidth, 100)];
  
    [self.view addSubview:toolView];
    
    PanelView *panelView = [[PanelView alloc] initWithFrame:CGRectMake(0, 120,kScreenWidth, kScreenHeight-120)];
    panelView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:panelView];
    
    
    
    
    toolView.colorBlock = ^(UIColor *color){
      
        panelView.currentColor = color;
    };
    toolView.widthBlock = ^(CGFloat width){
        
        panelView.currentWidth = width;
    };
    toolView.eraseBlock = ^{
      
        panelView.currentColor = [UIColor whiteColor];
        panelView.currentWidth = 6;
    };
    toolView.undoBlock = ^{
      
        [panelView undoAction];
    };
    toolView.clearBlock = ^{
        
        [panelView clearAction];
    };
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
