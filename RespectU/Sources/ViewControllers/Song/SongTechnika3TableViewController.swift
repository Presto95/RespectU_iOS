//
//  SongTechnika3TableViewController.swift
//  RespectU
//
//  Created by Presto on 10/03/2019.
//  Copyright © 2019 Presto. All rights reserved.
//

import UIKit

import XLPagerTabStrip

/// The song table view controller about the TECHNIKA 3 series.
final class SongTechnika3TableViewController: SongBaseTableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    songResults = songResults?.filter { $0.seriesEnum == .technika3 }
  }
}

// MARK: - Conforming IndicatorInfoProvider

extension SongTechnika3TableViewController: IndicatorInfoProvider {
  
  func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
    return IndicatorInfo(title: "TECHNIKA 3")
  }
}
