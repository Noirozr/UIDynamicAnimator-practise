//
//  ViewController.m
//  Gravity
//
//  Created by Yongjia Liu on 13-9-15.
//  Copyright (c) 2013年 Yongjia Liu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) UIDynamicAnimator* animator;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIWebView *webView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 320,240)];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
    [webView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:webView];
    UIDynamicAnimator *animator=[[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    UIGravityBehavior *gravity=[[UIGravityBehavior alloc]initWithItems:@[webView]];
    UICollisionBehavior *collision=[[UICollisionBehavior alloc]initWithItems:@[webView]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    [animator addBehavior:gravity];
    [animator addBehavior:collision];
    collision.collisionDelegate=self;
    self.animator=animator;
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
