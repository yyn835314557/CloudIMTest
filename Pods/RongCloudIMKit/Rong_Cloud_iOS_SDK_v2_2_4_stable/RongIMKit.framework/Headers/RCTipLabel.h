//
//  RCMessageTipLabel.h
//  iOS-IMKit
//
//  Created by Gang Li on 10/27/14.
//  Copyright (c) 2014 RongCloud. All rights reserved.
//

#ifndef __RCTipLabel
#define __RCTipLabel
#import <UIKit/UIKit.h>
/**
 *  RCTipLabel
 */
@interface RCTipLabel : UILabel
/**
 *  UIEdgeInsets
 */
@property(nonatomic, assign) UIEdgeInsets marginInsets;
/**
 *  greyTipLabel
 *
 *  @return return greyTipLabel
 */
+ (instancetype)greyTipLabel;
@end
#endif