//
//  ConversationViewController.swift
//  CloudIMTest
//
//  Created by 游义男 on 15/7/21.
//  Copyright © 2015年 游义男. All rights reserved.
//

import UIKit

class ConversationViewController: RCConversationViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.targetId = "youyinan1"
//        self.userName = "游义男1"
//        
//        self.conversationType = RCConversationType.ConversationType_PRIVATE
//        self.title = userName
        
        self.setMessageAvatarStyle(RCUserAvatarStyle._USER_AVATAR_CYCLE)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
    