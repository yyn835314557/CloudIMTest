//
//  LoginViewController.swift
//  CloudIMTest
//
//  Created by 游义男 on 15/7/22.
//  Copyright © 2015年 游义男. All rights reserved.
//

import UIKit

//extension UIView{
//    @IBInspectable var cornerRadius:CGFloat{
//        get{
//            return layer.cornerRadius
//        }set{
//            layer.cornerRadius = newValue
//            layer.masksToBounds = (newValue > 0)
//        }
//    }
//}
class LoginViewController: UIViewController,RCAnimatedImagesViewDelegate {

    @IBOutlet weak var wallpaperImageView: RCAnimatedImagesView!
    @IBOutlet weak var loginStackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.wallpaperImageView.delegate = self
        self.wallpaperImageView.startAnimating()
    }
    
    func animatedImagesNumberOfImages(animatedImagesView: RCAnimatedImagesView!) -> UInt {
        return 3
    }
    
    func animatedImagesView(animatedImagesView: RCAnimatedImagesView!, imageAtIndex index: UInt) -> UIImage! {
        return UIImage(named: "image\(index + 1)")
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(1) { () -> Void in
            self.loginStackView.axis = UILayoutConstraintAxis.Vertical

        }
        
        loginStackView.axis = UILayoutConstraintAxis.Vertical

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
