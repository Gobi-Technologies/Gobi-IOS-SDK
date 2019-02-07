//
//  ViewController.swift
//  GobiSDK
//
//  Created by savilov on 02/07/2019.
//  Copyright (c) 2019 Gobitech. All rights reserved.
//

import UIKit
import GobiSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Gobi.with("customer-id")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

