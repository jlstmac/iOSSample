//
//  ViewController.m
//  UISample
//
//  Created by jianglinshan@qiyi.com on 16/2/3.
//  Copyright © 2016年 jlstmac@gmail.com. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGRect statuBarRect = [[UIApplication sharedApplication] statusBarFrame];
    NSLog(@"screenRect:%@,statuBar:%@",NSStringFromCGRect(screenRect),NSStringFromCGRect(statuBarRect));
    
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 200, 300)];
    view.backgroundColor = [UIColor redColor];
    view.bounds = CGRectMake(20, 20, 160, 260);
    //子view超出bounds部分是否裁剪
    view.clipsToBounds = YES;

    
    UIView* view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 120, 120)];
    view2.backgroundColor = [UIColor yellowColor];
    [view addSubview:view2];
    
    UIView* view3 = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 180, 80)];
    view3.backgroundColor = [UIColor grayColor];
    [view addSubview:view3];
    view3.transform = CGAffineTransformScale(view3.transform, 0.5, 0.5);
    view3.transform = CGAffineTransformRotate(view3.transform, 0.2);
    view3.transform = CGAffineTransformTranslate(view3.transform, 100, 100);
    
//    [view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    
    //同一个label中设置多重颜色
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    NSMutableAttributedString* attributedString = [[NSMutableAttributedString alloc] initWithString:@"jls:haha"];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 4)];
//    [attributedString addAttribute:NSStrokeColorAttributeName value:[UIColor greenColor] range:NSMakeRange(2, 5)];
    [attributedString addAttribute:NSStrokeWidthAttributeName value:[NSNumber numberWithInt:5] range:NSMakeRange(2, 5)];

    label.text = @"123";

    label.attributedText = attributedString;
//    label.text = @"123";
//    label.textColor = [UIColor blackColor];
    
    label.center = CGPointMake(100, 100);
    [view addSubview:label];
    [self.view addSubview:view];
    
    UIView* viewSec = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 300)];
    viewSec.backgroundColor = [UIColor greenColor];
    [self.view addSubview:viewSec];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

@implementation ViewController(PropertyTest)

- (id)name{
    return objc_getAssociatedObject(self, "name");
}

- (void)setName:(NSString *)name{
    objc_setAssociatedObject(self, "name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end