//
//  inputs.swift
//  CloudIMTest
//
//  Created by 游义男 on 15/8/18.
//  Copyright © 2015年 游义男. All rights reserved.
//

import Foundation

// optionSet
struct Inputs:OptionSetType     {
    let rawValue:Int
    static let user = Inputs(rawValue: 1 << 0)
    static let pass = Inputs(rawValue: 1 << 1)
    static let mail = Inputs(rawValue: 1 << 2)
    
    
}
extension Inputs:BooleanType{
    var boolValue:Bool{
        return self.rawValue == 0b111
    }
}

// judge whether input all
extension Inputs{
    func isAllOK() -> Bool{
//        return self == [.user, .pass, .mail]
//        return self.rawValue == 0b111
        let count = 3
        // serach items
        var found = 0
        
        for time in 0..<count{
            if self.contains(Inputs(rawValue:1 << time)){
                found++
            }
        }
        // 是否全部找到
        return found == count
        
    }
}
