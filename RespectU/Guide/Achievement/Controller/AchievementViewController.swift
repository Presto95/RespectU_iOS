//
//  AchievementViewController.swift
//  RespectU
//
//  Created by Presto on 2018. 3. 2..
//  Copyright © 2018년 Presto. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class AchievementViewController: ButtonBarPagerTabStripViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settings.style.buttonBarBackgroundColor = UIColor.subColor
        settings.style.buttonBarItemBackgroundColor = UIColor.subColor
        settings.style.selectedBarBackgroundColor = UIColor.mainColor
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarItemFont = UIFont.systemFont(ofSize: 14, weight: .medium)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        return [AchievementAllTableViewController(), AchievementMusicTableViewController(), AchievementGearTableViewController(), AchievementNoteTableViewController(), AchievementPlateTableViewController(), AchievementGalleryTableViewController(), AchievementCommentTableViewController()]
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}