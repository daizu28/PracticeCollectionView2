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
    
    
    var imagesArray = ["checkedTask", "emptyTask", "enterTask"]
    
    //ユーザーデフォルトを使うよ
    let saveData: UserDefaults = UserDefaults.standard
    
    //クラスを入れるための配列
    var todoArray : [String] = ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
    
    //チェックボックスの状態を入れる配列
    var onoffArray : [Bool] = [false, false]
    
    
    // レイアウト設定(エッジ)
       private let sectionInsets = UIEdgeInsets(top: 5.0, left: 2.0, bottom: 5.0, right: 2.0)

       // 1行あたりのアイテム数
       private let itemsPerRow: CGFloat = 2
    
        //セクション数の取得
        var sectionNumber = 0

        //行数の取得
        var rowNumber = 0
    
    //セルの宣言
    let cell = UICollectionViewCell()
    
    //遷移したよーって時に使うやつ
    var observer: NSKeyValueObservation?
    
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
        
        //遷移されたことを検知していく
//        collectionView.dataSource = self
//        collectionView.delegate = self
//
//        observer = UserDefaults.observe(\.todo, options: [.initial, .new]){ (_, change) in
//            self.todoArray = change.newValue ?? []
//            self.collectionView.reloadData()
//        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        roadTodoArray()
    }
    


     // １つのセクションの中に表示するセル（要素）の数。
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //表示したい数
        return 100
        
    }
    
       //今までの書き込みを読み込む
    func roadTodoArray(){
 
      todoArray = saveData.object(forKey: "text") as! [String]
        
        collectionView.reloadData()

    }
    
    // セル（要素）に表示する内容
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
         // Tag番号を使ってインスタンスをつくる(背景の画像)
        let backgroundImageView = cell.contentView.viewWithTag(1)  as! UIImageView
        //Tag番号を使ってインスタンスをつくる(ラベル)
        let titleLabel = cell.contentView.viewWithTag(2) as! UILabel
        
        //配列からラベルを表示
        titleLabel.text = todoArray[indexPath.row]
        
        //画像の配列のデータを読み取って表示をする(全部変わる)
        if todoArray[indexPath.row] == "" {
            let backgroundImage = UIImage(named: imagesArray[1])
            backgroundImageView.image = backgroundImage
        } else {
            let backgroundImage = UIImage(named: imagesArray[2])
            backgroundImageView.image = backgroundImage
        }
        
        return cell
        
    }
    
    // セクションを増やす
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    // セルが選択されたときの処理
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        //セクション数の取得
        sectionNumber = indexPath.section
        //行数の取得
        rowNumber = indexPath.row
        //セクションで分けてないから行のほうに何個目なのか出る
        print("このセルはセクション\(indexPath.section)の\(indexPath.row)行目です")
        

        //画面遷移させる
        performSegueToCardView()
        
        
    }

    //セグエを指定して画面遷移させるメソッド
    func performSegueToCardView(){
        performSegue(withIdentifier: "toCardView", sender: nil)
    }
    
    
    //セグエを準備する時に呼ばれるメソッド(値渡しをする)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "toCardView" {
            let cardViewController = segue.destination as! CardViewController
            cardViewController.rowNumber = self.rowNumber
        }
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
