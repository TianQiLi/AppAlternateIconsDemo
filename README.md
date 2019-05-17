# AppAlternateIconsDemo

# 发布上线遇到的坑，一直被拒
提交审核的时候，显示二进制无效具体错误如下：
Newsstand Icon - One or more of the Newsstand icons referenced by CFBundleIcons.UINewsstandIcon was not valid. The icon must be a .png file, at least 72 DPI, and it must have an aspect ratio between 1:2 and 2:1. Also, the artwork must be flat with no rounded corners.

解决办法，移除.plist里面的UINewsstandIcon 字典，这个是系统自动添加进去的，因为没有用到该特性，所以不需要该字段




****核心方法***
···
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //TODO: 自定义替换的条件：比如双十一
        
        NSString * test = [UIApplication sharedApplication].alternateIconName;
        //newIcon 就是在plist 文件的CFBundleAlternateIcons 里面配置的一个含有不同尺寸的一套图标的字典对象名称
        //setAlternateIconName 就是更换的api
        [[UIApplication sharedApplication] setAlternateIconName:@"newIcon" completionHandler:^(NSError * _Nullable error) {
            if (error) {
                NSLog(@"更换app图标发生错误了 ： %@",error);
            }
        }];
    });
    
   
    
    return YES;
}


···

[原文参考](https://www.jianshu.com/p/ad52b430fee1)
