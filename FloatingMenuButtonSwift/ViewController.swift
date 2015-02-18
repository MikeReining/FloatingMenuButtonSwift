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

    override func viewDidLoad() {
        super.viewDidLoad()
        floatingButton.setup()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

