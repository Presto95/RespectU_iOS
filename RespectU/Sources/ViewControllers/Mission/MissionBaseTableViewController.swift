//
//  MissionBaseTableViewController.swift
//  RespectU
//
//  Created by Presto on 2018. 8. 2..
//  Copyright © 2018년 Presto. All rights reserved.
//

import UIKit

import RealmSwift

/// The mission base table view controller.
class MissionBaseTableViewController: UITableViewController {
  
  /// The fetched mission results.
  var results: Results<MissionInfo>?
  
  /// The cell identifier.
  let cellIdentifier = "missionCell"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
  }
  
  /// Configures initial settings.
  private func configure() {
    tableView = UITableView(frame: tableView.bounds, style: .grouped).then {
      $0.rowHeight = 60
      $0.showsVerticalScrollIndicator = false
      $0.separatorStyle = .none
      $0.register(UINib(nibName: MissionCell.name, bundle: nil),
                  forCellReuseIdentifier: cellIdentifier)
    }
  }
}

// MARK: - UITableView Configuration

extension MissionBaseTableViewController {
  
  override func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
    if case let missionCell as MissionCell = cell {
      let result = results?[indexPath.row + indexPath.section * 6]
      missionCell.configure(with: result)
    }
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let object = results?[indexPath.row + indexPath.section * 6]
    let detailViewController
      = StoryboardScene.Mission.missionDetailViewController.instantiate().then {
        $0.missionInfo = object
        $0.modalTransitionStyle = .crossDissolve
    }
    present(detailViewController, animated: true)
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 6
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return (results?.count ?? 0) / 6
  }
  
  override func tableView(_ tableView: UITableView,
                          titleForHeaderInSection section: Int) -> String? {
    return results?[section * 6].section
  }
  
  override func tableView(_ tableView: UITableView,
                          willDisplayHeaderView view: UIView,
                          forSection section: Int) {
    guard let header = view as? UITableViewHeaderFooterView else { return }
    header.textLabel?.textColor = .black
    header.textLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    header.backgroundView?.backgroundColor = .white
  }
  
  override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
    guard let cell = tableView.cellForRow(at: indexPath) as? MissionCell else { return }
    guard let object = results?[indexPath.row + indexPath.section * 6] else { return }
    cell.colorizeSubviews(inSeries: object.seriesEnum ?? .respect, section: object.section)
  }
  
  override func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
    guard let cell = tableView.cellForRow(at: indexPath) as? MissionCell else { return }
    cell.decolorizeSubviews()
  }
}
