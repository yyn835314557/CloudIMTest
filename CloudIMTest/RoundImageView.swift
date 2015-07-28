//
//  RoundImageView.swift
//  CloudIMTest
//
//  Created by 游义男 on 15/7/22.
//  Copyright © 2015年 游义男. All rights reserved.
//

import UIKit

@IBDesignable

class RoundImageView: UIImageView {
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    @IBInspectable var cornerRadius:CGFloat = 0{
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = (cornerRadius>0)
        }
    }
    @IBInspectable var borderWidth:CGFloat = 0{
        didSet{
            layer.borderWidth = borderWidth
            
        }
    }
    @IBInspectable var borderColor:UIColor?{
        didSet{
            layer.borderColor = borderColor!.CGColor
        }
    }
}
