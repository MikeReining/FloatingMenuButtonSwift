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
    
    
    convenience init(image: UIImage?, backgroundColor: UIColor?) {
        self.init()
        setImage(image, forState: .Normal)
        self.backgroundColor = backgroundColor
        
        // Configure button
        tintColor = UIColor.whiteColor()
        layer.cornerRadius = frame.width/2
        layer.masksToBounds = true
    }
    
    convenience override init() {
        self.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    }
    
    
    
    func setup() {
        tintColor = UIColor.whiteColor()
        if backgroundImageForState(.Normal) == nil {
            setBackgroundImage(UIColor.flatBlueColor.pixelImage, forState: .Normal)
        }
        
        layer.cornerRadius = frame.width/2
        layer.masksToBounds = true
    }
}

