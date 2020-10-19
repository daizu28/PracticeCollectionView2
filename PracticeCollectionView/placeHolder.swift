//
//  placeHolder.swift
//  PracticeCollectionView
//
//  Created by 小林玲衣奈 on 2020/10/19.
//  Copyright © 2020 小林玲衣奈. All rights reserved.
//

import UIKit

//プレースホルダー(正直わかってない) IBDesignableは見栄えを変更できるやつらしい
//IBDesignableとIBInspectable修飾子をつけることによってStoryboard上で見た目、カスタムの属性を変更できます。(すごない？) ストーリーボードでクラスにPlaceHOlderTextViewを割り当てて使うよ！

@IBDesignable class PlaceHolderTextView: UITextView {

    // MARK: Stored Instance Properties

    @IBInspectable private var placeHolder: String = "" {
        willSet {
            self.placeHolderLabel.text = newValue
            self.placeHolderLabel.sizeToFit()
        }
    }

    //ラベルの設定？
    private lazy var placeHolderLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 6.0, y: 6.0, width: 0.0, height: 0.0))
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = self.font
        label.textColor = UIColor(red: 0.0, green: 0.0, blue: 0.0980392, alpha: 0.3)
        label.backgroundColor = .clear
        self.addSubview(label)
        return label
    }()

    // MARK: Initializers

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: View Life-Cycle Methods

    override func awakeFromNib() {
        super.awakeFromNib()
        changeVisiblePlaceHolder()
        NotificationCenter.default.addObserver(self, selector: #selector(textChanged),
                                               name: UITextView.textDidChangeNotification, object: nil)
    }

    // MARK: Other Private Methods

    private func changeVisiblePlaceHolder() {
        self.placeHolderLabel.alpha = (self.placeHolder.isEmpty || !self.text.isEmpty) ? 0.0 : 1.0
    }

    @objc private func textChanged(notification: NSNotification?) {
        changeVisiblePlaceHolder()
    }

}
