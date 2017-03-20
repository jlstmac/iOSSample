//
//  ViewController.m
//  CAShapLayerLearn
//
//  Created by jianglinshan@qiyi.com on 16/7/12.
//  Copyright © 2016年 jlstmac@gmail.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 200, 400)];
    view.backgroundColor = [UIColor orangeColor];
//    view.layer.mask = [self createEllipseLayer];
    view.layer.mask = [self createCircleLayer];
    [self showAnimation:view.layer.mask];
    
    [self.view addSubview:view];
    
    CAShapeLayer* shapeLayer = [self createEllipseLayer];
    [self showAnimation:shapeLayer];
    [self.view.layer addSublayer:shapeLayer];
    
}

- (CAShapeLayer*)createMaskForView:(UIView*)view{
    CAShapeLayer* layer = [CAShapeLayer layer];
    CGFloat viewWidth = CGRectGetWidth(view.frame);
    CGFloat viewHight = CGRectGetHeight(view.frame);
    CGFloat topSpace = viewHight/10;
    CGFloat rightSpace = viewWidth/10;
    CGPoint p1 = CGPointZero;
    CGPoint p2 = CGPointMake(viewWidth - rightSpace, 0);
    CGPoint p3 = CGPointMake(viewWidth - rightSpace, topSpace);
    CGPoint p4 = CGPointMake(viewWidth, topSpace);
    CGPoint p5 = CGPointMake(viewWidth - rightSpace, topSpace*2);
    CGPoint p6 = CGPointMake(viewWidth - rightSpace, viewHight);
    CGPoint p7 = CGPointMake(0, viewHight);
    UIBezierPath* path = [UIBezierPath bezierPath];
    [path moveToPoint:p1];
    [path addLineToPoint:p2];
    [path addLineToPoint:p3];
    [path addLineToPoint:p4];
    [path addLineToPoint:p5];
    [path addLineToPoint:p6];
    [path addLineToPoint:p7];
    [path closePath];
    layer.path = path.CGPath;
    return layer;
}

- (CAShapeLayer*)createEllipseLayer{
    CAShapeLayer* layer = [CAShapeLayer layer];
    CGPoint starPoint = CGPointMake(10, 300);
    CGPoint endPoint = CGPointMake(200, 300);
    CGPoint controlPoint = CGPointMake(100, 100);
    UIBezierPath* path = [UIBezierPath bezierPath];
    [path moveToPoint:starPoint];
    [path addQuadCurveToPoint:endPoint controlPoint:controlPoint];
    [path addLineToPoint:starPoint];
    layer.fillColor = [[UIColor blackColor] CGColor];
    layer.strokeColor = [[UIColor blackColor] CGColor];
    layer.path = path.CGPath;
    layer.fillRule = kCAFillRuleEvenOdd;
    return layer;
}

- (CAShapeLayer*)createCircleLayer
{
    CAShapeLayer* layer = [CAShapeLayer layer];
    CGPoint center = CGPointMake(100, 150);
    CGFloat radius = 100;
    CGFloat startAngle = M_PI;
    CGFloat endAngle = 2*M_PI;
    UIBezierPath* path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    layer.path = path.CGPath;
    return layer;
}

- (void)showAnimation:(CAShapeLayer*)layer
{
    CGFloat fromValue = 0;
    CGFloat toValue = 1;
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @(fromValue);
    animation.toValue = @(toValue);
    animation.duration = 5;
//    animation.beginTime = 2;
    [layer addAnimation:animation forKey:@"show"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
