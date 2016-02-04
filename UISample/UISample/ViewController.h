//
//  ViewController.h
//  UISample
//
//  Created by jianglinshan@qiyi.com on 16/2/3.
//  Copyright © 2016年 jlstmac@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@end

@interface ViewController(PropertyTest)

@property(nonatomic,strong) NSString* name;

@end