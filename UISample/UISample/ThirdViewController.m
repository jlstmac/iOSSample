//
//  ThirdViewController.m
//  UISample
//
//  Created by jianglinshan@qiyi.com on 2017/3/13.
//  Copyright © 2017年 jlstmac@gmail.com. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 20, 30)];
    [self.view addSubview:button];
    [button setBackgroundColor:[UIColor redColor]];
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchDown];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)click{
    NSLog(@"third");
    
    NSArray* keyArr = [[[UIApplication sharedApplication] keyWindow] subviews];
    NSLog(@"keywindow SUB:%@",keyArr);
    UIView* layoutView = (UIView*)[keyArr objectAtIndex:0];
    NSArray* layoutArr = [layoutView subviews];
    NSLog(@"layoutView SUB:%@",layoutArr);
    UIView* navtransView = [layoutArr objectAtIndex:0];
    NSArray* navArr = [navtransView subviews];
    NSLog(@"navtransView SUB:%@",navArr);
    UIView* wraperView = [navArr objectAtIndex:0];
    NSArray* wraperArr = [wraperView subviews];
    NSLog(@"wraperView SUB:%@",wraperArr);
    
//    ThirdViewController* vc = ThirdViewController.new;
    //    [self.navigationController pushViewController:vc animated:YES];
//    [self presentViewController:vc animated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
