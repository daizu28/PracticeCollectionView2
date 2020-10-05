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
    @IBOutlet var cardImage: UIImage!
    
    //今まで書き込んでいたものを入れる
    var todoTextArray = [String]()
    
    //IndexPathの値
    var rowNumber: Int = 0
    
    //ユーザーデフォルト使いますよ
    let saveData: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayContentTextView()

        // Do any additional setup after loading the view.
    }
    
    
    //1個前でも戻れるのかな？戻るボタン
    @IBAction func back(){
        self.dismiss(animated: true, completion: nil)
        editContentTextView()
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
    
    
    
    
    
    //書き込みがあった時に背景を変える
    
    
    
    //書き込みがあった時にチェックボタンを表示する
    
    
    
    //チェックボタンを押したら背景が変わる
    
    
    
    //書き込んだ内容をメインストリーボードでもみれるようにする
    
    
    @IBAction func backButton(){
        
    }
    
    @IBAction func checkButton(){
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
