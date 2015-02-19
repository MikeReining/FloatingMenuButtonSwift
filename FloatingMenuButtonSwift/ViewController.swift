//
//  ViewController.swift
//  FloatingMenuButtonSwift
//
//  Created by Michael Reining on 2/18/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var floatingButton: FloatingButton!

    
    @IBAction func floatingButtonPressed(sender: AnyObject) {
        let controller = FloatingMenuController(fromView: sender as UIButton)
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


}

