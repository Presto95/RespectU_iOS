//
//  RecordCell.swift
//  RespectU
//
//  Created by Presto on 2018. 4. 4..
//  Copyright © 2018년 Presto. All rights reserved.
//

import UIKit

/// The record table view cell.
final class RecordCell: UITableViewCell {
  
  /// The color label representing the series.
  @IBOutlet private weak var colorLabel: UILabel!
  
  /// The title label.
  @IBOutlet private weak var titleLabel: UILabel!
  
  lazy var labels: [UILabel] = {
    return [colorLabel, titleLabel]
  }()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setup()
  }
  
  /// Configures initial settings.
  private func setup() {
    colorLabel.layer.cornerRadius = colorLabel.bounds.width / 2
    colorLabel.layer.masksToBounds = true
  }
  
  func configure(with songInfo: SongInfo?) {
    guard let songInfo = songInfo else { return }
    let gradient = songInfo.series.seriesGradient(.vertical) ?? CAGradientLayer()
    gradient.frame = colorLabel.bounds
    colorLabel.layer.addSublayer(gradient)
    titleLabel.text = songInfo.localizedTitle
  }
}
