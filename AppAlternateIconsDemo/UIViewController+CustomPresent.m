//
//  UIViewController+CustomPresent.m
//  AppAlternateIconsDemo
//
//  Created by litianqi on 2018/10/31.
//  Copyright © 2018 tqUDown. All rights reserved.
//

#import "UIViewController+CustomPresent.h"
#import <objc/runtime.h>
@implementation UIViewController (CustomPresent)
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method presentM = class_getInstanceMethod(self.class, @selector(presentViewController:animated:completion:));
        Method presentSwizzlingM = class_getInstanceMethod(self.class, @selector(cu_presentViewController:animated:completion:));
        
        method_exchangeImplementations(presentM, presentSwizzlingM);
    });
}

- (void)cu_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion{
    if ([viewControllerToPresent isKindOfClass:[UIAlertController class]]) {
        UIAlertController * alertVC = (UIAlertController *)viewControllerToPresent;
        if (alertVC.title == nil && alertVC.message == nil) {
            NSLog(@"alert dissmiss");
            return;
        }
    }
    
    [self cu_presentViewController:viewControllerToPresent animated:flag completion:completion];
}

@end
