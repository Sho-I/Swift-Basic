//
//  CustomCollectionViewFlowLayout.swift
//  UI_2.1.4_Challenge1
//
//  Created by ShoIto on 2016/04/08.
//  Copyright © 2016年 ShoIto. All rights reserved.
//

import UIKit

struct StructPosition {
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
}

class CustomCollectionViewLayout: UICollectionViewLayout {
    
    private var maxColumns = 4
    private var maxRows = 5
    private let specialNumber = 16
    private var cellSize = [(width:CGFloat, height:CGFloat)]()
    private var contentSize = CGSizeZero
    private var numberCells = 0
    private var collectionCells = [UICollectionViewLayoutAttributes]()
    
    // 表示前の事前計算を行うメソッド(今回だけのよくない書き方)
    override internal func prepareLayout() {
        super.prepareLayout()
        
        guard let collectionView = self.collectionView else {
            return
        }
        
        // ContentSize指定(CollectionViewのサイズ)
        let width  = collectionView.bounds.width
        let height = collectionView.bounds.height
        contentSize = CGSizeMake(width, height)
        
        // CellSize
        let cellWidth: CGFloat = width / CGFloat(maxColumns)
        let cellHeight: CGFloat = width / CGFloat(maxColumns)
        cellSize = [(cellWidth, cellHeight)]
        
        //
        numberCells = collectionView.numberOfItemsInSection(0)
        
        // x,y座標
        var position = StructPosition()
        
        for index in 0..<numberCells {
            let indexPath = NSIndexPath(forItem: index, inSection: 0)
            let attribute = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
            
            if index == specialNumber {
                attribute.frame = CGRectMake(position.x, position.y, cellWidth*2, cellHeight)
                collectionCells.append(attribute)
                
                if index % maxColumns == 3 {
                    position.x = 0
                    position.y += cellHeight
                } else {
                    position.x += cellWidth*2
                }
            } else {
                attribute.frame = CGRectMake(position.x, position.y, cellWidth, cellHeight)
                collectionCells.append(attribute)
                
                if index % maxColumns == 3 {
                    position.x = 0
                    position.y += cellHeight
                } else {
                    position.x += cellWidth
                }
            }
        }
    }
    
    // コンテンツサイズを返すメソッド(スクロール時必須)
    override internal func collectionViewContentSize() -> CGSize {
        return contentSize
    }
    
    // 引数の範囲内に表示されるCell等のレイアウト情報を返メソッド
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributeArray = [UICollectionViewLayoutAttributes]()
        
        for i in 0..<numberCells {
            let indexPath = NSIndexPath(forItem: i, inSection: 0)
            guard let rect2 = self.layoutAttributesForItemAtIndexPath(indexPath)?.frame else {
                return nil
            }
            if CGRectIntersectsRect(rect, rect2) {
                guard let attribute = self.layoutAttributesForItemAtIndexPath(indexPath) else {
                    return nil
                }
                attributeArray.append(attribute)
            }
        }
        return attributeArray
    }
    
    // 引数のindexPathに対応するレイアウト情報を返すメソッド
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        return collectionCells[indexPath.row]
    }
}