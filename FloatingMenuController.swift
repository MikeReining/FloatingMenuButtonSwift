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
protocol FloatingMenuControllerDelegate: class {
    func floatingMenuController(controller: FloatingMenuController, didTapOnButton button: UIButton, atIndex index: Int)
    func floatingMenuControllerDidCancel(controller: FloatingMenuController)
}


class FloatingMenuController: UIViewController {
    weak var delegate: FloatingMenuControllerDelegate?
    let fromView: UIView
    let blurredView = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
    let closeButton = FloatingButton(image: UIImage(named: "icon-close"), backgroundColor: UIColor.flatRedColor)
    var buttonDirection = Direction.Up
    var buttonPadding: CGFloat = 70
    var buttonArray = [UIButton]()
    
    var labelDirection = Direction.Left
    var labelTitles = [String]()
    var buttonLabels = [UILabel]()
    var labelPadding: CGFloat = 80
    
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
    
    func positionButtons(visible: Bool) {
        let parentController = presentingViewController!
        let center = parentController.view.convertPoint(fromView.center, fromView: fromView.superview)
        
        closeButton.center = center
        
        if visible {
            closeButton.alpha = 1
            closeButton.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2))

            
        } else {
            closeButton.alpha = 0
        }
        
        
        for (index, button) in enumerate(buttonArray) {
            var buttonOffset = buttonPadding * CGFloat (index + 1)
            if visible {
                button.center = buttonOffsetPoint(center, offset: buttonOffset)
                buttonOffset += buttonPadding
                button.transform = CGAffineTransformIdentity
                positionLabels()
            } else {
                button.center = center
                button.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4))

            }
            
            button.addTarget(self, action: "menuButtonPressed:", forControlEvents: .TouchUpInside)

        }
    }
    
    func labelOffsetPoint(point: CGPoint, offset: CGFloat) -> CGPoint {
        return CGPoint(x: point.x - offset, y: point.y)
    }
    
    func positionLabels() {
        for (index, button) in enumerate(buttonArray) {
            var label = buttonLabels[index]
            var labelOffset = (labelPadding + label.bounds.width) / 2
            label.center = labelOffsetPoint(button.center, offset: labelOffset)
            
        }
    }
    
    
    func animateButtons(toVisible: Bool) {
        positionButtons(!toVisible)
        
        UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .allZeros, animations: {
            [self]
            self.positionButtons(toVisible)
            }, completion: nil)
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
        
        for title in labelTitles {
            let label = UILabel()
            label.text = title
            label.textColor = UIColor.flatBlackColor
            label.textAlignment = .Center
            label.font = UIFont(name: "HelveticaNeue-Light", size: 15)
            label.sizeToFit()
            label.bounds.size.height += 8
            label.bounds.size.width += 20
            label.layer.cornerRadius = 4
            label.layer.masksToBounds = true
            view.addSubview(label)
            buttonLabels.append(label)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        animateButtons(true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        animateButtons(false)
    }
    
    func closeMenu(sender: UIButton) {
        self.delegate?.floatingMenuControllerDidCancel(self)
    }
    
    func menuButtonPressed(sender: UIButton) {
        
        if let index = find(buttonArray, sender) {
            self.delegate?.floatingMenuController(self, didTapOnButton: sender, atIndex: index)
        }
    }
    
}
