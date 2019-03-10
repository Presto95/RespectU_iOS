//
//  MissionSection.Technika1+Gradient.swift
//  RespectU
//
//  Created by Presto on 10/03/2019.
//  Copyright © 2019 Presto. All rights reserved.
//

import Foundation
import UIKit

extension MissionSection.Technika1 {
  
  /// Creates `CAGradientLayer` matching each mission section.
  ///
  /// - Parameter direction: The direction of gradient layer.
  ///
  /// - Returns: The created `CAGradientLayer`.
  func makeGradient(by direction: GradientDirection) -> CAGradientLayer? {
    let startPoint = direction.startPoint
    let endPoint = direction.endPoint
    switch self {
    case .platinumMixing:
      return CAGradientLayer.make(startPoint: startPoint,
                                          endPoint: endPoint,
                                          colors: [#colorLiteral(red: 0.09803921569, green: 0.1882352941, blue: 0.2980392157, alpha: 1), #colorLiteral(red: 0.5490196078, green: 0.6862745098, blue: 0.7921568627, alpha: 1)],
                                          locations: [0, 0.5, 1])
    case .technicalMixing:
      return CAGradientLayer.make(startPoint: startPoint,
                                          endPoint: endPoint,
                                          colors: [#colorLiteral(red: 0.4, green: 0.07450980392, blue: 0.3803921569, alpha: 1), #colorLiteral(red: 0.8705882353, green: 0.2039215686, blue: 0.6392156863, alpha: 1)],
                                          locations: [0, 0.5, 1])
    }
  }
}
