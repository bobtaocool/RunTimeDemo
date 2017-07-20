//
//  ViewController.m
//  BobRunTimeDemo
//
//  Created by bob on 16/11/26.
//  Copyright © 2016年 bob. All rights reserved.
//

#import "ViewController.h"
#import "testModel.h"
#import "UIGestureRecognizer+BobGestureBlock.h"
#import "UIView+bgColor.h"
#import "NSMutableArray+safe.h"
#import "UIViewController+addProperty.h"
#import "Student.h"
#import "UIAlertView+Block.h"
@interface ViewController ()

@end

@implementation ViewController


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
  

    [self.view addGestureRecognizer:[UITapGestureRecognizer TapgestureWithBlock:^(id gestureRecongnizer) {
        
        NSLog(@"点击");
        
        
    }]];

     // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)btnAction:(UIButton *)sender {
    
    switch (sender.tag) {
        case 1001:
        {
            NSLog(@"动态生成方法");
            
            Student *student=[Student new];
            
            [student performSelector:@selector(play) withObject:nil afterDelay:1];
            
        }
            break;
            case 1002:
        {
              NSLog(@"动态生成属性方法");
            
            self.name=@"888";
            
            NSLog(@"%@",self.name);
            
        }
            break;
            
            case 1003:
        {
            
              NSLog(@"交换方法");
            
            NSMutableArray *arr=[NSMutableArray array];
            
            [arr addObject:nil];
            
        }
            break;
            case 1004:
        {
            
             NSLog(@"block回调");
            
        }
            break;
            case 1005:
        {
             NSLog(@"归档解档");
            
            [self testArchive];
            
        }
            break;
            
            case 1006:
        {
            
            NSLog(@"字典转模型");
        }
            break;
            
        default:
        {
            
        }
            break;
    }
    
    
}


#pragma mark-归档接档管理

-(void)testArchive
{

    testModel *model=[testModel new];
    
    model.name=@"小红";
    
    model.home=@"小汪";
    
    model.age=2;
    
    model.arr=@[@"A",@"B"];
    
    [testModel archiveModel:model andName:@"test"];
    
    testModel *unmodel=[testModel unarchveandName:@"test"];
 
    
    NSLog(@"%@",unmodel);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
