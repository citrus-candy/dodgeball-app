//
//  ViewController.swift
//  SportsApp
//
//  Created by 三反陽介 on 2019/10/11.
//  Copyright © 2019 Sandan Yosuke. All rights reserved.
//

import UIKit
import FSCalendar
import CalculateCalendarLogic
import RealmSwift

class ViewController: UIViewController,FSCalendarDataSource,FSCalendarDelegate,FSCalendarDelegateAppearance,UITableViewDataSource {
    
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var calendarTabelView: UITableView!
    @IBOutlet weak var diaryTextLabel: UILabel!
    
    var itemList: Results<Event>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.calendarTabelView.dataSource = self
        
        // Realmのインスタンスを取得
        let realm = try! Realm()
        
        // Realmデータベースに登録されているデータを全て取得
        self.itemList = realm.objects(Event.self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    fileprivate let gregorian: Calendar = Calendar(identifier: .gregorian)
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()

    // 祝日判定を行い結果を返すメソッド(True:祝日)
    func judgeHoliday(_ date : Date) -> Bool {
        //祝日判定用のカレンダークラスのインスタンス
        let tmpCalendar = Calendar(identifier: .gregorian)

        // 祝日判定を行う日にちの年、月、日を取得
        let year = tmpCalendar.component(.year, from: date)
        let month = tmpCalendar.component(.month, from: date)
        let day = tmpCalendar.component(.day, from: date)

        // CalculateCalendarLogic()：祝日判定のインスタンスの生成
        let holiday = CalculateCalendarLogic()

        return holiday.judgeJapaneseHoliday(year: year, month: month, day: day)
    }
    
    // date型 -> 年月日をIntで取得
    func getDay(_ date:Date) -> (Int,Int,Int){
        let tmpCalendar = Calendar(identifier: .gregorian)
        let year = tmpCalendar.component(.year, from: date)
        let month = tmpCalendar.component(.month, from: date)
        let day = tmpCalendar.component(.day, from: date)
        return (year,month,day)
    }

    //曜日判定(日曜日:1 〜 土曜日:7)
    func getWeekIdx(_ date: Date) -> Int{
        let tmpCalendar = Calendar(identifier: .gregorian)
        return tmpCalendar.component(.weekday, from: date)
    }

    // 土日や祝日の日の文字色を変える
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        //祝日判定をする（祝日は赤色で表示する）
        if self.judgeHoliday(date){
            return UIColor.red
        }

        //土日の判定を行う（土曜日は青色、日曜日は赤色で表示する）
        let weekday = self.getWeekIdx(date)
        if weekday == 1 {   //日曜日
            return UIColor.red
        }
        else if weekday == 7 {  //土曜日
            return UIColor.blue
        }

        return nil
    }
    
    var year: Int = 0
    var month: Int = 0
    var day: Int = 0
    
    var date: String = ""
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition){
    
      //scheduleLabel.text = "スケジュールはありません"
      //scheduleLabel.textColor = .lightGray
      //view.addSubview(scheduleLabel)
    
      let tmpDate = Calendar(identifier: .gregorian)
      year.self = tmpDate.component(.year, from: date)
      month.self = tmpDate.component(.month, from: date)
      day.self = tmpDate.component(.day, from: date)
      let m = String(format: "%02d", month)
      let d = String(format: "%02d", day)
    
      let da = "\(year)/\(m)/\(d)"
      diaryTextLabel.text = da
      //クリックしたら、日付が表示される。
      //dateLabel.text = "\(m)/\(d)"
      view.addSubview(diaryTextLabel)
    
      //スケジュール取得
      let realm = try! Realm()
      var result = realm.objects(Event.self)
      result = result.filter("date = '\(da)'")
      print(result)
      for ev in result {
        if ev.date == da {
            //scheduleLabel.text = ev.event
            //scheduleLabel.textColor = .black
            //view.addSubview(scheduleLabel)
        }
      }
        
      self.calendarTabelView.reloadData()
    }

    @IBAction func addButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "toAdd", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toAdd"){
          let addView = segue.destination as! AddGameViewController
          let date = diaryTextLabel.text
          addView.date = date
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = calendarTabelView.dequeueReusableCell(withIdentifier: "calendarCell", for: indexPath)
        let item = self.itemList[(indexPath as NSIndexPath).row]
        
        cell.textLabel?.text = item.text
        
        return cell
    }
}

