//
//  AppDelegate.swift
//  CloudIMTest
//
//  Created by 游义男 on 15/7/21.
//  Copyright © 2015年 游义男. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,RCIMUserInfoDataSource {

    var window: UIWindow?
    func getUserInfoWithUserId(userId: String!, completion: ((RCUserInfo!) -> Void)!) {
        
        let userInfo = RCUserInfo()
        userInfo.userId = userId
        switch userId{
            case "youyinan1":
            userInfo.name = "游义男1"
            
            userInfo.portraitUri = "http://p4.gexing.com/G1/M00/2B/11/rBACE1H3eu7yXNi5AAAlylorN-k825_200x200_3.jpg?recache=20131108"
            
            case "youyinan":
            userInfo.name = "游义男"
            userInfo.portraitUri = "http://p2.gexing.com/touxiang/2012/5/24/201254105942767_200x200_3.jpg?recache=20131108"
            
        default:
            print("无此用户")
        }
        return completion(userInfo)
    }
    
    func connectServer( completion:() ->Void) {
        //query saved token
        let tokenCache = NSUserDefaults.standardUserDefaults().objectForKey("kDeviceToken") as? String
        
        // initialization
        RCIM.sharedRCIM().initWithAppKey("k51hidwq1mfsb")
        
        //use token test connection
        RCIM.sharedRCIM().connectWithToken("bTkovYNtiHEOBc828EN2Lt69amEBkQ8PAKgSfjyNLVVG1Kc310tHOsAJx0GUQImaYOTWmm0r3EylBUtdAyBs54sGVabxr1S8", success: { (_) -> Void in
            
            // set current user infomation
            //            let currentUser = RCUserInfo(userId: "youyinan1", name: "游义男1", portrait: "http://pic25.nipic.com/20121209/9252150_194258033000_2.jpg")
            //            RCIMClient.sharedRCIMClient().currentUserInfo = currentUser
            
            let currentUserInfo = RCUserInfo(userId: "youyinan1", name: "游义男1", portrait: nil)
            RCIMClient.sharedRCIMClient().currentUserInfo = currentUserInfo
            print("success1")
            
            dispatch_async(dispatch_get_main_queue(),{ () -> Void in
                completion()
            })
        
            }, error: { (_) -> Void in
                print("defeat")
            }) { () -> Void in
                print("token error or lose efficacy")
        }
        
        
        
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        //        RCIM.sharedRCIM().initWithAppKey("k51hidwq1mfsb", deviceToken:tokenCache)
        // 设置用户信息提供者为自己 AppDelegate
        RCIM.sharedRCIM().userInfoDataSource = self
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

