//
//  ConversationListViewController.swift
//  CloudIMTest
//
//  Created by 游义男 on 15/7/21.
//  Copyright © 2015年 游义男. All rights reserved.
//

import UIKit

class ConversationListViewController: RCConversationListViewController {
    


    @IBAction func ShowMenu(sender: UIBarButtonItem) {
//        UIAlertController
//        var frame = sender.valueForKey("view")?.frame
//        frame?.origin.y = (frame?.origin.y)! + 30
//        KxMenu.showMenuInView(self.view, fromRect: frame!, menuItems: [
//            KxMenuItem("客服",image: UIImage(named: ""),target:self,action:"ClickMenu1"),
//            KxMenuItem("测试与好友聊天",image: UIImage(named: ""),target:self,action:"ClickMenu2")
//            ])
//        
        let items = [
            MenuItem(title: "客服", iconName: "", glowColor: UIColor.redColor(), index: 0),
            MenuItem(title: "与游义男1聊天", iconName: "", glowColor: UIColor.blueColor(), index: 1),
            MenuItem(title: "通讯录", iconName: "", glowColor: UIColor.yellowColor(), index: 2),
            MenuItem(title: "关于", iconName: "", glowColor: UIColor.grayColor(), index: 3)
        ]
        let menu = PopMenu(frame: self.view.bounds, items: items)
        menu.menuAnimationType = PopMenuAnimationType.NetEase
        if menu.isShowed{
            return
        }
        menu.didSelectedItemCompletion = { (selectedItem:MenuItem!) -> Void in
            
            switch selectedItem.index{
            case 1:
                //代码跳转到会话界面
                let conVC = RCConversationViewController()
                
                conVC.targetId = "youyinan1"
                conVC.userName = "游义男1"
                conVC.conversationType = RCConversationType.ConversationType_PRIVATE
                conVC.title = conVC.userName
                self.navigationController?.pushViewController(conVC, animated: true)
                self.tabBarController!.tabBar.hidden = true
            default:
                print(selectedItem.title)
            }
        }
        menu.showMenuAtView(self.view)
    }
    func ClickMenu1(){
        print("与客服聊天")
    }
    func ClickMenu2(){
        
        let conVC = RCConversationViewController()
        
        conVC.targetId = "youyinan1"
        conVC.userName = "游义男1"
        conVC.conversationType = RCConversationType.ConversationType_PRIVATE
        conVC.title = conVC.userName
        self.navigationController?.pushViewController(conVC, animated: true)
        self.tabBarController!.tabBar.hidden = true

    }
    let conVC = RCConversationViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.connectServer( { () -> Void in
//            print("success2")
//            self.title = "连接成功"
            self.setDisplayConversationTypes([
                RCConversationType.ConversationType_CHATROOM.rawValue,
                RCConversationType.ConversationType_CUSTOMERSERVICE.rawValue,
                RCConversationType.ConversationType_DISCUSSION.rawValue,
                RCConversationType.ConversationType_APPSERVICE.rawValue,
                RCConversationType.ConversationType_GROUP.rawValue,
                RCConversationType.ConversationType_PRIVATE.rawValue,
                RCConversationType.ConversationType_PUBLICSERVICE.rawValue,
                RCConversationType.ConversationType_SYSTEM.rawValue])
            self.refreshConversationTableViewIfNeeded()
            
        })
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        self.tabBarController!.tabBar.hidden = false
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let  destVC = segue.destinationViewController as! RCConversationViewController
        destVC.targetId = self.conVC.targetId
        destVC.userName = self.conVC.userName
        destVC.conversationType = self.conVC.conversationType
        destVC.title = conVC.title
        
        self.tabBarController?.tabBar.hidden = true
        
        
    }
    override func onSelectedTableRow(conversationModelType: RCConversationModelType, conversationModel model: RCConversationModel!, atIndexPath indexPath: NSIndexPath!) {
        //代码跳转
//        let conVC = RCConversationViewController()
//        conVC.targetId = model.targetId
//        conVC.userName = model.conversationTitle
//        conVC.conversationType = RCConversationType.ConversationType_PRIVATE
//        conVC.title = model.conversationTitle
//        self.navigationController?.pushViewController(conVC, animated: true)
//        self.tabBarController?.tabBar.hidden = true
                conVC.targetId = model.targetId
                conVC.userName = model.conversationTitle
                conVC.conversationType = RCConversationType.ConversationType_PRIVATE
                conVC.title = model.conversationTitle
        self.performSegueWithIdentifier("tapOnCell", sender: self)
    }


}
