#IM 
***
* 会话 
* 联系人 
* 客服 
* 关于

##2.实现私聊(文字图片对讲，发送位置)
### 用户体系流向
	App Server(用户信息存储) Rongyun(好友关系，群主关系)
### 设置当前用户信息
	RCIMClient(单例)
### 私聊UI
	RCConversationUIViewController
##3.私聊对象信息
* targetId
* userName
* conversationType
* 导航标题title
* 用户注册的UI布局和约束(UIStackView)
	 - 自定义segue(给identifier起个名字) 从页面进入口拉一个segue
	 - UITableView来写登录界面，切割storyboard，UIStackView
	 - 一次性定位所有指定的控件
	 	 － [UIKitConvenience](https://github.com/egold/UIKitConvenience)使用这个第三方框架的UIView+ViewRecursion文件的runBlockOnAllSubviews方法
	 	 － IBOutlet Collection (推荐使用)
	 - HUD组件
	 	 - [swiftNotice](https://github.com/johnlui/SwiftNotice)引用这个组件的方法 `self.errorNotice("必填项目为空")`
	 - 炫酷动画文本框
	 	 - [UITextBox]()
	 - 输入校验证
	 	 - 长度，范围，合法性 常规操作 NSPredicate(谓词) 正则表达式
	 - 第三方验证库
	 	 - [AJWValidator](https://github.com/adamwaite/AJWValidator)
	 - `pod update --no-repo-update` (不读取cocoapods库列表,加快更新速度)
融云中的token:{"code":200,"userId":"youyinan1","token":"bTkovYNtiHEOBc828EN2Lt69amEBkQ8PAKgSfjyNLVVG1Kc310tHOsAJx0GUQImaYOTWmm0r3EylBUtdAyBs54sGVabxr1S8"}

# 用户信息提供者
RCIMUserInfoDataSource

# 截图:
![图片1](/Resouce/屏幕快照 2015-07-28 14.46.33.png)
![图片1](/Resouce/屏幕快照 2015-07-29 11.14.09.png) 
![图片1](/Resouce/屏幕快照 2015-07-28 14.45.07.png)
![图片1](/Resouce/屏幕快照 2015-07-29 11.19.30.png)
![图片2](/Resouce/屏幕快照 2015-07-29 11.14.24.png)
***

1.登录界面:背景图片可以滚动
2.会话界面:
3.具体的对话:
4.点击右上角加➕出现动画
