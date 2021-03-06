//
//  MissionSection.Trilogy+Gradient.swift
//  RespectU
//
//  Created by Presto on 10/03/2019.
//  Copyright © 2019 Presto. All rights reserved.
//

import UIKit

extension MissionSection.Trilogy {
  
  var color: UIColor? {
    switch self {
    case .tSide: return .tSide
    case .rSide: return .rSide
    }
  }
  
  func makeGradient(by direction: GradientDirection) -> CAGradientLayer? {
    let startPoint = direction.startPoint
    let endPoint = direction.endPoint
    let locations: [NSNumber] = [0, 0.5, 1]
    switch self {
    case .tSide:
      return CAGradientLayer(startPoint: startPoint,
                             endPoint: endPoint,
                             colors: [#colorLiteral(red: 0.2980392157, green: 0.337254902, blue: 0.9843137255, alpha: 1), #colorLiteral(red: 0.4, green: 0.6980392157, blue: 0.9764705882, alpha: 1)],
                             locations: locations)
    case .rSide:
      return CAGradientLayer(startPoint: startPoint,
                             endPoint: endPoint,
                             colors: [#colorLiteral(red: 0.2941176471, green: 0.337254902, blue: 0.9843137255, alpha: 1), #colorLiteral(red: 0.5882352941, green: 0.4352941176, blue: 0.9568627451, alpha: 1)],
                             locations: locations)
      
    }
  }
}
