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
	targetId
	userName
	conversationType
	导航标题title
	
融云中的token:{"code":200,"userId":"youyinan1","token":"bTkovYNtiHEOBc828EN2Lt69amEBkQ8PAKgSfjyNLVVG1Kc310tHOsAJx0GUQImaYOTWmm0r3EylBUtdAyBs54sGVabxr1S8"}

# 用户信息提供者
RCIMUserInfoDataSource

# 截图:
![图片1](/Resouce/屏幕快照 2015-07-28 14.46.33.png)
![图片1](/Resouce/屏幕快照 2015-07-28 14.45.21.png) 
![图片1](/Resouce/屏幕快照 2015-07-28 14.45.07.png)
![图片1](/Resouce/屏幕快照 2015-07-28 14.45.30.png)
1.登录界面:背景图片可以滚动
2.会话界面:
3.具体的对话:
4.点击右上角加➕出现动画
