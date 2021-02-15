//
//  AddGameViewController.swift
//  SportsApp
//
//  Created by 三反陽介 on 2019/10/24.
//  Copyright © 2019 Sandan Yosuke. All rights reserved.
//

import UIKit
import RealmSwift

class AddGameViewController: UIViewController {
 
    var date: String!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var teamALabel: UITextField!
    @IBOutlet weak var teamBLabel: UITextField!
    @IBOutlet weak var teamAResult: UITextField!
    @IBOutlet weak var teamBResult: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        dateLabel.text = date
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UITextFieldのキーボードを数字入力だけにする
        self.teamAResult.keyboardType = UIKeyboardType.numberPad
        self.teamBResult.keyboardType = UIKeyboardType.numberPad
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        print("データ書き込み開始")
        
        // Realmデータベースを取得
        let realm = try! Realm()
        
        try! realm.write {
            let Events = [Event(value: ["date": dateLabel.text, "text": teamALabel.text! + "vs" + teamBLabel.text! + "  " + teamAResult.text! + "-" + teamBResult.text!])]
            realm.add(Events)
            print("データ書き込み中")
        }
        
        print("データ書き込み完了")
        
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }

}
