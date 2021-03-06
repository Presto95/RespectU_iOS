//
//  SongTrilogyTableViewController.swift
//  RespectU
//
//  Created by Presto on 2018. 3. 3..
//  Copyright © 2018년 Presto. All rights reserved.
//

import UIKit

import XLPagerTabStrip

/// The song table view controller about the TRILOGY series.
final class SongTrilogyTableViewController: SongBaseTableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    songResults = songResults?.filter { $0.seriesEnum == .trilogy }
  }
}

// MARK: - Conforming IndicatorInfoProvider

extension SongTrilogyTableViewController: IndicatorInfoProvider {
  
  func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
    return IndicatorInfo(title: "TRILOGY")
  }
}
