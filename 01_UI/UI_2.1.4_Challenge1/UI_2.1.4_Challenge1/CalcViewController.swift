//
//  ViewController.swift
//  UI_2.1.4_Challenge1
//
//  Created by Aryzae on 2016/03/26.
//  Copyright © 2016年 Aryzae. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: interface
    @IBOutlet var displayLabel: UILabel!
    @IBOutlet var buttonCollectionView: UICollectionView!
//    var customButtonCell: CustomButtonCell!
    
    
    
    let CUSTOM_BUTTON_CELL_ID = "CustomButtonCellId"
    let cellCount: Int = 19
    
    // MARK: implementation
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Delegate & DataSource
        buttonCollectionView.delegate = self
        buttonCollectionView.dataSource = self
//        buttonCollectionView.registerClass(CustomButtonCell.self, forCellWithReuseIdentifier: CUSTOM_BUTTON_CELL_ID)
        
        initilizeCollectionViewLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        print("\(self.view.bounds)")
    }
    
    // MARK: Initilize Function
    private func initilizeCollectionViewLayout() {
        // CollectionViewLayout Settings
        guard let collectionViewLayout = buttonCollectionView!.collectionViewLayout as? CustomCollectionViewLayout else {
            return
        }
//        collectionViewLayout.maxColumns = 4
//        collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        collectionViewLayout.minimumLineSpacing = 0
//        collectionViewLayout.minimumInteritemSpacing = 0
        
        // Cell Detail
//        collectionViewLayout.cellPattern.append((sideLength: 2, heightLength: 2, column: 0, row: 0))
//        collectionViewLayout.cellPattern.append((sideLength: 1, heightLength: 1, column: 2, row: 0))
//        collectionViewLayout.cellPattern.append((sideLength: 1, heightLength: 2, column: 2, row: 1))
//        collectionViewLayout.cellPattern.append((sideLength: 1, heightLength: 2, column: 0, row: 2))
//        collectionViewLayout.cellPattern.append((sideLength: 1, heightLength: 1, column: 1, row: 2))
//        collectionViewLayout.cellPattern.append((sideLength: 2, heightLength: 1, column: 1, row: 3))
    }
    
    // MARK: UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellCount
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        collectionView.registerClass(CustomButtonCell.self, forCellWithReuseIdentifier: CUSTOM_BUTTON_CELL_ID)

        let width = collectionView.bounds.width
        let height = collectionView.bounds.height
        
//        let cellRect = CGRectMake(0, 0, 50, 50)
        var customButtonCell = CustomButtonCell()
        customButtonCell.backgroundColor = .blueColor()
//        customButtonCell.titleLabel = UILabel(frame: cellRect)
//        customButtonCell.titleLabel.layer.borderWidth = 1.0
//        customButtonCell.titleLabel.layer.borderColor = UIColor.blueColor().CGColor
//        customButtonCell.titleLabel.text = "1"
        customButtonCell = buttonCollectionView!.dequeueReusableCellWithReuseIdentifier(CUSTOM_BUTTON_CELL_ID, forIndexPath: indexPath) as! CustomButtonCell//        customButtonCell.bounds = cellRect
//        customButtonCell.setLabel()
//        customButtonCell.titleLabel = UILabel()
//        customButtonCell.titleLabel.text = "1"
//        print("\(width):\(height)")
//        print("\(cellRect)")
        
        return customButtonCell
    }
}

