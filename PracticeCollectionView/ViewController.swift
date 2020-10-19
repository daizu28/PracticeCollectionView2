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
    
    
    //プレースホルダー風のラベルのための配列
    var placeholderArray : [String] = ["やってみたいことはある？", "", "", "", "", "", "行ってみたい場所はある？", "", "", "", "", "", "見てみたい景色はある？", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "食べてみたいものはなに？", "", "", "", "", "", "", "", "", "", "住んでみたい場所はある？", "", "", "", "", "なってみたいものはある？", "", "", "", "", "", "", "", "作ってみたいものはある？", "", "", "", "", "", "", "", "", "", "", "挑戦してみたいことはある？", "", "", "", "", "", "", "探しているものはある？", "", "", "", "", "", "", "", "", "買ってみたいものはある？", "", "", "", "", "", "", "", "知りたいことはある？", "", "", "", "", "", "", "", "", "", "", "", "", ""]
    
    
    var imagesArray = ["checkedTask", "emptyTask", "enterTask", "enterTask_p", "enterTask_b", "enterTask_c", "enterTask_g", "enterTask_o", "enterTask_r", "checkedTask_p", "checkedTask_b", "checkedTask_c", "checkedTask_g", "checkedTask_o", "checkedTask_r"]
    
    //ユーザーデフォルトを使うよ
    let saveData: UserDefaults = UserDefaults.standard
    
    //クラスを入れるための配列
    var todoArray : [String] = ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
    
    //チェックボックスの状態を入れる配列
    var onoffArray : [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    
    
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
        
        print(onoffArray.count)
        print(todoArray.count)
        
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
        //今までの書き込みを読み込む
        roadTodoArray()
        
        //今までのチェックボックスの様子を読み込む
        roadOnoffArray()
    }
    


     // １つのセクションの中に表示するセル（要素）の数。
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //表示したい数
        return 100
        
    }
    
       //今までの書き込みを読み込む
    func roadTodoArray(){
        if saveData.array(forKey: "text") != nil {
      todoArray = saveData.object(forKey: "text") as! [String]
        
        collectionView.reloadData()

        }
    }
    
    //今までのチェックボックスの様子を読み込む
    func roadOnoffArray(){
        if saveData.array(forKey: "check") != nil {
      
        onoffArray = saveData.object(forKey: "check") as! [Bool]
        
        collectionView.reloadData()
        }
    }
    
    
    // セル（要素）に表示する内容
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
         // Tag番号を使ってインスタンスをつくる(背景の画像)
        let backgroundImageView = cell.contentView.viewWithTag(1)  as! UIImageView
        //Tag番号を使ってインスタンスをつくる(ラベル)
        let titleLabel = cell.contentView.viewWithTag(2) as! UILabel
        
        //Tag番号を使ってインスタンスをつくる(ラベルプレースホルダー風)
        let likePlaceholderLabel = cell.contentView.viewWithTag(3) as! UILabel
        
        //書き込みがガチでない時だけラベルを表示させたい
            if todoArray[indexPath.row] == ""{
                //配列からプレースホルダー風のラベルの表示
                likePlaceholderLabel.text = placeholderArray[indexPath.row]
            } else {
                likePlaceholderLabel.text = ""
        }

        //配列からラベルを表示
        titleLabel.text = todoArray[indexPath.row]
        
        //配列のデータを読み取って画像を表示をする
        if todoArray[indexPath.row] == "" {
            let backgroundImage = UIImage(named: imagesArray[1])
            backgroundImageView.image = backgroundImage
        }  else if onoffArray[indexPath.row] == true && 0 ... 14 ~= indexPath.row{
            //チェックボックスがtrueだったら画像を表示する(checkedピンク)
            let backgroundImage = UIImage(named: imagesArray[0])
            backgroundImageView.image = backgroundImage
        } else if onoffArray[indexPath.row] == true && 15 ... 28 ~= indexPath.row{
            //checked紫
            let backgroundImage = UIImage(named: imagesArray[9])
            backgroundImageView.image = backgroundImage
        } else if onoffArray[indexPath.row] == true && 29 ... 42 ~= indexPath.row{
            //checked青
            let backgroundImage = UIImage(named: imagesArray[10])
            backgroundImageView.image = backgroundImage
        } else if onoffArray[indexPath.row] == true && 43 ... 56 ~= indexPath.row{
            //checked水色
            let backgroundImage = UIImage(named: imagesArray[11])
            backgroundImageView.image = backgroundImage
        }  else if onoffArray[indexPath.row] == true && 57 ... 70 ~= indexPath.row{
            //checked緑
            let backgroundImage = UIImage(named: imagesArray[12])
            backgroundImageView.image = backgroundImage
        }  else if onoffArray[indexPath.row] == true && 71 ... 84 ~= indexPath.row{
            //checkedオレンジ
            let backgroundImage = UIImage(named: imagesArray[13])
            backgroundImageView.image = backgroundImage
        }  else if onoffArray[indexPath.row] == true && 85 ... 99 ~= indexPath.row{
            //checked赤
            let backgroundImage = UIImage(named: imagesArray[14])
            backgroundImageView.image = backgroundImage
        } else if  0 ... 14 ~= indexPath.row{
            //enterピンク
            let backgroundImage = UIImage(named: imagesArray[2])
            backgroundImageView.image = backgroundImage
        } else if 15 ... 28 ~= indexPath.row{
            //enter紫
            let backgroundImage = UIImage(named: imagesArray[3])
            backgroundImageView.image = backgroundImage
        } else if 29 ... 42 ~= indexPath.row{
            //enter青
            let backgroundImage = UIImage(named: imagesArray[4])
            backgroundImageView.image = backgroundImage
        } else if 43 ... 56 ~= indexPath.row{
            //enter緑
            let backgroundImage = UIImage(named: imagesArray[5])
            backgroundImageView.image = backgroundImage
        } else if 57 ... 70 ~= indexPath.row{
            //enter緑
            let backgroundImage = UIImage(named: imagesArray[6])
            backgroundImageView.image = backgroundImage
        } else if 71 ... 84 ~= indexPath.row{
            //enterオレンジ
            let backgroundImage = UIImage(named: imagesArray[7])
            backgroundImageView.image = backgroundImage
        } else if 85 ... 99 ~= indexPath.row{
            //enter赤
            let backgroundImage = UIImage(named: imagesArray[8])
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



