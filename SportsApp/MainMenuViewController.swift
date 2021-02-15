//
//  MainMenuViewController.swift
//  SportsApp
//
//  Created by 三反陽介 on 2020/01/09.
//  Copyright © 2020 Sandan Yosuke. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController, UIPickerViewDelegate ,UIPickerViewDataSource {

    @IBOutlet weak var myTeamPeoplePickerView: UIPickerView!
    @IBOutlet weak var enemyTeamPeoplePickerView: UIPickerView!
    @IBOutlet weak var myTeamInfieldPeoplePickerView: UIPickerView!
    @IBOutlet weak var enemyTeamInfieldPeoplePickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTeamPeoplePickerView.delegate = self
        myTeamPeoplePickerView.dataSource = self
        enemyTeamPeoplePickerView.delegate = self
        enemyTeamPeoplePickerView.dataSource = self
        myTeamInfieldPeoplePickerView.delegate = self
        myTeamInfieldPeoplePickerView.dataSource = self
        enemyTeamInfieldPeoplePickerView.delegate = self
        enemyTeamInfieldPeoplePickerView.dataSource = self
    }
    
    var dataArray: [Int] = ([Int])(1...12)
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 && pickerView.tag == 1 {
            return dataArray.count
        } else {
            return dataArray.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(dataArray[row])
    }
    
    var myTeamPeople: Int = 0
    var enemyTeamPeople: Int = 0
    var myTeamInfieldPeople: Int = 0
    var enemyTeamInfieldPeople: Int = 0
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            myTeamPeople = row + 1
        } else if pickerView.tag == 1 {
            enemyTeamPeople = row + 1
        } else if pickerView.tag == 2 {
            myTeamInfieldPeople = row + 1
        } else {
            enemyTeamInfieldPeople = row + 1
        }
    }
    
    var alertController: UIAlertController!
    
    func alert(title: String, message: String) {
        alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true)
    }
    
    @IBAction func startButtonTapped(_ sender: Any) {
        if myTeamPeople < myTeamInfieldPeople || enemyTeamPeople < enemyTeamInfieldPeople {
            alert(title: "エラー", message: "内野の人数をチームの人数より大きく設定することはできません")
        } else if myTeamPeople == myTeamInfieldPeople || enemyTeamPeople == enemyTeamInfieldPeople {
            alert(title: "エラー", message: "外野がいません")
        } else {
            self.performSegue(withIdentifier: "toGameSceneViewController", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGameSceneViewController" {
            let nextVC = segue.destination as! GameSceneViewController
            nextVC.myTeamNumberOfPeople = myTeamPeople
            nextVC.enemyTeamNumberOfPeople = enemyTeamPeople
            nextVC.myTeamInfield = myTeamInfieldPeople
            nextVC.enemyTeamInfield = enemyTeamInfieldPeople
            nextVC.myTeamOutfield = myTeamPeople - myTeamInfieldPeople
            nextVC.enemyTeamOutfield = enemyTeamPeople - enemyTeamInfieldPeople
        }
    }
}
