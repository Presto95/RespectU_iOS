//
//  MissionSection.LinkDisk+Gradient.swift
//  RespectU
//
//  Created by Presto on 10/03/2019.
//  Copyright © 2019 Presto. All rights reserved.
//

import Foundation
import UIKit

extension MissionSection.LinkDisk {
  
  /// Creates `CAGradientLayer` matching each mission section.
  ///
  /// - Parameter direction: The direction of gradient layer.
  ///
  /// - Returns: The created `CAGradientLayer`.
  func makeGradient(by direction: GradientDirection) -> CAGradientLayer? {
    let startPoint = direction.startPoint
    let endPoint = direction.endPoint
    switch self {
    case .whiteDisk:
      return CAGradientLayer.make(startPoint: startPoint,
                                  endPoint: endPoint,
                                  colors: [#colorLiteral(red: 0.6549019608, green: 0.03529411765, blue: 0.06274509804, alpha: 1), #colorLiteral(red: 0.9333333333, green: 0.7960784314, blue: 0.8117647059, alpha: 1)],
                                  locations: [0, 0.5, 1])
    case .blackDisk:
      return CAGradientLayer.make(startPoint: startPoint,
                                  endPoint: endPoint,
                                  colors: [#colorLiteral(red: 0.1333333333, green: 0.1176470588, blue: 0.1098039216, alpha: 1), #colorLiteral(red: 0.5921568627, green: 0.5411764706, blue: 0.3843137255, alpha: 1)],
                                  locations: [0, 0.5, 1])
    }
  }
}