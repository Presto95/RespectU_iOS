//
//  TrophyTechnikaTableViewController.swift
//  RespectU
//
//  Created by Presto on 2018. 3. 21..
//  Copyright © 2018년 Presto. All rights reserved.
//

import UIKit

import XLPagerTabStrip

/// The trophy table view controller about the TECHNIKA 1 series.
final class TrophyTechnika1TableViewController: TrophyBaseTableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    results = TrophyInfo.fetch(bySeries: .technika1)
  }
}

// MARK: - UITableView Configuration

extension TrophyTechnika1TableViewController {
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    if indexPath.row == 9 {
      UIAlertController
        .alert(title: L10n.hiddenBGA, message: "Thor")
        .action(title: L10n.ok)
        .present(to: self)
    }
  }
}

// MARK: - Conforming IndicatorInfoProvider

extension TrophyTechnika1TableViewController: IndicatorInfoProvider {
  
  func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
    return IndicatorInfo(title: "TECHNIKA 1")
  }
}
