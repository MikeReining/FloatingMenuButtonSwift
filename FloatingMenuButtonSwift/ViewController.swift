//
//  ViewController.swift
//  FloatingMenuButtonSwift
//
//  Created by Michael Reining on 2/18/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FloatingMenuControllerDelegate {
    
    @IBOutlet weak var floatingButton: FloatingButton!

    
    @IBAction func floatingButtonPressed(sender: AnyObject) {
        let controller = FloatingMenuController(fromView: sender as UIButton)
        controller.delegate = self
        
        controller.buttonArray = [
            FloatingButton(image: UIImage(named: "icon-add"), backgroundColor: UIColor.flatBlueColor),
            FloatingButton(image: UIImage(named: "model-008"), backgroundColor: nil),
            FloatingButton(image: UIImage(named: "model-007"), backgroundColor: nil)
            ]
        
        
        presentViewController(controller, animated: true, completion: nil)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        floatingButton.setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func floatingMenuController(controller: FloatingMenuController, didTapOnButton button: UIButton, atIndex index: Int) {
        println(index)
    }
    
    func floatingMenuControllerDidCancel(controller: FloatingMenuController) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }

}

