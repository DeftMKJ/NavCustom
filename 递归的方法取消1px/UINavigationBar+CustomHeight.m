//
//  UINavigationBar+CustomHeight.m
//  Taowaitao
//
//  Created by 宓珂璟 on 16/7/29.
//  Copyright © 2016年 walatao.com. All rights reserved.
//

#import "UINavigationBar+CustomHeight.h"

@implementation UINavigationBar (CustomHeight)

- (CGSize)sizeThatFits:(CGSize)size {
    // Change navigation bar height. The height must be even, otherwise there will be a white line above the navigation bar.
    CGSize newSize = CGSizeMake(self.frame.size.width, 100);
    return newSize;
}

//-(void)layoutSubviews {
//    [super layoutSubviews];
//    
//    // Make items on navigation bar vertically centered.
//    int i = 0;
//    for (UIView *view in self.subviews) {
//        NSLog(@"<%i>. %@", i, [view description]);
//        i++;
//        if (i == 1)
//            continue;
//        float centerY = self.bounds.size.height / 2.0f;
//        CGPoint center = view.center;
//        center.y = centerY;
//        view.center = center;
//    }
//}
-(void)layoutSubviews {
    [super layoutSubviews];
    
    // Make items on navigation bar vertically centered.
    int i = 0;
        for (UIView *view in self.subviews) {
//            NSLog(@"<%i>. %@", i, [view description]);
            i++;
            // 这里的1是背景imageView，不需要进行配置
            if (i == 1)
                continue;
            // 这里的3就是titleView，不设置就会有bug，titleView子视图不会跟着居中，需要手动调节他子视图Label的frame，这是个坑，一定要注意这样写
            if (i == 3)
            {
                for (UILabel *label in view.subviews) {
                    float y = (view.bounds.size.height - label.bounds.size.height) / 2;
                    CGRect rec = label.frame;
                    rec.origin.y = y;
                    label.frame = rec;
                }
            }
            [self alignVerticalCenter:view];
        }
    
}
- (void)alignVerticalCenter:(UIView *)view
{
    // 居中
    float centerY = self.bounds.size.height / 2.0f;
    CGPoint center = view.center;
    center.y = centerY;
    view.center = center;
}

@end
