//
//  ViewController.swift
//  PracticeCollectionView
//
//  Created by 小林玲衣奈 on 2020/10/01.
//  Copyright © 2020 小林玲衣奈. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //コレクションビューの宣言？Flowlayoutには必要なのかな？
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let images = ["checkedTask", "emptyTask", "enterTask"]
    
    //ユーザーデフォルトを使うよ
    let saveData: UserDefaults = UserDefaults.standard
    
    //やりたいことをラベルに表示させるための文字(これでいいのか分からない)
    var todo: String = ""
    
    //カードのページでチェックされているかどうかを確かめるための変数
    var isCheck: Bool = false
    
    
    // レイアウト設定(エッジ)
       private let sectionInsets = UIEdgeInsets(top: 5.0, left: 2.0, bottom: 5.0, right: 2.0)

       // 1行あたりのアイテム数
       private let itemsPerRow: CGFloat = 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.dataSource = self


          // レイアウト設定(デフォルトでのセルの幅は50らしい)
          let layout = UICollectionViewFlowLayout()
          layout.itemSize = CGSize(width: 160, height: 160)
          collectionView.collectionViewLayout = layout
        //行の最後のセルがふちにぴったりとくっつく(横の余白)
        layout.minimumInteritemSpacing = 8
        //縦の余白
        layout.minimumLineSpacing = 10
        //セクションごとのマージンみたいな
        layout.sectionInset = UIEdgeInsets(top: 24, left: 16, bottom: 24, right: 16)
        //横スクロール
        layout.scrollDirection = .horizontal


    }
    
    
     // １つのセクションの中に表示するセル（要素）の数。
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //表示したい数
        return 100
        
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
    
    // セクションを増やす
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    // セルが選択されたときの処理
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = UICollectionViewCell()
        //セクション数の取得
        let sectionNumber = indexPath.section
        //行数の取得
        let rowNumber = indexPath.row
        //セクションで分けてないから行のほうに何個目なのか出る
        print("このセルはセクション\(indexPath.section)の\(indexPath.row)行目です")
    }

}




//本当は良くないかもだけどgithubで上手にブランチが切れてなかった用のコメントアウト
//    // Screenサイズに応じたセルサイズを返す
//       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        //paddingだからセル同士の隙間？
//           let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
//        //padding分を引いてる？
//           let availableWidth = view.frame.width - paddingSpace
//        //padding分を引いてアイテム数で割ってるのが横幅になる？
//           let widthPerItem = availableWidth / itemsPerRow
//        //縦幅と横幅が同じということ
//           return CGSize(width: widthPerItem, height: widthPerItem)
//       }
//
//
//       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//           return sectionInsets
//       }
//
//       // セルの行間の設定
//       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//           return 5.0
//       }
