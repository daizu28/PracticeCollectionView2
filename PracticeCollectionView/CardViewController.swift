//
//  CardViewController.swift
//  PracticeCollectionView
//
//  Created by 小林玲衣奈 on 2020/10/02.
//  Copyright © 2020 小林玲衣奈. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    @IBOutlet var contentTextView: UITextView!
    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var checkedImageView: UIButton!
    
    //今まで書き込んでいたものを入れる
    var todoTextArray = [String]()
    
    //IndexPathの値
    var rowNumber: Int = 0
    
    //チェックボックスのオンオフ
    var checked: Bool = false
    
    //背景画像の配列
      var imagesArray = ["checkedTask", "emptyTask", "enterTask", "checkedTask2"]
    
    //チェックボタンの画像
    let checkIcon = UIImage(named: "checkIcon")
    let checkedIcon = UIImage(named: "checkedIcon")
    
    //ユーザーデフォルト使いますよ
    let saveData: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayContentTextView()
        
        checkImage()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
          super.viewDidAppear(animated)
        
        changeImages()
        
      }
    
        //内容があるかないかで背景の画像を変える
        func changeImages(){
            if contentTextView.text == "" {
                cardImageView.image = UIImage(named: imagesArray[1])
                checkedImageView.isEnabled = false
            } else {
                cardImageView.image = UIImage(named: imagesArray[2])
                checkedImageView.isEnabled = true
            }
              }
    
    
    //1個前でも戻れるのかな？戻るボタン
    @IBAction func back(){
        self.dismiss(animated: true, completion: nil)
        editContentTextView()
    }
    
    
    @IBAction func checkButton(_ sender: UIButton){
        
        if checked == false{
            checked = true
        } else if checked == true {
            checked = false
        }
        
        checkImage()
        
    }
    
    
    func checkImage(){
        if checked == false{
            //押してない時の
            checkedImageView.setBackgroundImage(checkIcon,for: .normal)
            cardImageView.image = UIImage(named: imagesArray[2])
        } else if checked == true{
            //押した時の
            checkedImageView.setBackgroundImage(checkedIcon,for: .normal)
            cardImageView.image = UIImage(named: imagesArray[3])
        }
    }
    
    //今までの書き込みを読み込んで自分の分を表示。
    func displayContentTextView(){
        
        if saveData.array(forKey: "text") != nil {
        todoTextArray = saveData.object(forKey: "text") as! [String]
            
        //配列から自分のものを取り出して表示
        contentTextView.text = todoTextArray[rowNumber]
        }
    }
    
    func editContentTextView(){
        
        //書き込んだものを配列に入れる
        todoTextArray.insert(contentTextView.text, at: rowNumber)
        
        //前の書き込みを消す
        todoTextArray.remove(at: rowNumber + 1)
        
        //保存
        saveData.set(todoTextArray, forKey: "text")
    }
    
    
    
    
    //キーボードをタッチで閉じれる？
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        //非表示にする。
//        if(contentTextView.isFirstResponder){
//            contentTextView.resignFirstResponder()
//        }
    
    
    //書き込みがあった時に背景を変える
    
    
    
    //書き込みがあった時にチェックボタンを表示する
    
    
    
    //チェックボタンを押したら背景が変わる
    
    
    
    //書き込んだ内容をメインストリーボードでもみれるようにする
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
