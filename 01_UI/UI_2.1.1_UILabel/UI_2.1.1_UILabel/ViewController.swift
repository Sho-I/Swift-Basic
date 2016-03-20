//
//  ViewController.swift
//  UI_2.1.1_UILabel
//
//  Created by ShoIto on 2016/03/15.
//  Copyright © 2016年 ShoIto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: interface
    @IBOutlet var helloLabel: UILabel!
    let hello = "Hello World"

    // MARK: implementation
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        helloLabel.text = hello
    }
}

