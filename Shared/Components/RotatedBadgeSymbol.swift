//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/8/12.
//

import SwiftUI

public struct RotatedBadgeSymbol: View {
  public let angle: Angle

  public var body: some View {
    BadgeSymbol()
      .padding(-60)
      .rotationEffect(angle, anchor: .bottom)
  }
}

// MARK: - Preview
struct RotatedBadgeSymbol_Previews: PreviewProvider {
  static var previews: some View {
    RotatedBadgeSymbol(angle: Angle(degrees: 5))
  }
}

