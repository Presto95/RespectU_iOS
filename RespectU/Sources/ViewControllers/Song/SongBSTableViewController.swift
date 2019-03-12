//
//  SongBSTableViewController.swift
//  RespectU
//
//  Created by Presto on 2018. 6. 28..
//  Copyright © 2018년 Presto. All rights reserved.
//

import UIKit

import XLPagerTabStrip

final class SongBSTableViewController: SongBaseTableViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    songResults = songResults?.filter { $0.seriesEnum == .bs }
  }
}

extension SongBSTableViewController: IndicatorInfoProvider {
  
  func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
    return IndicatorInfo(title: "BLACK SQUARE")
  }
}