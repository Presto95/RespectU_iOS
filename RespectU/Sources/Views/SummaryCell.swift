//
//  SummaryCell.swift
//  RespectU
//
//  Created by Presto on 2018. 3. 4..
//  Copyright © 2018년 Presto. All rights reserved.
//

import UIKit

import RealmSwift

protocol SummaryCellDelegate: class {
  
  func summaryCell(_ cell: SummaryCell, didTapSearchButton button: UIButton)
  
  func summaryCell(_ cell: SummaryCell, didTapDetailButton button: UIButton)
}

/// The summary table view cell.
final class SummaryCell: UITableViewCell {
  
  weak var delegate: SummaryCellDelegate?
  
  /// The title label.
  @IBOutlet private weak var titleLabel: UILabel!
  
  /// The background view.
  @IBOutlet private weak var view: UIView!
  
  /// The collection view.
  @IBOutlet private weak var collectionView: UICollectionView!
  
  /// The detail button.
  @IBOutlet private weak var detailButton: UIButton!
  
  /// The search button.
  @IBOutlet private weak var searchButton: UIButton!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setup()
  }
  
  /// Configures initial settings.
  private func setup() {
    titleLabel.text = L10n.summary
    view.layer.cornerRadius = 15
    view.layer.borderWidth = 1
    view.layer.borderColor = UIColor.lightGray.cgColor
    view.layer.masksToBounds = true
    detailButton.setTitle(L10n.detail, for: .normal)
    searchButton.setTitle(L10n.searchByCondition, for: .normal)
    detailButton.addTarget(self, action: #selector(detailButtonDidTap(_:)), for: .touchUpInside)
    searchButton.addTarget(self, action: #selector(searchButtonDidTap(_:)), for: .touchUpInside)
  }
  
  @objc private func searchButtonDidTap(_ sender: UIButton) {
    delegate?.summaryCell(self, didTapSearchButton: sender)
  }
  
  @objc private func detailButtonDidTap(_ sender: UIButton) {
    delegate?.summaryCell(self, didTapDetailButton: sender)
  }
}
