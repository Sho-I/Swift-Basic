//
//  ViewController.swift
//  UI_2.1.4_Challenge1
//
//  Created by Aryzae on 2016/03/26.
//  Copyright © 2016年 Aryzae. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: interface
    @IBOutlet var displayLabel: UILabel!
    @IBOutlet var numberCollectionView: UICollectionView!
    @IBOutlet var symbolCollectionView: UICollectionView!
    
    // MARK: implementation
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        numberCollectionView.delegate = self
        numberCollectionView.dataSource = self
        
        symbolCollectionView.delegate = self
        symbolCollectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == numberCollectionView {
            return 14
        }
        
        if collectionView == symbolCollectionView {
            return 5
        }
        
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cellRect = CGRectMake(0, 0, 150, 150)
        
        let cell = NumberCell(frame: cellRect)
        
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

}

