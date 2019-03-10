//
//  UIViewController+.swift
//  RespectU
//
//  Created by Presto on 2018. 8. 2..
//  Copyright © 2018년 Presto. All rights reserved.
//

import UIKit

extension UIViewController {
  
  static func instantiate(storyboard: String, identifier: String) -> UIViewController? {
    let viewController = UIStoryboard(name: storyboard, bundle: nil).instantiateViewController(withIdentifier: identifier)
    return viewController
  }
  
  func recommendedSpeed(by speed: Double) -> String {
    switch speed {
    case ..<0.50:
      return "0.50"
    case 0.50..<0.75:
      return "0.50 ~ 0.75"
    case 0.75..<1.00:
      return "0.75 ~ 1.00"
    case 1.00..<1.25:
      return "1.00 ~ 1.25"
    case 1.25..<1.50:
      return "1.25 ~ 1.50"
    case 1.50..<1.75:
      return "1.50 ~ 1.75"
    case 1.75..<2.00:
      return "1.75 ~ 2.00"
    case 2.00..<2.25:
      return "2.00 ~ 2.25"
    case 2.25..<2.50:
      return "2.25 ~ 2.50"
    case 2.50..<2.75:
      return "2.50 ~ 2.75"
    case 2.75..<3.00:
      return "2.75 ~ 3.00"
    case 3.00..<3.25:
      return "3.00 ~ 3.25"
    case 3.25..<3.50:
      return "3.25 ~ 3.50"
    case 3.50..<3.75:
      return "3.50 ~ 3.75"
    case 3.75..<4.00:
      return "3.75 ~ 4.00"
    case 4.00..<4.25:
      return "4.00 ~ 4.25"
    case 4.25..<4.50:
      return "4.25 ~ 4.50"
    case 4.50..<4.75:
      return "4.50 ~ 4.75"
    case 4.75..<5.00:
      return "4.75 ~ 5.00"
    case 5.00...:
      return "5.00"
    default:
      return ""
    }
  }
}