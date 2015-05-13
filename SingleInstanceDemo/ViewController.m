//
//  ViewController.m
//  SingleInstanceDemo
//
//  Created by zhangyafeng on 15/5/13.
//  Copyright (c) 2015年 think. All rights reserved.
//

#import "ViewController.h"
#import "SingleObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    SingleObject *singleObject = [SingleObject shareInstance];
    
    SingleObject *singleObject2 = [[SingleObject alloc] init];
    
    SingleObject *singleObject3 = [[SingleObject alloc] init];
    
    NSLog(@"%@   %@ ,%@ ",singleObject, singleObject2, singleObject3);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
