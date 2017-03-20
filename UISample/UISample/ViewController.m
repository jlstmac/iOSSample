//
//  ViewController.m
//  UISample
//
//  Created by jianglinshan@qiyi.com on 16/2/3.
//  Copyright © 2016年 jlstmac@gmail.com. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "SecondViewController.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
{
    UITableView* tableView;
}
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
    
    NSArray* arr = @[@"1",@"2",@"ab",@"Ad",@"ACC"];
    NSArray* arrnum = @[@1,@2,@3,@4];

    NSLog(@"%@",[arr valueForKeyPath:@"uppercaseString"]);
//    NSNumber *sum = [arrnum valueForKeyPath:@"sum.self"];
    NSLog(@"%@",[arrnum valueForKeyPath:@"@sum.floatValue"]);
    NSNumber* number;
    
    
    //tableview test
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenRect.size.width, screenRect.size.height/2)];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* identifer = @"reuse";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    
    if ([indexPath row]%2 == 0) {
        cell.backgroundColor = [UIColor yellowColor];
    }else{
        cell.backgroundColor = [UIColor redColor];

    }
    
    return cell;
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"estimated");
    return 20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"height");

    if ([indexPath row]%2 == 0) {
        return 10;
    }else{
        return 30;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 500;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SecondViewController* vc = SecondViewController.new;
    [self.navigationController pushViewController:vc animated:YES];
//    [self presentViewController:vc animated:YES completion:^{
    
//    }];
//    [self addChildViewController:vc];
//    [self.view addSubview:vc.view];
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
