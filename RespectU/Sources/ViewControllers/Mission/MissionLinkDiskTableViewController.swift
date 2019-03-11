//
//  MissionLinkDiskTableViewController.swift
//  RespectU
//
//  Created by Presto on 2018. 6. 28..
//  Copyright © 2018년 Presto. All rights reserved.
//

import UIKit

import XLPagerTabStrip

final class MissionLinkDiskTableViewController: MissionBaseTableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    results = MissionInfo.fetch(bySeries: .linkDisk)
  }
}

extension MissionLinkDiskTableViewController: IndicatorInfoProvider {
  
  func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
    return IndicatorInfo(title: "LINK DISK")
  }
}
