# AppAlternateIconsDemo

# 发布上线遇到的坑，一直被拒
提交审核的时候，显示二进制无效具体错误如下：
Newsstand Icon - One or more of the Newsstand icons referenced by CFBundleIcons.UINewsstandIcon was not valid. The icon must be a .png file, at least 72 DPI, and it must have an aspect ratio between 1:2 and 2:1. Also, the artwork must be flat with no rounded corners.

解决办法，移除.plist里面的UINewsstandIcon 字典，这个是系统自动添加进去的，因为没有用到该特性，所以不需要该字段

[sdf](https://www.jianshu.com/p/ad52b430fee1)
