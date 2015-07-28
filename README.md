#IM 
***
* 会话 
* 联系人 
* 客服 
* 关于
#实现私聊(文字图片对讲，发送位置)
## 用户体系流向
	App Server(用户信息存储) Rongyun(好友关系，群主关系)
## 设置当前用户信息
	RCIMClient(单例)
## 私聊UI
	RCConversationUIViewController
#3 私聊对象信息
	targetId
	userName
	conversationType
	导航标题title

{"code":200,"userId":"youyinan1","token":"bTkovYNtiHEOBc828EN2Lt69amEBkQ8PAKgSfjyNLVVG1Kc310tHOsAJx0GUQImaYOTWmm0r3EylBUtdAyBs54sGVabxr1S8"}

# 用户信息提供者
RCIMUserInfoDataSource
