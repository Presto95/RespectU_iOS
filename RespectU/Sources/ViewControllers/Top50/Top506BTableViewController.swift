//
//  Top506BTableViewController.swift
//  RespectU
//
//  Created by Presto on 2018. 3. 4..
//  Copyright © 2018년 Presto. All rights reserved.
//

import UIKit

import XLPagerTabStrip

/// The top50 table view controller about the 6B.
final class Top506BTableViewController: Top50BaseTableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    results = tempResults.sorted { $0.button6?.skillPoint ?? 0 > $1.button6?.skillPoint ?? 0 }
  }
}

// MARK: - UITableView Configuration

extension Top506BTableViewController {
  
  override func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
    if case let top50Cell as Top50Cell = cell {
      let object = results[indexPath.row]
      top50Cell.configure(with: object, button: .button6)
    }
    return cell
  }
}

// MARK: - Conforming IndicatorInfoProvider

extension Top506BTableViewController: IndicatorInfoProvider {
  
  func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
    return IndicatorInfo(title: Button.button6.rawValue.uppercased())
  }
}
