//
//  ResultViewController.swift
//  SportsApp
//
//  Created by 三反陽介 on 2020/01/10.
//  Copyright © 2020 Sandan Yosuke. All rights reserved.
//

import UIKit
import Charts
import RealmSwift

class ResultViewController: UIViewController {
    
    var myTeamResult: Int = 0
    var enemyTeamResult: Int = 0
    var resultDataArray: [[[Int]]] = [[[],[],[]]]
    var pointArray_A: [Int] = []
    var pointArray_B: [Int] = []
    var segueFlag = false
    var selectedTime = ""

    @IBOutlet weak var resultText: UILabel!
    @IBOutlet weak var pieChartsView_A: PieChartView!
    @IBOutlet weak var pieChartsView_B: PieChartView!
    
    
    var GameInfomationList: Results<GameInfomation>!
    
    func addGameInfomationItem(ATeamP: Int, BTeamP: Int, ATeamPA: [Int], BTeamPA: [Int], time: String) {
        //let InstancedGameInfomationList: GameInfomation = GameInfomation()
        
        //InstancedGameInfomationList.ATeamPoint = ATeamP
        //InstancedGameInfomationList.BTeamPoint = BTeamP
        //InstancedGameInfomationList.nowTime = time
    
        //var dictionary: [String: Any] = ["ATeamDataList": [], "BTeamDataList": []]
        var dictionary: [String: Any] = ["ATeamPoint": ATeamP, "BTeamPoint": BTeamP, "nowTime": time, "ATeamDataList": [], "BTeamDataList": []]
        
        //let listA = ATeamPAClass()
            //listA.ATeamPA = n
            //print(listA.ATeamPA)
            //let PAList = List([ATeamPAClass(ATeamPA: n)])
            //InstancedGameInfomationList.ATeamDataList.append(listA)
        dictionary["ATeamDataList"] = [["ATeamPA": ATeamPA[0]],["ATeamPA": ATeamPA[1]],["ATeamPA": ATeamPA[2]],["ATeamPA": ATeamPA[3]],["ATeamPA": ATeamPA[4]],["ATeamPA": ATeamPA[5]],["ATeamPA": ATeamPA[6]],["ATeamPA": ATeamPA[7]],["ATeamPA": ATeamPA[8]],["ATeamPA": ATeamPA[9]],["ATeamPA": ATeamPA[10]],["ATeamPA": ATeamPA[10]],]
        
        //let listB = BTeamPAClass()
        //for n in BTeamPA {
            //listB.BTeamPA = n
            //InstancedGameInfomationList.BTeamDataList.append(listB)
            //dictionary["BTeamDataList"] = ["BTeamPA": n]
        //}
        //InstancedGameInfomationList.ATeamDataList.append(listA)
        //InstancedGameInfomationList.BTeamDataList.append(listB)
        dictionary["BTeamDataList"] = [["BTeamPA": BTeamPA[0]],["BTeamPA": BTeamPA[1]],["BTeamPA": BTeamPA[2]],["BTeamPA": BTeamPA[3]],["BTeamPA": BTeamPA[4]],["BTeamPA": BTeamPA[5]],["BTeamPA": BTeamPA[6]],["BTeamPA": BTeamPA[7]],["BTeamPA": BTeamPA[8]],["BTeamPA": BTeamPA[9]],["BTeamPA": BTeamPA[10]],["BTeamPA": BTeamPA[10]],]
    
        let realm2 = try! Realm()
        //let list = GameInfomation(value: dictionary)
        let InstancedGameInfomationList: GameInfomation = GameInfomation(value: dictionary)
        
        // print(listA.ATeamPA)
        
        try! realm2.write {
            realm2.add(InstancedGameInfomationList)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        if segueFlag == false {
            resultDataArray.removeLast()
            pointArray_A = [Int](repeating: 0, count: 12)
            pointArray_B = [Int](repeating: 0, count: 12)
            for count in resultDataArray {
                if count[2][0] == 1 {
                    if count[0][0] > 0 {
                        pointArray_A[count[0][0] - 1] += 1
                    } else {
                        pointArray_B[abs(count[1][0]) - 1] += 1
                    }
                }
            }
        } else {
            let realm = try! Realm()
            let obj = realm.objects(GameInfomation.self).filter("nowTime == %@", selectedTime)
            for objData in obj {
                for n in objData["ATeamDataList"] as! List<ATeamPAClass>{
                    pointArray_A.append(n.ATeamPA)
                }
                for n in objData["BTeamDataList"] as! List<BTeamPAClass>{
                    pointArray_B.append(n.BTeamPA)
                }
                myTeamResult = objData.ATeamPoint
                enemyTeamResult = objData.BTeamPoint
            }
        }

        resultText.text = String(myTeamResult) + "       vs       " + String(enemyTeamResult)
         
        
        // 円グラフの中心に表示するタイトル
        self.pieChartsView_A.centerText = "Aチームの個人得点率"
        self.pieChartsView_B.centerText = "Bチームの個人得点率"
        
        // グラフに表示するデータのタイトルと値
        var dataEntries_A = [
            PieChartDataEntry(value: Double(pointArray_A[0]), label: "1"),
            PieChartDataEntry(value: Double(pointArray_A[1]), label: "2"),
            PieChartDataEntry(value: Double(pointArray_A[2]), label: "3"),
            PieChartDataEntry(value: Double(pointArray_A[3]), label: "4"),
            PieChartDataEntry(value: Double(pointArray_A[4]), label: "5"),
            PieChartDataEntry(value: Double(pointArray_A[5]), label: "6"),
            PieChartDataEntry(value: Double(pointArray_A[6]), label: "7"),
            PieChartDataEntry(value: Double(pointArray_A[7]), label: "8"),
            PieChartDataEntry(value: Double(pointArray_A[8]), label: "9"),
            PieChartDataEntry(value: Double(pointArray_A[9]), label: "10"),
            PieChartDataEntry(value: Double(pointArray_A[10]), label: "11"),
            PieChartDataEntry(value: Double(pointArray_A[11]), label: "12")
        ]
        var arrayCount_A = 0
        for count in dataEntries_A {
            if count.value == 0 {
                dataEntries_A.remove(at: arrayCount_A)
                arrayCount_A -= 1
            }
            arrayCount_A += 1
        }
        
        var dataEntries_B = [
            PieChartDataEntry(value: Double(pointArray_B[0]), label: "1"),
            PieChartDataEntry(value: Double(pointArray_B[1]), label: "2"),
            PieChartDataEntry(value: Double(pointArray_B[2]), label: "3"),
            PieChartDataEntry(value: Double(pointArray_B[3]), label: "4"),
            PieChartDataEntry(value: Double(pointArray_B[4]), label: "5"),
            PieChartDataEntry(value: Double(pointArray_B[5]), label: "6"),
            PieChartDataEntry(value: Double(pointArray_B[6]), label: "7"),
            PieChartDataEntry(value: Double(pointArray_B[7]), label: "8"),
            PieChartDataEntry(value: Double(pointArray_B[8]), label: "9"),
            PieChartDataEntry(value: Double(pointArray_B[9]), label: "10"),
            PieChartDataEntry(value: Double(pointArray_B[10]), label: "11"),
            PieChartDataEntry(value: Double(pointArray_B[11]), label: "12")
        ]
        var arrayCount_B = 0
        for count in dataEntries_B {
            if count.value == 0 {
                dataEntries_B.remove(at: arrayCount_B)
                arrayCount_B -= 1
            }
            arrayCount_B += 1
        }
        
        let dataSet_A = PieChartDataSet(entries: dataEntries_A, label: "Aチームの背番号")
        let dataSet_B = PieChartDataSet(entries: dataEntries_B, label: "Bチームの背番号")
        
        // グラフの色
        dataSet_A.colors = ChartColorTemplates.vordiplom()
        dataSet_B.colors = ChartColorTemplates.vordiplom()
        // グラフのデータの値と色
        dataSet_A.valueTextColor = UIColor.black
        dataSet_B.valueTextColor = UIColor.black
        // グラフのデータのタイトルの色
        dataSet_A.entryLabelColor = UIColor.black
        dataSet_B.entryLabelColor = UIColor.black
        
        self.pieChartsView_A.data = PieChartData(dataSet: dataSet_A)
        self.pieChartsView_B.data = PieChartData(dataSet: dataSet_B)
        
        // データを％表示にする
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 2
        formatter.multiplier = 1.0
        self.pieChartsView_A.data?.setValueFormatter(DefaultValueFormatter(formatter: formatter))
        self.pieChartsView_A.usePercentValuesEnabled = true
        self.pieChartsView_B.data?.setValueFormatter(DefaultValueFormatter(formatter: formatter))
        self.pieChartsView_B.usePercentValuesEnabled = true
        
        view.addSubview(self.pieChartsView_A)
        view.addSubview(self.pieChartsView_B)
        
        let realm = try! Realm()
        self.GameInfomationList = realm.objects(GameInfomation.self)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        // Realmにデータを保存
        if segueFlag == false {
            let dt = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yMMMdHms", options: 0, locale: Locale(identifier: "ja_JP"))
            
            addGameInfomationItem(ATeamP: myTeamResult, BTeamP: enemyTeamResult, ATeamPA: pointArray_A, BTeamPA: pointArray_B, time: dateFormatter.string(from: dt))
        }
        
        self.performSegue(withIdentifier: "toTitleViewController", sender: nil)
    }
    
}
