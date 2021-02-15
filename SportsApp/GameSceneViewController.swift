//
//  GameSceneViewController.swift
//  SportsApp
//
//  Created by 三反陽介 on 2019/11/20.
//  Copyright © 2019 Sandan Yosuke. All rights reserved.
//

import UIKit

class GameSceneViewController: UIViewController {

    @IBOutlet weak var circle_1: UIButton!
    @IBOutlet weak var circle_2: UIButton!
    @IBOutlet weak var circle_3: UIButton!
    @IBOutlet weak var circle_4: UIButton!
    @IBOutlet weak var circle_5: UIButton!
    @IBOutlet weak var circle_6: UIButton!
    @IBOutlet weak var circle_7: UIButton!
    @IBOutlet weak var circle_8: UIButton!
    @IBOutlet weak var circle_9: UIButton!
    @IBOutlet weak var circle_10: UIButton!
    @IBOutlet weak var circle_11: UIButton!
    @IBOutlet weak var circle_12: UIButton!
    @IBOutlet weak var circle_1_outfield: UIButton!
    @IBOutlet weak var circle_2_outfield: UIButton!
    @IBOutlet weak var circle_3_outfield: UIButton!
    @IBOutlet weak var circle_4_outfield: UIButton!
    @IBOutlet weak var circle_5_outfield: UIButton!
    @IBOutlet weak var circle_6_outfield: UIButton!
    @IBOutlet weak var circle_7_outfield: UIButton!
    @IBOutlet weak var circle_8_outfield: UIButton!
    @IBOutlet weak var circle_9_outfield: UIButton!
    @IBOutlet weak var circle_10_outfield: UIButton!
    @IBOutlet weak var circle_11_outfield: UIButton!
    @IBOutlet weak var circle_12_outfield: UIButton!
    @IBOutlet weak var circle_1_fill: UIButton!
    @IBOutlet weak var circle_2_fill: UIButton!
    @IBOutlet weak var circle_3_fill: UIButton!
    @IBOutlet weak var circle_4_fill: UIButton!
    @IBOutlet weak var circle_5_fill: UIButton!
    @IBOutlet weak var circle_6_fill: UIButton!
    @IBOutlet weak var circle_7_fill: UIButton!
    @IBOutlet weak var circle_8_fill: UIButton!
    @IBOutlet weak var circle_9_fill: UIButton!
    @IBOutlet weak var circle_10_fill: UIButton!
    @IBOutlet weak var circle_11_fill: UIButton!
    @IBOutlet weak var circle_12_fill: UIButton!
    @IBOutlet weak var circle_1_fill_outfield: UIButton!
    @IBOutlet weak var circle_2_fill_outfield: UIButton!
    @IBOutlet weak var circle_3_fill_outfield: UIButton!
    @IBOutlet weak var circle_4_fill_outfield: UIButton!
    @IBOutlet weak var circle_5_fill_outfield: UIButton!
    @IBOutlet weak var circle_6_fill_outfield: UIButton!
    @IBOutlet weak var circle_7_fill_outfield: UIButton!
    @IBOutlet weak var circle_8_fill_outfield: UIButton!
    @IBOutlet weak var circle_9_fill_outfield: UIButton!
    @IBOutlet weak var circle_10_fill_outfield: UIButton!
    @IBOutlet weak var circle_11_fill_outfield: UIButton!
    @IBOutlet weak var circle_12_fill_outfield: UIButton!
    @IBOutlet weak var catchButton: UIButton!
    @IBOutlet weak var hitButton: UIButton!
    @IBOutlet weak var statusSwitch: UIButton!
    @IBOutlet weak var resultButton: UIButton!
    
    var myTeamNumberOfPeople = 12  // 自チームの人数
    var enemyTeamNumberOfPeople = 12  // 敵チームの人数
    var myTeamInfield = 9  // 自チームの内野の人数
    var myTeamOutfield = 12  // 自チームの外野の人数
    var enemyTeamInfield = 10  // 敵チームの内野の人数
    var enemyTeamOutfield = 12  // 敵チームの外野の人数
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let drawView = DrawView(frame: self.view.bounds)
        self.view.addSubview(drawView)
        // addsubBiewの重なり順を最背面に
        self.view.sendSubviewToBack(drawView)
        
        buttonIsEnabled(A: true, B: false, C: false)
        allCircleOutfieldIsHidden(hidden: true)
        circleIsHidden(number: myTeamInfield)
        circleFillIsHidden(number: enemyTeamInfield)
        circleOutfieldIsHidden(number: myTeamNumberOfPeople)
        circleFillOutfieldIsHidden(number: enemyTeamNumberOfPeople)
        
        resultButton.isHidden = true
    }

    // 画面を自動で回転させるか
    override var shouldAutorotate: Bool {
        get {
            return false
        }
    }
    
    // 画面の向きを指定
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .landscapeRight
        }
    }
    
    var array: [[[Int]]] = [[[],[],[]]]
    var a = 0
    var switchFlag = false
    
    @IBAction func circle_1_tapped(_ sender: Any) {
        circleTappedFunc(number: 1)
    }
    @IBAction func circle_2_tapped(_ sender: Any) {
        circleTappedFunc(number: 2)
    }
    @IBAction func circle_3_tapped(_ sender: Any) {
        circleTappedFunc(number: 3)
    }
    @IBAction func circle_4_tapped(_ sender: Any) {
        circleTappedFunc(number: 4)
    }
    @IBAction func circle_5_tapped(_ sender: Any) {
        circleTappedFunc(number: 5)
    }
    @IBAction func circle_6_tapped(_ sender: Any) {
        circleTappedFunc(number: 6)
    }
    @IBAction func circle_7_tapped(_ sender: Any) {
        circleTappedFunc(number: 7)
    }
    @IBAction func circle_8_tapped(_ sender: Any) {
        circleTappedFunc(number: 8)
    }
    @IBAction func circle_9_tapped(_ sender: Any) {
        circleTappedFunc(number: 9)
    }
    @IBAction func circle_10_tapped(_ sender: Any) {
        circleTappedFunc(number: 10)
    }
    @IBAction func circle_11_tapped(_ sender: Any) {
        circleTappedFunc(number: 11)
    }
    @IBAction func circle_12_tapped(_ sender: Any) {
        circleTappedFunc(number: 12)
    }
    
    @IBAction func circle_1_outfield_tapped(_ sender: Any) {
        circleTappedFunc(number: 1)
        outfield = true
       }
    @IBAction func circle_2_outfield_tapped(_ sender: Any) {
        circleTappedFunc(number: 2)
        outfield = true
    }
    @IBAction func circle_3_outfield_tapped(_ sender: Any) {
        circleTappedFunc(number: 3)
        outfield = true
    }
    @IBAction func circle_4_outfield_tapped(_ sender: Any) {
        circleTappedFunc(number: 4)
        outfield = true
    }
    @IBAction func circle_5_outfield_tapped(_ sender: Any) {
        circleTappedFunc(number: 5)
        outfield = true
    }
    @IBAction func circle_6_outfield_tapped(_ sender: Any) {
        circleTappedFunc(number: 6)
        outfield = true
    }
    @IBAction func circle_7_outfield_tapped(_ sender: Any) {
        circleTappedFunc(number: 7)
        outfield = true
    }
    @IBAction func circle_8_outfield_tapped(_ sender: Any) {
        circleTappedFunc(number: 8)
        outfield = true
    }
    @IBAction func circle_9_outfield_tapped(_ sender: Any) {
        circleTappedFunc(number: 9)
        outfield = true
    }
    @IBAction func circle_10_outfield_tapped(_ sender: Any) {
        circleTappedFunc(number: 10)
        outfield = true
    }
    @IBAction func circle_11_outfield_tapped(_ sender: Any) {
        circleTappedFunc(number: 11)
        outfield = true
    }
    @IBAction func circle_12_outfield_tapped(_ sender: Any) {
        circleTappedFunc(number: 12)
        outfield = true
    }

    @IBAction func circle_1_fill_tapped(_ sender: Any) {
        circleFillTappedFunc(number: 1)
    }
    @IBAction func circle_2_fill_tapped(_ sender: Any) {
        circleFillTappedFunc(number: 2)
    }
    @IBAction func circle_3_fill_tapped(_ sender: Any) {
        circleFillTappedFunc(number: 3)
    }
    @IBAction func circle_4_fill_tapped(_ sender: Any) {
        circleFillTappedFunc(number: 4)
    }
    @IBAction func circle_5_fill_tapped(_ sender: Any) {
        circleFillTappedFunc(number: 5)
    }
    @IBAction func circle_6_fill_tapped(_ sender: Any) {
        circleFillTappedFunc(number: 6)
    }
    @IBAction func circle_7_fill_tapped(_ sender: Any) {
        circleFillTappedFunc(number: 7)
    }
    @IBAction func circle_8_fill_tapped(_ sender: Any) {
        circleFillTappedFunc(number: 8)
    }
    @IBAction func circle_9_fill_tapped(_ sender: Any) {
        circleFillTappedFunc(number: 9)
    }
    @IBAction func circle_10_fill_tapped(_ sender: Any) {
        circleFillTappedFunc(number: 10)
    }
    @IBAction func circle_11_fill_tapped(_ sender: Any) {
        circleFillTappedFunc(number: 11)
    }
    @IBAction func circle_12_fill_tapped(_ sender: Any) {
        circleFillTappedFunc(number: 12)
    }
    
    @IBAction func circle_1_fill_outfield_tapped(_ sender: Any) {
        circleFillTappedFunc(number: 1)
        outfield = true
       }
    @IBAction func circle_2_fill_outfield_tapped(_ sender: Any) {
        circleFillTappedFunc(number: 2)
        outfield = true
    }
    @IBAction func circle_3_fill_outfield_tapped(_ sender: Any) {
        circleFillTappedFunc(number: 3)
        outfield = true
    }
    @IBAction func circle_4_fill_outfield_tapped(_ sender: Any) {
        circleFillTappedFunc(number: 4)
        outfield = true
    }
    @IBAction func circle_5_fill_outfield_tapped(_ sender: Any) {
        circleFillTappedFunc(number: 5)
        outfield = true
    }
    @IBAction func circle_6_fill_outfield_tapped(_ sender: Any) {
        circleFillTappedFunc(number: 6)
        outfield = true
    }
    @IBAction func circle_7_fill_outfield_tapped(_ sender: Any) {
        circleFillTappedFunc(number: 7)
        outfield = true
    }
    @IBAction func circle_8_fill_outfield_tapped(_ sender: Any) {
        circleFillTappedFunc(number: 8)
        outfield = true
    }
    @IBAction func circle_9_fill_outfield_tapped(_ sender: Any) {
        circleFillTappedFunc(number: 9)
        outfield = true
    }
    @IBAction func circle_10_fill_outfield_tapped(_ sender: Any) {
        circleFillTappedFunc(number: 10)
        outfield = true
    }
    @IBAction func circle_11_fill_outfield_tapped(_ sender: Any) {
        circleFillTappedFunc(number: 11)
        outfield = true
    }
    @IBAction func circle_12_fill_outfield_tapped(_ sender: Any) {
        circleFillTappedFunc(number: 12)
        outfield = true
    }
    
    @IBAction func catched(_ sender: Any) {
        array[a][2].append(0)
        if switchFlag == true {
          buttonIsEnabled(A: true, B: false, C: false)
          switchFlag = false
        } else {
          buttonIsEnabled(A: false, B: true, C: false)
          switchFlag = true
        }
        a += 1
        print(array)
        array.append([[],[],[]])
        
        statusSwitch.isEnabled = true
        
    }
    
    var outfield = false
    
    @IBAction func hit(_ sender: Any) {
        array[a][2].append(1)
        if switchFlag == false {
            buttonIsEnabled(A: false, B: true, C: false)
            switchFlag = true
            if outfield == false {
                circleFillHitHidden(number: array[a][1][0])
                enemyTeamInfield -= 1
            } else {
                circleFillOutfieldHitHidden(number1: array[a][0][0], number2: array[a][1][0])
                outfield = false
                enemyTeamInfield -= 1
                myTeamInfield += 1
            }
        } else {
            buttonIsEnabled(A: true, B: false, C: false)
            switchFlag = false
            if outfield == false {
                circleHitHidden(number: abs(array[a][0][0]))
                myTeamInfield -= 1
            } else {
                circleOutfieldHitHidden(number1: abs(array[a][0][0]), number2: abs(array[a][1][0]))
                outfield = false
                myTeamInfield -= 1
                enemyTeamInfield += 1
            }
        }
        a += 1
        print(array)
        array.append([[],[],[]])
        
        statusSwitch.isEnabled = true
        
        if myTeamInfield == 0 || enemyTeamInfield == 0 {
            resultButton.isHidden = false
        }
        print("myTeamInfield:" + String(myTeamInfield))
        print("enemyTeamInfield:" + String(enemyTeamInfield))
    }
    
    func buttonIsEnabled(A: Bool, B: Bool, C: Bool) {
        circle_1.isEnabled = A
        circle_2.isEnabled = A
        circle_3.isEnabled = A
        circle_4.isEnabled = A
        circle_5.isEnabled = A
        circle_6.isEnabled = A
        circle_7.isEnabled = A
        circle_8.isEnabled = A
        circle_9.isEnabled = A
        circle_10.isEnabled = A
        circle_11.isEnabled = A
        circle_12.isEnabled = A
        circle_1_outfield.isEnabled = A
        circle_2_outfield.isEnabled = A
        circle_3_outfield.isEnabled = A
        circle_4_outfield.isEnabled = A
        circle_5_outfield.isEnabled = A
        circle_6_outfield.isEnabled = A
        circle_7_outfield.isEnabled = A
        circle_8_outfield.isEnabled = A
        circle_9_outfield.isEnabled = A
        circle_10_outfield.isEnabled = A
        circle_11_outfield.isEnabled = A
        circle_12_outfield.isEnabled = A
        
        circle_1_fill.isEnabled = B
        circle_2_fill.isEnabled = B
        circle_3_fill.isEnabled = B
        circle_4_fill.isEnabled = B
        circle_5_fill.isEnabled = B
        circle_6_fill.isEnabled = B
        circle_7_fill.isEnabled = B
        circle_8_fill.isEnabled = B
        circle_9_fill.isEnabled = B
        circle_10_fill.isEnabled = B
        circle_11_fill.isEnabled = B
        circle_12_fill.isEnabled = B
        circle_1_fill_outfield.isEnabled = B
        circle_2_fill_outfield.isEnabled = B
        circle_3_fill_outfield.isEnabled = B
        circle_4_fill_outfield.isEnabled = B
        circle_5_fill_outfield.isEnabled = B
        circle_6_fill_outfield.isEnabled = B
        circle_7_fill_outfield.isEnabled = B
        circle_8_fill_outfield.isEnabled = B
        circle_9_fill_outfield.isEnabled = B
        circle_10_fill_outfield.isEnabled = B
        circle_11_fill_outfield.isEnabled = B
        circle_12_fill_outfield.isEnabled = B
        
        catchButton.isEnabled = C
        hitButton.isEnabled = C
    }
    
    func circleTappedFunc(number: Int) {
        if switchFlag == true {
            array[a][0].append(-number)
            buttonIsEnabled(A: false, B: false, C: true)
        } else {
            array[a][0].append(number)
            buttonIsEnabled(A: false, B: true, C: false)
            statusSwitch.isEnabled = false
        }
    }
    
    func circleFillTappedFunc(number: Int) {
        if switchFlag == true {
            array[a][1].append(-number)
            buttonIsEnabled(A: true, B: false, C: false)
            statusSwitch.isEnabled  = false
        } else {
            array[a][1].append(number)
            buttonIsEnabled(A: false, B: false, C: true)
        }
    }
    
    func allCircleOutfieldIsHidden(hidden: Bool) {
        circle_1_outfield.isHidden = hidden
        circle_2_outfield.isHidden = hidden
        circle_3_outfield.isHidden = hidden
        circle_4_outfield.isHidden = hidden
        circle_5_outfield.isHidden = hidden
        circle_6_outfield.isHidden = hidden
        circle_7_outfield.isHidden = hidden
        circle_8_outfield.isHidden = hidden
        circle_9_outfield.isHidden = hidden
        circle_10_outfield.isHidden = hidden
        circle_11_outfield.isHidden = hidden
        circle_12_outfield.isHidden = hidden
        
        circle_1_fill_outfield.isHidden = hidden
        circle_2_fill_outfield.isHidden = hidden
        circle_3_fill_outfield.isHidden = hidden
        circle_4_fill_outfield.isHidden = hidden
        circle_5_fill_outfield.isHidden = hidden
        circle_6_fill_outfield.isHidden = hidden
        circle_7_fill_outfield.isHidden = hidden
        circle_8_fill_outfield.isHidden = hidden
        circle_9_fill_outfield.isHidden = hidden
        circle_10_fill_outfield.isHidden = hidden
        circle_11_fill_outfield.isHidden = hidden
        circle_12_fill_outfield.isHidden = hidden
    }
    
    func circleIsHidden(number: Int) {
        if number < 12 {
            circle_12.isHidden = true
            circle_12_outfield.isHidden = false
        }
        if number < 11 {
            circle_11.isHidden = true
            circle_11_outfield.isHidden = false
        }
        if number < 10 {
            circle_10.isHidden = true
            circle_10_outfield.isHidden = false
        }
        if number < 9 {
            circle_9.isHidden = true
            circle_9_outfield.isHidden = false
        }
        if number < 8 {
            circle_8.isHidden = true
            circle_8_outfield.isHidden = false
        }
        if number < 7 {
            circle_7.isHidden = true
            circle_7_outfield.isHidden = false
        }
        if number < 6 {
            circle_6.isHidden = true
            circle_6_outfield.isHidden = false
        }
        if number < 5 {
            circle_5.isHidden = true
            circle_5_outfield.isHidden = false
        }
        if number < 4 {
            circle_4.isHidden = true
            circle_4_outfield.isHidden = false
        }
        if number < 3 {
            circle_3.isHidden = true
            circle_3_outfield.isHidden = false
        }
        if number < 2 {
            circle_2.isHidden = true
            circle_2_outfield.isHidden = false
        }
    }
    
    func circleFillIsHidden(number: Int) {
        if number < 12 {
            circle_12_fill.isHidden = true
            circle_12_fill_outfield.isHidden = false
        }
        if number < 11 {
            circle_11_fill.isHidden = true
            circle_11_fill_outfield.isHidden = false
        }
        if number < 10 {
            circle_10_fill.isHidden = true
            circle_10_fill_outfield.isHidden = false
        }
        if number < 9 {
            circle_9_fill.isHidden = true
            circle_9_fill_outfield.isHidden = false
        }
        if number < 8 {
            circle_8_fill.isHidden = true
            circle_8_fill_outfield.isHidden = false
        }
        if number < 7 {
            circle_7_fill.isHidden = true
            circle_7_fill_outfield.isHidden = false
        }
        if number < 6 {
            circle_6_fill.isHidden = true
            circle_6_fill_outfield.isHidden = false
        }
        if number < 5 {
            circle_5_fill.isHidden = true
            circle_5_fill_outfield.isHidden = false
        }
        if number < 4 {
            circle_4_fill.isHidden = true
            circle_4_fill_outfield.isHidden = false
        }
        if number < 3 {
            circle_3_fill.isHidden = true
            circle_3_fill_outfield.isHidden = false
        }
        if number < 2 {
            circle_2_fill.isHidden = true
            circle_2_fill_outfield.isHidden = false
        }
    }
    
    func circleHitHidden(number: Int) {
        switch number {
        case 1:
            circle_1.isHidden = true
            circle_1_outfield.isHidden = false
        case 2:
            circle_2.isHidden = true
            circle_2_outfield.isHidden = false
        case 3:
            circle_3.isHidden = true
            circle_3_outfield.isHidden = false
        case 4:
            circle_4.isHidden = true
            circle_4_outfield.isHidden = false
        case 5:
            circle_5.isHidden = true
            circle_5_outfield.isHidden = false
        case 6:
            circle_6.isHidden = true
            circle_6_outfield.isHidden = false
        case 7:
            circle_7.isHidden = true
            circle_7_outfield.isHidden = false
        case 8:
            circle_8.isHidden = true
            circle_8_outfield.isHidden = false
        case 9:
            circle_9.isHidden = true
            circle_9_outfield.isHidden = false
        case 10:
            circle_10.isHidden = true
            circle_10_outfield.isHidden = false
        case 11:
            circle_11.isHidden = true
            circle_11_outfield.isHidden = false
        case 12:
            circle_12.isHidden = true
            circle_12_outfield.isHidden = false
        default:
            break
        }
    }
    
    func circleOutfieldHitHidden(number1: Int, number2: Int) {
        let flag: Bool = true
        switch number1 {
        case 1:
            circle_1.isHidden = flag
            circle_1_outfield.isHidden = !flag
        case 2:
            circle_2.isHidden = flag
            circle_2_outfield.isHidden = !flag
        case 3:
            circle_3.isHidden = flag
            circle_3_outfield.isHidden = !flag
        case 4:
            circle_4.isHidden = flag
            circle_4_outfield.isHidden = !flag
        case 5:
            circle_5.isHidden = flag
            circle_5_outfield.isHidden = !flag
        case 6:
            circle_6.isHidden = flag
            circle_6_outfield.isHidden = !flag
        case 7:
            circle_7.isHidden = flag
            circle_7_outfield.isHidden = !flag
        case 8:
            circle_8.isHidden = flag
            circle_8_outfield.isHidden = !flag
        case 9:
            circle_9.isHidden = flag
            circle_9_outfield.isHidden = !flag
        case 10:
            circle_10.isHidden = flag
            circle_10_outfield.isHidden = !flag
        case 11:
            circle_11.isHidden = flag
            circle_11_outfield.isHidden = !flag
        case 12:
            circle_12.isHidden = flag
            circle_12_outfield.isHidden = !flag
        default:
            break
        }
        switch number2 {
        case 1:
            circle_1_fill.isHidden = !flag
            circle_1_fill_outfield.isHidden = flag
        case 2:
            circle_2_fill.isHidden = !flag
            circle_2_fill_outfield.isHidden = flag
        case 3:
            circle_3_fill.isHidden = !flag
            circle_3_fill_outfield.isHidden = flag
        case 4:
            circle_4_fill.isHidden = !flag
            circle_4_fill_outfield.isHidden = flag
        case 5:
            circle_5_fill.isHidden = !flag
            circle_5_fill_outfield.isHidden = flag
        case 6:
            circle_6_fill.isHidden = !flag
            circle_6_fill_outfield.isHidden = flag
        case 7:
            circle_7_fill.isHidden = !flag
            circle_7_fill_outfield.isHidden = flag
        case 8:
            circle_8_fill.isHidden = !flag
            circle_8_fill_outfield.isHidden = flag
        case 9:
            circle_9_fill.isHidden = !flag
            circle_9_fill_outfield.isHidden = flag
        case 10:
            circle_10_fill.isHidden = !flag
            circle_10_fill_outfield.isHidden = flag
        case 11:
            circle_11_fill.isHidden = !flag
            circle_11_fill_outfield.isHidden = flag
        case 12:
            circle_12_fill.isHidden = !flag
            circle_12_fill_outfield.isHidden = flag
        default:
            break
        }
    }
    
    func circleFillHitHidden(number: Int) {
        switch number {
        case 1:
            circle_1_fill.isHidden = true
            circle_1_fill_outfield.isHidden = false
        case 2:
            circle_2_fill.isHidden = true
            circle_2_fill_outfield.isHidden = false
        case 3:
            circle_3_fill.isHidden = true
            circle_3_fill_outfield.isHidden = false
        case 4:
            circle_4_fill.isHidden = true
            circle_4_fill_outfield.isHidden = false
        case 5:
            circle_5_fill.isHidden = true
            circle_5_fill_outfield.isHidden = false
        case 6:
            circle_6_fill.isHidden = true
            circle_6_fill_outfield.isHidden = false
        case 7:
            circle_7_fill.isHidden = true
            circle_7_fill_outfield.isHidden = false
        case 8:
            circle_8_fill.isHidden = true
            circle_8_fill_outfield.isHidden = false
        case 9:
            circle_9_fill.isHidden = true
            circle_9_fill_outfield.isHidden = false
        case 10:
            circle_10_fill.isHidden = true
            circle_10_fill_outfield.isHidden = false
        case 11:
            circle_11_fill.isHidden = true
            circle_11_fill_outfield.isHidden = false
        case 12:
            circle_12_fill.isHidden = true
            circle_12_fill_outfield.isHidden = false
        default:
            break
        }
    }
    
    func circleFillOutfieldHitHidden(number1: Int, number2: Int) {
           let flag: Bool = true
           switch number1 {
           case 1:
               circle_1.isHidden = !flag
               circle_1_outfield.isHidden = flag
           case 2:
               circle_2.isHidden = !flag
               circle_2_outfield.isHidden = flag
           case 3:
               circle_3.isHidden = !flag
               circle_3_outfield.isHidden = flag
           case 4:
               circle_4.isHidden = !flag
               circle_4_outfield.isHidden = flag
           case 5:
               circle_5.isHidden = !flag
               circle_5_outfield.isHidden = flag
           case 6:
               circle_6.isHidden = !flag
               circle_6_outfield.isHidden = flag
           case 7:
               circle_7.isHidden = !flag
               circle_7_outfield.isHidden = flag
           case 8:
               circle_8.isHidden = !flag
               circle_8_outfield.isHidden = flag
           case 9:
               circle_9.isHidden = !flag
               circle_9_outfield.isHidden = flag
           case 10:
               circle_10.isHidden = !flag
               circle_10_outfield.isHidden = flag
           case 11:
               circle_11.isHidden = !flag
               circle_11_outfield.isHidden = flag
           case 12:
               circle_12.isHidden = !flag
               circle_12_outfield.isHidden = flag
           default:
               break
           }
           switch number2 {
           case 1:
               circle_1_fill.isHidden = flag
               circle_1_fill_outfield.isHidden = !flag
           case 2:
               circle_2_fill.isHidden = flag
               circle_2_fill_outfield.isHidden = !flag
           case 3:
               circle_3_fill.isHidden = flag
               circle_3_fill_outfield.isHidden = !flag
           case 4:
               circle_4_fill.isHidden = flag
               circle_4_fill_outfield.isHidden = !flag
           case 5:
               circle_5_fill.isHidden = flag
               circle_5_fill_outfield.isHidden = !flag
           case 6:
               circle_6_fill.isHidden = flag
               circle_6_fill_outfield.isHidden = !flag
           case 7:
               circle_7_fill.isHidden = flag
               circle_7_fill_outfield.isHidden = !flag
           case 8:
               circle_8_fill.isHidden = flag
               circle_8_fill_outfield.isHidden = !flag
           case 9:
               circle_9_fill.isHidden = flag
               circle_9_fill_outfield.isHidden = !flag
           case 10:
               circle_10_fill.isHidden = flag
               circle_10_fill_outfield.isHidden = !flag
           case 11:
               circle_11_fill.isHidden = flag
               circle_11_fill_outfield.isHidden = !flag
           case 12:
               circle_12_fill.isHidden = flag
               circle_12_fill_outfield.isHidden = !flag
           default:
               break
           }
       }
       
    func circleOutfieldIsHidden(number: Int) {
        if number < 12 {
            circle_12_outfield.isHidden = true
        }
        if number < 11 {
            circle_11_outfield.isHidden = true
        }
        if number < 10 {
            circle_10_outfield.isHidden = true
        }
        if number < 9 {
            circle_9_outfield.isHidden = true
        }
        if number < 8 {
            circle_8_outfield.isHidden = true
        }
        if number < 7 {
            circle_7_outfield.isHidden = true
        }
        if number < 6 {
            circle_6_outfield.isHidden = true
        }
        if number < 5 {
            circle_5_outfield.isHidden = true
        }
        if number < 4 {
            circle_4_outfield.isHidden = true
        }
        if number < 3 {
            circle_3_outfield.isHidden = true
        }
    }
    
    func circleFillOutfieldIsHidden(number: Int) {
        if number < 12 {
            circle_12_fill_outfield.isHidden = true
        }
        if number < 11 {
            circle_11_fill_outfield.isHidden = true
        }
        if number < 10 {
            circle_10_fill_outfield.isHidden = true
        }
        if number < 9 {
            circle_9_fill_outfield.isHidden = true
        }
        if number < 8 {
            circle_8_fill_outfield.isHidden = true
        }
        if number < 7 {
            circle_7_fill_outfield.isHidden = true
        }
        if number < 6 {
            circle_6_fill_outfield.isHidden = true
        }
        if number < 5 {
            circle_5_fill_outfield.isHidden = true
        }
        if number < 4 {
            circle_4_fill_outfield.isHidden = true
        }
        if number < 3 {
            circle_3_fill_outfield.isHidden = true
        }
    }
    
    @IBAction func sportsCourtTapped(_ sender: Any) {
        performSegue(withIdentifier: "toTableView", sender: nil)
    }
    
    @IBAction func statusSwitch(_ sender: Any) {
        if switchFlag == false{
            switchFlag = true
            buttonIsEnabled(A: false, B: true, C: false)
        } else {
            switchFlag = false
            buttonIsEnabled(A: true, B: false, C: false)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTableView" {
            let tableView = segue.destination as! GameTableViewController
            tableView.array = array
        } else if segue.identifier == "toResultViewController" {
            let nextVC = segue.destination as! ResultViewController
            nextVC.myTeamResult = myTeamInfield
            nextVC.enemyTeamResult = enemyTeamInfield
            nextVC.resultDataArray = array
        }
    }
    
    @IBAction func resultButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "toResultViewController", sender: nil)
    }
}
