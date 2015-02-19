//
//  FloatingMenuController.swift
//  FloatingMenuButtonSwift
//
//  Created by Michael Reining on 2/19/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import UIKit

enum Direction {
    case Up
    case Left
}


class FloatingMenuController: UIViewController {
    let fromView: UIView
    let blurredView = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
    let closeButton = FloatingButton(image: UIImage(named: "icon-close"), backgroundColor: UIColor.flatRedColor)
    var buttonDirection = Direction.Up
    var buttonPadding: CGFloat = 70
    var buttonArray = [UIButton]()
    
    // MARK: UIViewController
    
    init(fromView: UIView) {
        self.fromView = fromView
        super.init(nibName: nil, bundle: nil)
        
        modalPresentationStyle = .OverFullScreen
        modalTransitionStyle = .CrossDissolve
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buttonOffsetPoint(point: CGPoint, offset: CGFloat) -> CGPoint {
        return CGPoint(x: point.x, y: point.y - offset)
    }
    
    func configureButtons() {
        let parentController = presentingViewController!
        let center = parentController.view.convertPoint(fromView.center, fromView: fromView.superview)
        
        closeButton.center = center
        
        for (index, button) in enumerate(buttonArray) {
            var buttonOffset = buttonPadding * CGFloat (index + 1)
            button.center = buttonOffsetPoint(center, offset: buttonOffset)
            buttonOffset += buttonPadding
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        closeButton.addTarget(self, action: "closeMenu:", forControlEvents: .TouchUpInside)
        
        blurredView.frame = view.bounds
        view.addSubview(blurredView)
        view.addSubview(closeButton)
        
        for button in buttonArray {
            view.addSubview(button)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        configureButtons()
    }
    
    func closeMenu(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
