//
//  SongBaseViewController.swift
//  RespectU
//
//  Created by Presto on 2018. 8. 2..
//  Copyright © 2018년 Presto. All rights reserved.
//

import UIKit

import Then
import XLPagerTabStrip

/// The base view controller to use button bar pager tap strip.
class ButtonBarPagerTabStripBaseViewController: ButtonBarPagerTabStripViewController {
  
  override func viewDidLoad() {
    setUpButtonBarPagerTabStrip()
    super.viewDidLoad()
  }
  
  /// Sets up button bar pager tab strip.
  private func setUpButtonBarPagerTabStrip() {
    settings.style.selectedBarHeight = 1
    settings.style.selectedBarBackgroundColor = .black50
    settings.style.buttonBarBackgroundColor = .white
    settings.style.buttonBarItemBackgroundColor = .white
    settings.style.buttonBarItemTitleColor = .black50
    settings.style.buttonBarItemsShouldFillAvailiableWidth = true
    settings.style.buttonBarItemFont = UIFont.systemFont(ofSize: 14, weight: .medium)
  }
}
