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
    
    //書き込みがあったかどうかわかるようにできないかなと言う変数
    var writeDownNumber:[Int] = [0, 1, 2]
    
    //IndexPathの値
    var rowNumber: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //渡されたIndex.Pathの値を表示してみる
        contentTextView.text = String(rowNumber)

        // Do any additional setup after loading the view.
    }
    
    //戻れるのかな？戻るボタン
    @IBAction func back(){
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    //書き込みがあった時にwriteDownNumberを変更して書き込みがあった時に背景を変える
    
    
    
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
