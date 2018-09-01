//
//  MissionInfo.swift
//  RespectU
//
//  Created by Presto on 2018. 3. 1..
//  Copyright © 2018년 Presto. All rights reserved.
//

import RealmSwift

class Stage: Object {
    @objc dynamic var title: LanguageInfo?
    @objc dynamic var difficulty: String = ""
    @objc dynamic var button: String = ""
}

class MissionInfo: Object {
    @objc dynamic var series: String = ""
    @objc dynamic var section: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var score: Int = 0
    @objc dynamic var fever: Int = 0
    @objc dynamic var combo: Int = 0
    @objc dynamic var rate: Int = 0
    @objc dynamic var `break`: Int = 0
    @objc dynamic var effector: String = ""
    @objc dynamic var reward: LanguageInfo?
    @objc dynamic var stage1: Stage?
    @objc dynamic var stage2: Stage?
    @objc dynamic var stage3: Stage?
    @objc dynamic var stage4: Stage?
    @objc dynamic var stage5: Stage?
    @objc dynamic var stage6: Stage?
    
    var localizedReward: String {
        if Locale.current.regionCode == "KR", let korean = reward?.korean {
            return korean
        } else {
            return reward?.english ?? ""
        }
    }
    
    static func add(_ missionInfo: MissionResponse.Mission) {
        let realm = try! Realm()
        let object = MissionInfo()
        object.series = missionInfo.series
        object.section = missionInfo.section
        object.title = missionInfo.title
        object.score = missionInfo.score
        object.combo = missionInfo.combo
        object.rate = missionInfo.rate
        object.break = missionInfo.break
        object.effector = missionInfo.effector
        object.reward?.english = missionInfo.reward.english
        object.reward?.korean = missionInfo.reward.korean
        if let object = object.stage1, let missionInfo = missionInfo.stage1 {
            object.title?.english = missionInfo.title.english
            object.title?.korean = missionInfo.title.korean
            object.difficulty = missionInfo.difficulty
            object.button = missionInfo.button
        }
        if let object = object.stage2, let missionInfo = missionInfo.stage2 {
            object.title?.english = missionInfo.title.english
            object.title?.korean = missionInfo.title.korean
            object.difficulty = missionInfo.difficulty
            object.button = missionInfo.button
        }
        if let object = object.stage3, let missionInfo = missionInfo.stage3 {
            object.title?.english = missionInfo.title.english
            object.title?.korean = missionInfo.title.korean
            object.difficulty = missionInfo.difficulty
            object.button = missionInfo.button
        }
        if let object = object.stage4, let missionInfo = missionInfo.stage4 {
            object.title?.english = missionInfo.title.english
            object.title?.korean = missionInfo.title.korean
            object.difficulty = missionInfo.difficulty
            object.button = missionInfo.button
        }
        if let object = object.stage5, let missionInfo = missionInfo.stage5 {
            object.title?.english = missionInfo.title.english
            object.title?.korean = missionInfo.title.korean
            object.difficulty = missionInfo.difficulty
            object.button = missionInfo.button
        }
        if let object = object.stage6, let missionInfo = missionInfo.stage6 {
            object.title?.english = missionInfo.title.english
            object.title?.korean = missionInfo.title.korean
            object.difficulty = missionInfo.difficulty
            object.button = missionInfo.button
        }
        try! realm.write {
            realm.add(object)
        }
    }
    
    static func fetch(of series: String = "") -> Results<MissionInfo> {
        let missionInfo = try! Realm().objects(MissionInfo.self)
        if series.isEmpty {
            return missionInfo
        } else {
            let filtered = missionInfo.filter(key: "series", value: series, method: FilterOperator.equal)
            return filtered
        }
    }
}

//class MissionInfo: Object {
//    
//    @objc dynamic var type: String = ""
//    @objc dynamic var section: String = ""
//    @objc dynamic var title: String = ""
//    @objc dynamic var song1title: String = ""
//    @objc dynamic var song1level: String = ""
//    @objc dynamic var song1key: String = ""
//    @objc dynamic var song2title: String = ""
//    @objc dynamic var song2level: String = ""
//    @objc dynamic var song2key: String = ""
//    @objc dynamic var song3title: String = ""
//    @objc dynamic var song3level: String = ""
//    @objc dynamic var song3key: String = ""
//    @objc dynamic var song4title: String = ""
//    @objc dynamic var song4level: String = ""
//    @objc dynamic var song4key: String = ""
//    @objc dynamic var song5title: String = ""
//    @objc dynamic var song5level: String = ""
//    @objc dynamic var song5key: String = ""
//    @objc dynamic var song6title: String = ""
//    @objc dynamic var song6level: String = ""
//    @objc dynamic var song6key: String = ""
//    @objc dynamic var scoreLim: Int = 0
//    @objc dynamic var feverLim: Int = 0   //"X"+feverLim
//    @objc dynamic var comboLim: Int = 0
//    @objc dynamic var rateLim: Int = 0    //rateLim+"%"
//    @objc dynamic var breakLim: Int = 0
//    @objc dynamic var more: String = ""   //기타 사항(이펙터)
//    @objc dynamic var reward: String = ""
//    
//    //CREATE
//    static func add(_ type: String, _ section: String, _ title: String, _ song1title: String, _ song1level: String, _ song1key: String, _ scoreLim: Int, _ feverLim: Int, _ comboLim: Int, _ rateLim: Int, _ breakLim: Int, _ more: String, _ reward: String){
//        let realm = try! Realm()
//        let mission = MissionInfo()
//        mission.type = type
//        mission.section = section
//        mission.title = title
//        mission.song1title = song1title
//        mission.song1level = song1level
//        mission.song1key = song1key
//        mission.scoreLim = scoreLim
//        mission.feverLim = feverLim
//        mission.comboLim = comboLim
//        mission.rateLim = rateLim
//        mission.breakLim = breakLim;
//        mission.more = more
//        mission.reward = reward
//        try! realm.write {
//            realm.add(mission)
//        }
//    }
//    static func add(_ type: String, _ section: String, _ title: String, _ song1title: String, _ song1level: String, _ song1key: String, _ song2title: String, _ song2level: String, _ song2key: String, _ scoreLim: Int, _ feverLim: Int, _ comboLim: Int, _ rateLim: Int, _ breakLim: Int, _ more: String, _ reward: String){
//        let realm = try! Realm()
//        let mission = MissionInfo()
//        mission.type = type
//        mission.section = section
//        mission.title = title
//        mission.song1title = song1title
//        mission.song1level = song1level
//        mission.song1key = song1key
//        mission.song2title = song2title
//        mission.song2level = song2level
//        mission.song2key = song2key
//        mission.scoreLim = scoreLim
//        mission.feverLim = feverLim
//        mission.comboLim = comboLim
//        mission.rateLim = rateLim
//        mission.breakLim = breakLim
//        mission.more = more
//        mission.reward = reward
//        try! realm.write {
//            realm.add(mission)
//        }
//    }
//    static func add(_ type: String, _ section: String, _ title: String, _ song1title: String, _ song1level: String, _ song1key: String, _ song2title: String, _ song2level: String, _ song2key: String, _ song3title: String, _ song3level: String, _ song3key: String, _ scoreLim: Int, _ feverLim: Int, _ comboLim: Int, _ rateLim: Int, _ breakLim: Int, _ more: String, _ reward: String){
//        let realm = try! Realm()
//        let mission = MissionInfo()
//        mission.type = type
//        mission.section = section
//        mission.title = title
//        mission.song1title = song1title
//        mission.song1level = song1level
//        mission.song1key = song1key
//        mission.song2title = song2title
//        mission.song2level = song2level
//        mission.song2key = song2key
//        mission.song3title = song3title
//        mission.song3level = song3level
//        mission.song3key = song3key
//        mission.scoreLim = scoreLim
//        mission.feverLim = feverLim
//        mission.comboLim = comboLim
//        mission.rateLim = rateLim
//        mission.breakLim = breakLim
//        mission.more = more
//        mission.reward = reward
//        try! realm.write {
//            realm.add(mission)
//        }
//    }
//    
//    static func add(_ type: String, _ section: String, _ title: String, _ song1title: String, _ song1level: String, _ song1key: String, _ song2title: String, _ song2level: String, _ song2key: String, _ song3title: String, _ song3level: String, _ song3key: String, _ song4title: String, _ song4level: String, _ song4key: String, _ scoreLim: Int, _ feverLim: Int, _ comboLim: Int, _ rateLim: Int, _ breakLim: Int, _ more: String, _ reward: String){
//        let realm = try! Realm()
//        let mission = MissionInfo()
//        mission.type = type
//        mission.section = section
//        mission.title = title
//        mission.song1title = song1title
//        mission.song1level = song1level
//        mission.song1key = song1key
//        mission.song2title = song2title
//        mission.song2level = song2level
//        mission.song2key = song2key
//        mission.song3title = song3title
//        mission.song3level = song3level
//        mission.song3key = song3key
//        mission.song4title = song4title
//        mission.song4level = song4level
//        mission.song4key = song4key
//        mission.scoreLim = scoreLim
//        mission.feverLim = feverLim
//        mission.comboLim = comboLim
//        mission.rateLim = rateLim
//        mission.breakLim = breakLim;
//        mission.more = more
//        mission.reward = reward
//        try! realm.write {
//            realm.add(mission)
//        }
//    }
//    
//    static func add(_ type: String, _ section: String, _ title: String, _ song1title: String, _ song1level: String, _ song1key: String, _ song2title: String, _ song2level: String, _ song2key: String, _ song3title: String, _ song3level: String, _ song3key: String, _ song4title: String, _ song4level: String, _ song4key: String, _ song5title: String, _ song5level: String, _ song5key: String, _ scoreLim: Int, _ feverLim: Int, _ comboLim: Int, _ rateLim: Int, _ breakLim: Int, _ more: String, _ reward: String){
//        let realm = try! Realm()
//        let mission=MissionInfo()
//        mission.type = type
//        mission.section = section
//        mission.title = title
//        mission.song1title = song1title
//        mission.song1level = song1level
//        mission.song1key = song1key
//        mission.song2title = song2title
//        mission.song2level = song2level
//        mission.song2key = song2key
//        mission.song3title = song3title
//        mission.song3level = song3level
//        mission.song3key = song3key
//        mission.song4title = song4title
//        mission.song4level = song4level
//        mission.song4key = song4key
//        mission.song5title = song5title
//        mission.song5level = song5level
//        mission.song5key = song5key
//        mission.scoreLim = scoreLim
//        mission.feverLim = feverLim
//        mission.comboLim = comboLim
//        mission.rateLim = rateLim
//        mission.breakLim = breakLim
//        mission.more = more
//        mission.reward = reward
//        try! realm.write {
//            realm.add(mission)
//        }
//    }
//    
//    static func add(_ type: String, _ section: String, _ title: String, _ song1title: String, _ song1level: String, _ song1key: String, _ song2title: String, _ song2level: String, _ song2key: String, _ song3title: String, _ song3level: String, _ song3key: String, _ song4title: String, _ song4level: String, _ song4key: String, _ song5title: String, _ song5level: String, _ song5key: String, _ song6title: String, _ song6level: String, _ song6key: String, _ scoreLim: Int, _ feverLim: Int, _ comboLim: Int, _ rateLim: Int, _ breakLim: Int, _ more: String, _ reward: String){
//        let realm = try! Realm()
//        let mission=MissionInfo()
//        mission.type = type
//        mission.section = section
//        mission.title = title
//        mission.song1title = song1title
//        mission.song1level = song1level
//        mission.song1key = song1key
//        mission.song2title = song2title
//        mission.song2level = song2level
//        mission.song2key = song2key
//        mission.song3title = song3title
//        mission.song3level = song3level
//        mission.song3key = song3key
//        mission.song4title = song4title
//        mission.song4level = song4level
//        mission.song4key = song4key
//        mission.song5title = song5title
//        mission.song5level = song5level
//        mission.song5key = song5key
//        mission.song6title = song6title
//        mission.song6level = song6level
//        mission.song6key = song6key
//        mission.scoreLim = scoreLim
//        mission.feverLim = feverLim
//        mission.comboLim = comboLim
//        mission.rateLim = rateLim
//        mission.breakLim = breakLim
//        mission.more = more
//        mission.reward = reward
//        try! realm.write {
//            realm.add(mission)
//        }
//    }
//    
//    //READ
//    static func get() -> Results<MissionInfo> {
//        let result = try! Realm().objects(MissionInfo.self)
//        return result
//    }
//}
//
