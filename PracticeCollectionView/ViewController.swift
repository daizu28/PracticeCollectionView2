//
//  ViewController.swift
//  PracticeCollectionView
//
//  Created by 小林玲衣奈 on 2020/10/01.
//  Copyright © 2020 小林玲衣奈. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    private let images = ["checkedTask", "emptyTask", "enterTask"]
    
    // レイアウト設定(エッジ)
       private let sectionInsets = UIEdgeInsets(top: 5.0, left: 2.0, bottom: 5.0, right: 2.0)

       // 1行あたりのアイテム数
       private let itemsPerRow: CGFloat = 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
     // １つのセクションの中に表示するセル（要素）の数。
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //表示したい数
        return 8
        
    }
    
    // セル（要素）に表示する内容
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
         // Tag番号を使ってインスタンスをつくる
        let backgroundImageView = cell.contentView.viewWithTag(1)  as! UIImageView
               let backgroundImage = UIImage(named: images[0])
               backgroundImageView.image = backgroundImage
        
        return cell
    }
    
    // Screenサイズに応じたセルサイズを返す
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        //paddingだからセル同士の隙間？
           let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        //padding分を引いてる？
           let availableWidth = view.frame.width - paddingSpace
        //padding分を引いてアイテム数で割ってるのが横幅になる？
           let widthPerItem = availableWidth / itemsPerRow
        //縦幅と横幅が同じということ
           return CGSize(width: widthPerItem, height: widthPerItem)
       }


       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return sectionInsets
       }

       // セルの行間の設定
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 5.0
       }
    
    // セルが選択されたときの処理
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tapされたよ")
    }

}

