//
//  FloatingButton.swift
//  FloatingMenuButtonSwift
//
//  Created by Michael Reining on 2/18/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import UIKit

@IBDesignable
class FloatingButton: UIButton {
 
    
    func setup() {
        self.tintColor = UIColor.flatWhiteColor()
        self.backgroundColor = UIColor.flatBlueColor()
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.masksToBounds = true
        self.setBackgroundImage(UIColor.pixelImage(), forState: .Highlighted)
    }
    
}


extension UIColor {
    class func flatWhiteColor() -> UIColor {
        return UIColor(red: 0.9274, green: 0.9436, blue: 0.95, alpha: 1.0)
    }
    
    class func flatBlackColor() -> UIColor {
        return UIColor(red: 0.1674, green: 0.1674, blue: 0.1674, alpha: 1.0)
    }

    class func flatBlueColor() -> UIColor {
        return UIColor(red: 0.3132, green: 0.3974, blue: 0.6365, alpha: 1.0)
    }

    class func flatRedColor() -> UIColor {
        return UIColor(red: 0.9115, green: 0.2994, blue: 0.2335, alpha: 1.0)
    }
    
    class func pixelImage() -> UIImage {
        UIGraphicsBeginImageContext(CGSizeMake(1, 1))
        var context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, self.blackColor().CGColor)
        CGContextFillRect(context, CGRectMake(0, 0, 1, 1))
        var pixelImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return pixelImage
    }
    
}
