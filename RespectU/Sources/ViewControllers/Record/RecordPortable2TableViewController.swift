//
//  RecordPortable2TableViewController.swift
//  RespectU
//
//  Created by Presto on 2018. 4. 4..
//  Copyright © 2018년 Presto. All rights reserved.
//

import UIKit

import XLPagerTabStrip

/// The record table view controller about the PORTABLE 2 series.
final class RecordPortable2TableViewController: RecordBaseTableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    songResults = tempSongResults?
      .filter { $0.seriesEnum == .portable2 }
      .sorted { $0.localizedLowercase < $1.localizedLowercase }
  }
}

// MARK: - Conforming IndicatorInfoProvider

extension RecordPortable2TableViewController: IndicatorInfoProvider {
  
  func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
    return IndicatorInfo(title: "PORTABLE 2")
  }
}
