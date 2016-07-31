//
//  ViewController.m
//  递归的方法取消1px
//
//  Created by 宓珂璟 on 16/7/30.
//  Copyright © 2016年 宓珂璟. All rights reserved.
//

#import "ViewController.h"
#import "JZNavigationExtension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self.navigationController.navigationBar setBarTintColor:[UIColor greenColor]];
    UIImageView *cancelImageView = [self searchNavigationBarUnderLine:self.navigationController.navigationBar];
    cancelImageView.hidden = YES;
    [self.navigationController setJz_navigationBarSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 100)];
    
    self.navigationItem.title = @"测试界面";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"左侧" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 44, 44);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    // 这个UIBarButtonSystemItemFixedSpace属性没有任何样式，是专门给item之间加间隙的 正数间距越大，负数就越小
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = 50;
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(clickRight)];
    self.navigationItem.rightBarButtonItems = @[spaceItem,rightBarButton];
    
    
    [self logView:self.navigationController.navigationBar];
    
}


- (void)logView:(UIView *)view
{
    NSLog(@"<!>,%@",view.description);
    for (UIView *subView in view.subviews)
    {
        [self logView:subView];
    }
}
//2016-07-31 10:13:54.150 递归的方法取消1px[1487:33958] <!>,<UINavigationBar: 0x7fef5b764dd0; frame = (27.5 20; 375 100); opaque = NO; autoresize = W; gestureRecognizers = <NSArray: 0x7fef5b40f150>; layer = <CALayer: 0x7fef5b762d30>>
//2016-07-31 10:13:54.150 递归的方法取消1px[1487:33958] <!>,<_UINavigationBarBackground: 0x7fef5b76d680; frame = (0 -20; 375 120); opaque = NO; autoresize = W; userInteractionEnabled = NO; layer = <CALayer: 0x7fef5b762bf0>>
//2016-07-31 10:13:54.151 递归的方法取消1px[1487:33958] <!>,<_UIBackdropView: 0x7fef5b76d8c0; frame = (0 0; 375 120); opaque = NO; autoresize = W+H; userInteractionEnabled = NO; layer = <_UIBackdropViewLayer: 0x7fef5b772bb0>>
//2016-07-31 10:13:54.151 递归的方法取消1px[1487:33958] <!>,<_UIBackdropEffectView: 0x7fef5b7768e0; frame = (0 0; 375 120); clipsToBounds = YES; opaque = NO; autoresize = W+H; userInteractionEnabled = NO; layer = <CABackdropLayer: 0x7fef5b7739f0>>
//2016-07-31 10:13:54.151 递归的方法取消1px[1487:33958] <!>,<UIView: 0x7fef5b777b50; frame = (0 0; 375 120); hidden = YES; opaque = NO; autoresize = W+H; userInteractionEnabled = NO; layer = <CALayer: 0x7fef5b7720f0>>
//2016-07-31 10:13:54.151 递归的方法取消1px[1487:33958] <!>,<UIImageView: 0x7fef5b76df10; frame = (0 120; 375 0.5); userInteractionEnabled = NO; layer = <CALayer: 0x7fef5b76e2f0>>
//2016-07-31 10:13:54.163 递归的方法取消1px[1487:33958] <!>,<_UINavigationBarBackIndicatorView: 0x7fef5b783f10; frame = (0 39.5; 13 21); alpha = 0; opaque = NO; userInteractionEnabled = NO; layer = <CALayer: 0x7fef5b784340>>
//2016-07-31 10:13:54.163 递归的方法取消1px[1487:33958] <!>,<UINavigationItemView: 0x7fef5b510380; frame = (153.5 64; 68 27); opaque = NO; userInteractionEnabled = NO; layer = <CALayer: 0x7fef5b510530>>
//2016-07-31 10:13:54.163 递归的方法取消1px[1487:33958] <!>,<UILabel: 0x7fef5b5203c0; frame = (27.5 87.5; 0 21.5); text = '测试界面'; opaque = NO; userInteractionEnabled = NO; layer = <_UILabelLayer: 0x7fef5b505180>>
//2016-07-31 10:13:54.164 递归的方法取消1px[1487:33958] <!>,<UIButton: 0x7fef5b6565d0; frame = (16 56; 44 44); opaque = NO; layer = <CALayer: 0x7fef5b655db0>>
//2016-07-31 10:13:54.164 递归的方法取消1px[1487:33958] <!>,<UINavigationButton: 0x7fef5b65c6f0; frame = (281 62; 39 30); opaque = NO; layer = <CALayer: 0x7fef5b655e30>>
//2016-07-31 10:13:54.212 递归的方法取消1px[1487:33958] <!>,<UIImageView: 0x7fef5b52ff50; frame = (11 5.5; 17 19); clipsToBounds = YES; opaque = NO; userInteractionEnabled = NO; layer = <CALayer: 0x7fef5b535670>>

- (void)clickLeft
{
    
}

- (void)clickRight
{
    
}

- (UIImageView *)searchNavigationBarUnderLine:(UIView *)view
{
    // 查找是否属于UIImageView以及Frame是否小于1.0
    if ([view isKindOfClass:[UIImageView class]] && view.bounds.size.height < 1.0f)
    {
        return (UIImageView *)view;
    }
    // 循环第二层查找
    for (UIView *subView in view.subviews)
    {
        // 递归查找
        UIImageView *imageView = [self searchNavigationBarUnderLine:subView];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
