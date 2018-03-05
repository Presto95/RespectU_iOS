//
//  GradeViewController.swift
//  RespectU
//
//  Created by Presto on 2018. 1. 5..
//  Copyright © 2018년 Presto. All rights reserved.
//

import UIKit
import GaugeKit
import RealmSwift
import Firebase
import GoogleSignIn




class GradeViewController: UIViewController {

    let button4GradeArray = ["BEGINNER", "AMATEUR 4", "AMATEUR 3", "AMATEUR 2", "AMATEUR 1", "SUB DJ 4", "SUB DJ 3", "SUB DJ 2", "SUB DJ 1", "MAIN DJ 4", "MAIN DJ 3", "MAIN DJ 2", "MAIN DJ 1", "POP DJ 4", "POP DJ 3", "POP DJ 2", "POP DJ 1", "PROFESSIONAL 3", "PROFESSIONAL 2", "PROFESSIONAL 1", "MIX MASTER 3", "MIX MASTER 2", "MIX MASTER 1", "SUPERSTAR 3", "SUPERSTAR 2", "SUPERSTAR 1", "DJMAX GRAND MASTER", "THE DJMAX"]
    let button5GradeArray=["BEGINNER", "AMATEUR 4", "AMATEUR 3", "AMATEUR 2", "AMATEUR 1", "SUB DJ 4", "SUB DJ 3", "SUB DJ 2", "SUB DJ 1", "MAIN DJ 4", "MAIN DJ 3", "MAIN DJ 2", "MAIN DJ 1", "POP DJ 4", "POP DJ 3", "POP DJ 2", "POP DJ 1", "PROFESSIONAL 4", "PROFESSIONAL 3", "PROFESSIONAL 2", "PROFESSIONAL 1", "MIX MASTER 3", "MIX MASTER 2", "MIX MASTER 1", "SUPERSTAR 3", "SUPERSTAR 2", "SUPERSTAR 1", "DJMAX GRAND MASTER", "THE DJMAX"]
    let button6And8GradeArray=["BEGINNER", "AMATEUR 4", "AMATEUR 3", "AMATEUR 2", "AMATEUR 1", "SUB DJ 4", "SUB DJ 3", "SUB DJ 2", "SUB DJ 1", "MAIN DJ 4", "MAIN DJ 3", "MAIN DJ 2", "MAIN DJ 1", "POP DJ 4", "POP DJ 3", "POP DJ 2", "POP DJ 1", "PROFESSIONAL 4", "PROFESSIONAL 3", "PROFESSIONAL 2", "PROFESSIONAL 1", "MIX MASTER 3", "MIX MASTER 2", "MIX MASTER 1", "SUPERSTAR 3", "SUPERSTAR 2", "SUPERSTAR 1", "DJMAX GRAND MASTER", "THE DJMAX"]
    var button4SkillLevel: String=""
    var button4SkillPoint: Double=0.0
    var button4FirstSkillPoint: Double=0.0
    var button4FirstSong: String=""
    var button4LastSkillPoint: Double=0.0
    var button4LastSong: String=""
    var button5SkillLevel: String=""
    var button5SkillPoint: Double=0.0
    var button5FirstSkillPoint: Double=0.0
    var button5FirstSong: String=""
    var button5LastSkillPoint: Double=0.0
    var button5LastSong: String=""
    var button6SkillLevel: String=""
    var button6SkillPoint: Double=0.0
    var button6FirstSkillPoint: Double=0.0
    var button6FirstSong: String=""
    var button6LastSkillPoint: Double=0.0
    var button6LastSong: String=""
    var button8SkillLevel: String=""
    var button8SkillPoint: Double=0.0
    var button8FirstSkillPoint: Double=0.0
    var button8FirstSong: String=""
    var button8LastSkillPoint: Double=0.0
    var button8LastSong: String=""
    var button4Max: Double=0.0
    var button5Max: Double=0.0
    var button6Max: Double=0.0
    var button8Max: Double=0.0
    
    let realm = try! Realm()
    var results: SongInfo? = nil
    var query: NSPredicate? = nil
    
    let key: String = UserDefaults.standard.string(forKey: "favoriteButton") ?? "4B"
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var labelSkillLevel: UILabel!
    @IBOutlet weak var labelSkillPoint: UILabel!
    @IBOutlet var viewGauge: Gauge!
    @IBOutlet var gaugeFirst: Gauge!
    @IBOutlet var gaugeLast: Gauge!
    @IBOutlet weak var labelFirstSkillPoint: UILabel!
    @IBOutlet weak var labelFirstSkillPointValue: UILabel!
    @IBOutlet weak var labelLastSkillPoint: UILabel!
    @IBOutlet weak var labelLastSkillPointValue: UILabel!
    @IBOutlet weak var labelFirstSong: UILabel!
    @IBOutlet weak var labelLastSong: UILabel!
    @IBOutlet weak var labelNext: UILabel!
    @IBOutlet weak var labelPercent: UILabel!
    @IBOutlet weak var buttonUpload: UIButton!
    @IBOutlet weak var buttonRanking: UIButton!
    @IBOutlet weak var buttonNickname: UIButton!
    
    let isNight = UserDefaults.standard.bool(forKey: "night")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Skill Level".localized
        labelFirstSkillPoint.text = "1st".localized
        labelLastSkillPoint.text = "50th".localized
        tabBarController?.tabBar.barStyle = isNight ? .black: .default
        navigationController?.navigationBar.barStyle = isNight ? .black : .default
        view.backgroundColor=isNight ? UIColor(red: 0, green: 0, blue: 0, alpha: 1) : UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        labelSkillLevel.textColor=isNight ? UIColor(red: 1, green: 1, blue: 1, alpha: 1) : UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1)
        labelSkillPoint.textColor=isNight ? UIColor(red: 1, green: 1, blue: 1, alpha: 1) : UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1)
        labelFirstSkillPoint.textColor=isNight ? UIColor(red: 1, green: 1, blue: 1, alpha: 1) : UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1)
        labelFirstSkillPointValue.textColor=isNight ? UIColor(red: 1, green: 1, blue: 1, alpha: 1) : UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1)
        labelFirstSong.textColor=isNight ? UIColor(red: 1, green: 1, blue: 1, alpha: 1) : UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1)
        labelLastSkillPoint.textColor=isNight ? UIColor(red: 1, green: 1, blue: 1, alpha: 1) : UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1)
        labelLastSkillPointValue.textColor=isNight ? UIColor(red: 1, green: 1, blue: 1, alpha: 1) : UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1)
        labelLastSong.textColor=isNight ? UIColor(red: 1, green: 1, blue: 1, alpha: 1) : UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1)
        labelNext.textColor=isNight ? UIColor(red: 1, green: 1, blue: 1, alpha: 1) : UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1)
        labelPercent.textColor=isNight ? UIColor(red: 1, green: 1, blue: 1, alpha: 1) : UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1)
        labelPercent.layer.zPosition = 1
        buttonUpload.setTitle("Upload β".localized, for: .normal)
        buttonRanking.setTitle("Ranking β".localized, for: .normal)
        buttonNickname.setTitle("Nickname Setting β".localized, for: .normal)
        
        switch(key){
        case "4B":
            showInfo(sender: 0)
        case "5B":
            showInfo(sender: 1)
        case "6B":
            showInfo(sender: 2)
        case "8B":
            showInfo(sender: 3)
        default:
            break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getColor(series: String) -> UIColor{
        switch(series){
        case "Trilogy":
            return UIColor(red: 115/255.0, green: 139/255.0, blue: 252/255.0, alpha: 1)
        case "Respect":
            return UIColor(red: 240/255.0, green: 179/255.0, blue: 44/255.0, alpha: 1)
        case "Portable1":
            return UIColor(red: 29/255.0, green: 180/255.0, blue: 210/255.0, alpha: 1)
        case "Portable2":
            return UIColor(red: 252/255.0, green: 34/255.0, blue: 43/255.0, alpha: 1)
        case "CE":
            return UIColor(red: 255/255.0, green: 248/255.0, blue: 221/255.0, alpha: 1)
        default:
            break
        }
        return UIColor()
    }
    
    @IBAction func refresh(_ sender: UIBarButtonItem) {
        switch(segmentedControl.selectedSegmentIndex){
        case 0:
            //let result = getButton4Grade()
            let result = getGrade(sender: .button4)
//            button4SkillLevel = getGradeButton4(value: result.0)
            button4SkillPoint = result.0
            button4FirstSkillPoint = result.1
            button4FirstSong = result.2
            button4LastSkillPoint = result.3
            button4LastSong = result.4
            showInfo(sender: 0)
        case 1:
            let result = getGrade(sender: .button5)
            //let result = getButton5Grade()
//            button5SkillLevel = getGradeButton5(value: result.0)
            button5SkillPoint = result.0
            button5FirstSkillPoint = result.1
            button5FirstSong = result.2
            button5LastSkillPoint = result.3
            button5LastSong = result.4
            showInfo(sender: 1)
        case 2:
            let result = getGrade(sender: .button6)
            //let result = getButton6Grade()
//            button6SkillLevel = getGradeButton6And8(value: result.0)
            button6SkillPoint = result.0
            button6FirstSkillPoint = result.1
            button6FirstSong = result.2
            button6LastSkillPoint = result.3
            button6LastSong = result.4
            showInfo(sender: 2)
        case 3:
            let result = getGrade(sender: .button8)
            //let result = getButton8Grade()
//            button8SkillLevel = getGradeButton6And8(value: result.0)
            button8SkillPoint = result.0
            button8FirstSkillPoint = result.1
            button8FirstSong = result.2
            button8LastSkillPoint = result.3
            button8LastSong = result.4
            showInfo(sender: 3)
        default:
            break
        }
    }
    
    @IBAction func calculate(_ sender: UIBarButtonItem) {
//        let next = self.storyboard?.instantiateViewController(withIdentifier: "SkillPointCalculatorViewController") as! SkillPointCalculatorViewController
//        self.navigationController?.pushViewController(next, animated: true)
        
    }
    
    @IBAction func pressSegmentedControl(_ sender: UISegmentedControl) {
        switch(sender.selectedSegmentIndex){
        case 0:
            showInfo(sender: 0)
        case 1:
            showInfo(sender: 1)
        case 2:
            showInfo(sender: 2)
        case 3:
            showInfo(sender: 3)
        default:
            break
        }
    }
    
    @IBAction func showTop50(_ sender: UIButton) {
//        let next = self.storyboard?.instantiateViewController(withIdentifier: "Top50TableViewController") as! Top50TableViewController
//        switch(segmentedControl.selectedSegmentIndex){
//        case 0:
//            next.sender = 0
//        case 1:
//            next.sender = 1
//        case 2:
//            next.sender = 2
//        case 3:
//            next.sender = 3
//        default:
//            break
//        }
//        self.navigationController?.pushViewController(next, animated: true)
    }
    
    @IBAction func upload(_ sender: UIButton) {
        if(!Reachability.isConnectedToNetwork()){
            let alert = UIAlertController(title: "Error".localized, message: "Please check the network status.".localized, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK".localized, style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true)
        }
        else{
            if(Auth.auth().currentUser == nil){
                let alert = UIAlertController(title: "Error".localized, message: "Please login first.".localized, preferredStyle: .alert)
                let action = UIAlertAction(title: "OK".localized, style: .default, handler: nil)
                alert.addAction(action)
                present(alert, animated: true)
            }
            else{
                UIApplication.shared.isNetworkActivityIndicatorVisible = true
//                ERProgressHud.show()
                Database.database().reference().child("users").child((Auth.auth().currentUser?.uid)!).setValue([
                    "userId": UserDefaults.standard.string(forKey: "nickname") ?? Auth.auth().currentUser?.email,
                    "button4SkillPoint": (UserDefaults.standard.double(forKey: "button4SkillPoint") * 100).rounded() / 100,
                    "button5SkillPoint": (UserDefaults.standard.double(forKey: "button5SkillPoint") * 100).rounded() / 100,
                    "button6SkillPoint": (UserDefaults.standard.double(forKey: "button6SkillPoint") * 100).rounded() / 100,
                    "button8SkillPoint": (UserDefaults.standard.double(forKey: "button8SkillPoint") * 100).rounded() / 100,
                    "countPerfectPlay": UserDefaults.standard.integer(forKey: "countPerfectPlay"),
                    "uid": Auth.auth().currentUser?.uid
                    
                    ])
//                ERProgressHud.hide()
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        }
    }
    
    @IBAction func ranking(_ sender: UIButton) {
        if(!Reachability.isConnectedToNetwork()){
            let alert = UIAlertController(title: "Error".localized, message: "Please check the network status.".localized, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK".localized, style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true)
        }
        else{
            if(Auth.auth().currentUser == nil){
                let alert = UIAlertController(title: "Error".localized, message: "Please login first.".localized, preferredStyle: .alert)
                let action = UIAlertAction(title: "OK".localized, style: .default, handler: nil)
                alert.addAction(action)
                present(alert, animated: true)
            }
            else{
                var arrayUserId: [String] = []
                var arrayButton4SkillPoint: [Double] = []
                var arrayButton5SkillPoint: [Double] = []
                var arrayButton6SkillPoint: [Double] = []
                var arrayButton8SkillPoint: [Double] = []
                var arrayPerfectPlay: [Int] = []
//                ERProgressHud.show()
                UIApplication.shared.isNetworkActivityIndicatorVisible = true
                let ref = Database.database().reference()
                ref.child("users").observeSingleEvent(of: .value) { (snapshot) in
                    for child in snapshot.children{
                        let snap = child as! DataSnapshot
                        for i in snap.children{
                            let a = i as! DataSnapshot
                            if(a.key == "button4SkillPoint"){
                                arrayButton4SkillPoint.append(a.value! as! Double)
                            }
                            if(a.key == "button5SkillPoint"){
                                arrayButton5SkillPoint.append(a.value! as! Double)
                            }
                            if(a.key == "button6SkillPoint"){
                                arrayButton6SkillPoint.append(a.value! as! Double)
                            }
                            if(a.key == "button8SkillPoint"){
                                arrayButton8SkillPoint.append(a.value! as! Double)
                            }
                            if(a.key == "countPerfectPlay"){
                                arrayPerfectPlay.append(a.value! as! Int)
                            }
                            if(a.key == "userId"){
                                arrayUserId.append(a.value! as! String)
                            }
                        }
                    }
                    var button4Dic: [String: Double] = [:]
                    var button5Dic: [String: Double] = [:]
                    var button6Dic: [String: Double] = [:]
                    var button8Dic: [String: Double] = [:]
                    var perfectPlayDic: [String: Int] = [:]
                    for i in 0..<arrayUserId.count{
                        button4Dic[arrayUserId[i]] = arrayButton4SkillPoint[i]
                        button5Dic[arrayUserId[i]] = arrayButton5SkillPoint[i]
                        button6Dic[arrayUserId[i]] = arrayButton6SkillPoint[i]
                        button8Dic[arrayUserId[i]] = arrayButton8SkillPoint[i]
                        perfectPlayDic[arrayUserId[i]] = arrayPerfectPlay[i]
                    }
                    let next=self.storyboard?.instantiateViewController(withIdentifier: "RankingViewController") as! RankingViewController
//                    next.resultButton4 = button4Dic
//                    next.resultButton5 = button5Dic
//                    next.resultButton6 = button6Dic
//                    next.resultButton8 = button8Dic
//                    next.resultPerfectPlay = perfectPlayDic
//                    next.nickname = UserDefaults.standard.string(forKey: "nickname") ?? (Auth.auth().currentUser?.email)!
                    self.navigationController?.pushViewController(next, animated: true)
//                    ERProgressHud.hide()
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            }
        }
        
    }

    @IBAction func clickNicknameSetting(_ sender: UIButton) {
        if(!Reachability.isConnectedToNetwork()){
            let alert = UIAlertController(title: "Error".localized, message: "Please check the network status.".localized, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK".localized, style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true)
        }
        else{
            if(Auth.auth().currentUser == nil){
                let alert = UIAlertController(title: "Error".localized, message: "Please login first.".localized, preferredStyle: .alert)
                let action = UIAlertAction(title: "OK".localized, style: .default, handler: nil)
                alert.addAction(action)
                present(alert, animated: true)
            }
            else{
                let alert = UIAlertController(title: "Nickname Setting β".localized, message: "Please enter your nickname.".localized, preferredStyle: .alert)
                alert.addTextField(configurationHandler: { (textField) in
                    textField.placeholder = "Nickname".localized
                })
                let yesAction = UIAlertAction(title: "OK".localized, style: .default) { (action) -> Void in
                    if let input = alert.textFields![0].text{
                        /*Database.database().reference().child("users").observeSingleEvent(of: .value){ (snapshot) in
                            for child in snapshot.children{
                                let snap = child as! DataSnapshot
                                if(snap.key == input){
                                    NotificationBanner(title: "Fail".localized, subtitle: "Duplicate nickname".localized, leftView: UIImageView(image: #imageLiteral(resourceName: "fail")), style: .danger).show()
                                }
                            }
                        }*/
                        if(input.count == 0){
                            return
                        }
                        UserDefaults.standard.set(input, forKey: "nickname")
                        Database.database().reference().child("users").child((Auth.auth().currentUser?.uid)!).setValue([
                            "userId": input,
                            "button4SkillPoint": (UserDefaults.standard.double(forKey: "button4SkillPoint") * 100).rounded() / 100,
                            "button5SkillPoint": (UserDefaults.standard.double(forKey: "button5SkillPoint") * 100).rounded() / 100,
                            "button6SkillPoint": (UserDefaults.standard.double(forKey: "button6SkillPoint") * 100).rounded() / 100,
                            "button8SkillPoint": (UserDefaults.standard.double(forKey: "button8SkillPoint") * 100).rounded() / 100,
                            "countPerfectPlay": UserDefaults.standard.integer(forKey: "countPerfectPlay"),
                            "uid": Auth.auth().currentUser?.uid
                            ])
                    }
                }
                let noAction = UIAlertAction(title: "Cancel".localized, style: .cancel, handler: nil)
                alert.addAction(yesAction)
                alert.addAction(noAction)
                present(alert, animated: true)
            }
        }
        
    }
    
    func getNextString(string: String, sender: Int) -> String{
        var index: Int=0
        var nextString = "Next".localized + " : "
        switch(sender){
        case 0:
            for i in button4GradeArray{
                if(i == string){
                    break
                }
                index = index + 1
            }
            if(index + 1 == button4GradeArray.count){
                nextString = nextString + "None".localized
            }
            else{
                nextString = nextString + button4GradeArray[index+1]
            }
        case 1:
            for i in button5GradeArray{
                if(i == string){
                    break
                }
                index = index + 1
            }
            if(index + 1 == button5GradeArray.count){
                nextString = nextString + "None".localized
            }
            else{
                nextString = nextString + button5GradeArray[index+1]
            }
        case 2...3:
            for i in button6And8GradeArray{
                if(i == string){
                    break
                }
                index = index + 1
            }
            if(index + 1 == button6And8GradeArray.count){
                nextString = nextString + "None".localized
            }
            else{
                nextString = nextString + button6And8GradeArray[index+1]
            }
        default:
            break
        }
        return nextString
    }
    
    func showInfo(sender: Int){
        switch(sender){
        case 0:
            segmentedControl.selectedSegmentIndex = 0
            labelSkillLevel.text = button4SkillLevel
            labelSkillPoint.text = "Skill Point".localized + " : " + String((button4SkillPoint * 100.0).rounded() / 100.0)
            labelFirstSkillPointValue.text = String(button4FirstSkillPoint)
            labelFirstSong.text = button4FirstSong
            labelLastSkillPointValue.text = String(button4LastSkillPoint)
            labelLastSong.text = button4LastSong
            labelNext.text = getNextString(string: button4SkillLevel, sender: 0)
            labelPercent.text = "\(((button4SkillPoint / button4Max) * 10000.0).rounded() / 100.0)%"
            query = NSPredicate(format: "title = %@", button4FirstSong)
            results = try! Realm().objects(SongInfo.self).filter(query!).first!
            let firstSeries = (results?.series)!
            query = NSPredicate(format: "title = %@", button4LastSong)
            results = try! Realm().objects(SongInfo.self).filter(query!).first!
            let lastSeries = (results?.series)!
            viewGauge.startColor = getColor(series: firstSeries)
            viewGauge.bgColor = getColor(series: firstSeries)
            viewGauge.bgAlpha = 0.5
            viewGauge.maxValue = CGFloat(button4Max)
            viewGauge.animateRate(1, newValue: CGFloat(button4SkillPoint)){_ in }
            gaugeFirst.startColor = getColor(series: firstSeries)
            gaugeFirst.endColor = getColor(series: lastSeries)
            gaugeLast.startColor = getColor(series: lastSeries)
            gaugeLast.endColor = getColor(series: firstSeries)
            gaugeFirst.animateRate(1, newValue: CGFloat(button4FirstSkillPoint)){_ in }
            gaugeLast.animateRate(1, newValue: CGFloat(button4LastSkillPoint)){_ in }
        case 1:
            segmentedControl.selectedSegmentIndex = 1
            labelSkillLevel.text = button5SkillLevel
            labelSkillPoint.text = "Skill Point".localized + " : " + String((button5SkillPoint * 100.0).rounded() / 100.0)
            labelFirstSkillPointValue.text = String(button5FirstSkillPoint)
            labelFirstSong.text = button5FirstSong
            labelLastSkillPointValue.text = String(button5LastSkillPoint)
            labelLastSong.text = button5LastSong
            labelNext.text = getNextString(string: button5SkillLevel, sender: 1)
            labelPercent.text = "\(((button5SkillPoint / button5Max) * 10000.0).rounded() / 100.0)%"
            query = NSPredicate(format: "title = %@", button5FirstSong)
            results = try! Realm().objects(SongInfo.self).filter(query!).first!
            let firstSeries = (results?.series)!
            query = NSPredicate(format: "title = %@", button5LastSong)
            results = try! Realm().objects(SongInfo.self).filter(query!).first!
            let lastSeries = (results?.series)!
            viewGauge.startColor = getColor(series: firstSeries)
            viewGauge.bgColor = getColor(series: firstSeries)
            viewGauge.bgAlpha = 0.5
            viewGauge.maxValue = CGFloat(button5Max)
            viewGauge.animateRate(1, newValue: CGFloat(button5SkillPoint)){_ in }
            gaugeFirst.startColor = getColor(series: firstSeries)
            gaugeFirst.endColor = getColor(series: lastSeries)
            gaugeLast.startColor = getColor(series: lastSeries)
            gaugeLast.endColor = getColor(series: firstSeries)
            gaugeFirst.animateRate(1, newValue: CGFloat(button5FirstSkillPoint)){_ in }
            gaugeLast.animateRate(1, newValue: CGFloat(button5LastSkillPoint)){_ in }
        case 2:
            segmentedControl.selectedSegmentIndex = 2
            labelSkillLevel.text = button6SkillLevel
            labelSkillPoint.text = "Skill Point".localized + " : " + String((button6SkillPoint * 100.0).rounded() / 100.0)
            labelFirstSkillPointValue.text = String(button6FirstSkillPoint)
            labelFirstSong.text = button6FirstSong
            labelLastSkillPointValue.text = String(button6LastSkillPoint)
            labelLastSong.text = button6LastSong
            labelNext.text = getNextString(string: button6SkillLevel, sender: 2)
            labelPercent.text = "\(((button6SkillPoint / button6Max) * 10000.0).rounded() / 100.0)%"
            query = NSPredicate(format: "title = %@", button6FirstSong)
            results = try! Realm().objects(SongInfo.self).filter(query!).first!
            let firstSeries = (results?.series)!
            query = NSPredicate(format: "title = %@", button6LastSong)
            results = try! Realm().objects(SongInfo.self).filter(query!).first!
            let lastSeries = (results?.series)!
            viewGauge.startColor = getColor(series: firstSeries)
            viewGauge.bgColor = getColor(series: firstSeries)
            viewGauge.bgAlpha = 0.5
            viewGauge.maxValue = CGFloat(button6Max)
            viewGauge.animateRate(1, newValue: CGFloat(button6SkillPoint)){_ in }
            gaugeFirst.startColor = getColor(series: firstSeries)
            gaugeFirst.endColor = getColor(series: lastSeries)
            gaugeLast.startColor = getColor(series: lastSeries)
            gaugeLast.endColor = getColor(series: firstSeries)
            gaugeFirst.animateRate(1, newValue: CGFloat(button6FirstSkillPoint)){_ in }
            gaugeLast.animateRate(1, newValue: CGFloat(button6LastSkillPoint)){_ in }
        case 3:
            segmentedControl.selectedSegmentIndex = 3
            labelSkillLevel.text = button8SkillLevel
            labelSkillPoint.text = "Skill Point".localized + " : " + String((button8SkillPoint * 100.0).rounded() / 100.0)
            labelFirstSkillPointValue.text = String(button8FirstSkillPoint)
            labelFirstSong.text = button8FirstSong
            labelLastSkillPointValue.text = String(button8LastSkillPoint)
            labelLastSong.text = button8LastSong
            labelNext.text = getNextString(string: button8SkillLevel, sender: 3)
            labelPercent.text = "\(((button8SkillPoint / button8Max) * 10000.0).rounded() / 100.0)%"
            query = NSPredicate(format: "title = %@", button8FirstSong)
            results = try! Realm().objects(SongInfo.self).filter(query!).first!
            let firstSeries = (results?.series)!
            query = NSPredicate(format: "title = %@", button8LastSong)
            results = try! Realm().objects(SongInfo.self).filter(query!).first!
            let lastSeries = (results?.series)!
            viewGauge.startColor = getColor(series: firstSeries)
            viewGauge.bgColor = getColor(series: firstSeries)
            viewGauge.bgAlpha = 0.5
            viewGauge.maxValue = CGFloat(button8Max)
            viewGauge.animateRate(1, newValue: CGFloat(button8SkillPoint)){_ in }
            gaugeFirst.startColor = getColor(series: firstSeries)
            gaugeFirst.endColor = getColor(series: lastSeries)
            gaugeLast.startColor = getColor(series: lastSeries)
            gaugeLast.endColor = getColor(series: firstSeries)
            gaugeFirst.animateRate(1, newValue: CGFloat(button8FirstSkillPoint)){_ in }
            gaugeLast.animateRate(1, newValue: CGFloat(button8LastSkillPoint)){_ in }
        default:
            break
        }
    }
    
    func getGrade(sender: Button) -> (sum: Double, firstSongSkillPoint: Double, firstSong: String, lastSongSkillPoint: Double, lastSong: String){
        var record: Results<RecordInfo>
        switch(sender){
        case .button4:
            record = try! Realm().objects(RecordInfo.self).sorted(byKeyPath: "button4SkillPoint", ascending: false)
        case .button5:
            record = try! Realm().objects(RecordInfo.self).sorted(byKeyPath: "button5SkillPoint", ascending: false)
        case .button6:
            record = try! Realm().objects(RecordInfo.self).sorted(byKeyPath: "button6SkillPoint", ascending: false)
        case .button8:
            record = try! Realm().objects(RecordInfo.self).sorted(byKeyPath: "button8SkillPoint", ascending: false)
        }
        let firstRecord = record.first!
        let lastRecord = record[49]
        var sum: Double = 0
        switch(sender){
        case .button4:
            for i in 0..<50{
                sum += record[i].button4SkillPoint
            }
            UserDefaults.standard.set(sum, forKey: "button4SkillPoint")
            return (sum, firstRecord.button4SkillPoint, firstRecord.title, lastRecord.button4SkillPoint, lastRecord.title)
        case .button5:
            for i in 0..<50{
                sum += record[i].button5SkillPoint
            }
            UserDefaults.standard.set(sum, forKey: "button5SkillPoint")
            return (sum, firstRecord.button5SkillPoint, firstRecord.title, lastRecord.button5SkillPoint, lastRecord.title)
        case .button6:
            for i in 0..<50{
                sum += record[i].button6SkillPoint
            }
            UserDefaults.standard.set(sum, forKey: "button6SkillPoint")
            return (sum, firstRecord.button6SkillPoint, firstRecord.title, lastRecord.button6SkillPoint, lastRecord.title)
        case .button8:
            for i in 0..<50{
                sum += record[i].button8SkillPoint
            }
            UserDefaults.standard.set(sum, forKey: "button8SkillPoint")
            return (sum, firstRecord.button8SkillPoint, firstRecord.title, lastRecord.button8SkillPoint, lastRecord.title)
        }
    }
}
