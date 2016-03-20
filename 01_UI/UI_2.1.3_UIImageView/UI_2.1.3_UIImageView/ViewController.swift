//
//  ViewController.swift
//  UI_2.1.3_UIImageView
//
//  Created by Sho-I on 2016/03/20.
//  Copyright © 2016年 Sho-I. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: interface
    @IBOutlet var imageView: UIImageView!
    
    // MARK: implementation
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // acpect比維持
        imageView.contentMode = .ScaleAspectFit
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // named使用すると未だにメモリリークする?
        // assets使用の場合named以外に設定する方法ないっけか?
        guard let image = UIImage(named: "SakuraImage") else {
            // 画像が取れなかったのでerror
            return
        }
        // 画像をセット
        imageView.image = image
    }

}

