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
    var todoTextArray : [String] = ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
    
    //今までのチェックボックスの状態を入れる
    var onoffArray : [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    
    //IndexPathの値
    var rowNumber: Int = 0
    
    //チェックボックスのオンオフ
    var checked: Bool = false

    
    //背景画像の配列
      var imagesArray = ["checkedTask", "emptyTask", "enterTask", "checkedTask2", "enterTask_p", "enterTask_b", "enterTask_c", "enterTask_g", "enterTask_o", "enterTask_r", "checkedTask2_p",  "checkedTask2_b", "checkedTask2_c", "checkedTask2_g", "checkedTask2_o", "checkedTask2_r"]
    
    
    //チェックボタンの画像
    let checkIcon = UIImage(named: "checkIcon")
    let checkedIcon = UIImage(named: "checkedIcon")
    let checkedIcon_p = UIImage(named: "checkedIcon_p")
    let checkedIcon_b = UIImage(named: "checkedIcon_b")
    let checkedIcon_c = UIImage(named: "checkedIcon_c")
    let checkedIcon_g = UIImage(named: "checkedIcon_g")
    let checkedIcon_o = UIImage(named: "checkedIcon_o")
    let checkedIcon_r = UIImage(named: "checkedIcon_r")
    
    //ユーザーデフォルト使いますよ
    let saveData: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // //今までの書き込みを読み込んで自分の分を表示。
        displayContentTextView()
        //今までのチェックボックスの様子を読み込む
        displayChecked()

        print(todoTextArray.count)
        //なぜか配列が80個しかないと言われる
        print(onoffArray.count)

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
          super.viewDidAppear(animated)
        //内容があるかないかで背景の画像を変える
        changeImages(contentTextView)
      }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewDidAppear(animated)
        //内容があるかないかで背景の画像を変える
        changeImages(contentTextView)
        
      }
    
    
    //キーボード以外タップでキーボードしまう
    override func didReceiveMemoryWarning() {
         super.didReceiveMemoryWarning()
     }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        //内容があるかないかで背景の画像を変える
        changeImages(contentTextView)
    }
    
        //内容があるかないかで背景の画像を変える
        //チェックボックスを押したかどうかとチェックボックスの画像を変える
    func changeImages(_ contentTextView: UITextView){
            if contentTextView.text == "" {
                cardImageView.image = UIImage(named: imagesArray[1])
                checkedImageView.isEnabled = false
            } else if checked == true && 0 ... 14 ~= rowNumber{
                //押した時の(ピンク)
                checkedImageView.setBackgroundImage(checkedIcon,for: .normal)
                cardImageView.image = UIImage(named: imagesArray[3])
            }  else if checked == true && 15 ... 28 ~= rowNumber{
                //checkedTask2紫
                checkedImageView.setBackgroundImage(checkedIcon_p,for: .normal)
                cardImageView.image = UIImage(named: imagesArray[10])
            }  else if checked == true && 29 ... 42 ~= rowNumber{
                //checkedTask2青
                checkedImageView.setBackgroundImage(checkedIcon_b,for: .normal)
                cardImageView.image = UIImage(named: imagesArray[11])
            }  else if checked == true && 43 ... 56 ~= rowNumber{
                //checkedTask2水色
                checkedImageView.setBackgroundImage(checkedIcon_c,for: .normal)
                cardImageView.image = UIImage(named: imagesArray[12])
            } else if checked == true && 57 ... 70 ~= rowNumber{
                //checkedTask2緑
                checkedImageView.setBackgroundImage(checkedIcon_g,for: .normal)
                cardImageView.image = UIImage(named: imagesArray[13])
            } else if checked == true && 71 ... 84 ~= rowNumber{
                //checkedTask2オレンジ
                checkedImageView.setBackgroundImage(checkedIcon_o,for: .normal)
                cardImageView.image = UIImage(named: imagesArray[14])
            } else if checked == true && 85 ... 99 ~= rowNumber{
                //checkedTask2赤
                checkedImageView.setBackgroundImage(checkedIcon_r,for: .normal)
                cardImageView.image = UIImage(named: imagesArray[15])
            } else if contentTextView.text != "" && 0 ... 14 ~= rowNumber{
                //enterピンク
                cardImageView.image = UIImage(named: imagesArray[2])
                checkedImageView.isEnabled = true
                checkedImageView.setBackgroundImage(checkIcon,for: .normal)
            } else if contentTextView.text != "" &&  15 ... 28 ~= rowNumber{
                //enter紫
                cardImageView.image = UIImage(named: imagesArray[4])
                checkedImageView.isEnabled = true
                checkedImageView.setBackgroundImage(checkIcon,for: .normal)
            } else if contentTextView.text != "" &&  29 ... 42 ~= rowNumber{
                //enter青
                cardImageView.image = UIImage(named: imagesArray[5])
                checkedImageView.isEnabled = true
                checkedImageView.setBackgroundImage(checkIcon,for: .normal)
            } else if contentTextView.text != "" &&  43 ... 56 ~= rowNumber{
                //enter水色
                cardImageView.image = UIImage(named: imagesArray[6])
                checkedImageView.isEnabled = true
                checkedImageView.setBackgroundImage(checkIcon,for: .normal)
            } else if contentTextView.text != "" &&  57 ... 70 ~= rowNumber{
                //enter緑
                cardImageView.image = UIImage(named: imagesArray[7])
                checkedImageView.isEnabled = true
                checkedImageView.setBackgroundImage(checkIcon,for: .normal)
            } else if contentTextView.text != "" &&  71 ... 84 ~= rowNumber{
                //enterオレンジ
                cardImageView.image = UIImage(named: imagesArray[8])
                checkedImageView.isEnabled = true
                checkedImageView.setBackgroundImage(checkIcon,for: .normal)
            } else if contentTextView.text != "" &&  85 ... 99 ~= rowNumber{
                //enter赤
                cardImageView.image = UIImage(named: imagesArray[9])
                checkedImageView.isEnabled = true
                checkedImageView.setBackgroundImage(checkIcon,for: .normal)
                }
              }
    
    
    //戻るボタン
    @IBAction func back(){
        self.dismiss(animated: true, completion: nil)
        editContentTextView()
        editContentCheckButton()
    }
    
    //ボタンをオンオフできるようにする
    @IBAction func checkButton(_ sender: UIButton){
        
        if checked == false{
            checked = true
        } else if checked == true {
            checked = false
        }
        
        print(checked)
        changeImages(contentTextView)
        
    }
    

    
    //今までの書き込みを読み込んで自分の分を表示。
    func displayContentTextView(){
        
        if saveData.array(forKey: "text") != nil {
        todoTextArray = saveData.object(forKey: "text") as! [String]
            
        //配列から自分のものを取り出して表示
        contentTextView.text = todoTextArray[rowNumber]
        }
    }
    
    //今までのチェックボックスの内容を読み込んで表示
    func displayChecked(){
        
        if saveData.array(forKey: "check") != nil {
           onoffArray = saveData.object(forKey: "check") as! [Bool]
               
    //配列から自分のものを取り出して表示
           checked = onoffArray[rowNumber]
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
    
    func editContentCheckButton(){
        //true,falseの情報を配列に入れる
        onoffArray.insert(checked, at: rowNumber)
        
        //前の書き込みを消す
        onoffArray.remove(at: rowNumber + 1)
        
        //保存
        saveData.set(onoffArray, forKey: "check")
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
