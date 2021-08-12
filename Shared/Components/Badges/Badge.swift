//
//  Badge.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/8/12.
//

import SwiftUI

public struct Badge: View {

  public var body: some View {
    ZStack {
      BadgeBackground()

      GeometryReader { geometry in
        badgeSymbols
          .scaleEffect(1.0 / 4.0, anchor: .top)
          .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
      }
    }
    .scaledToFit()
  }

}

// MARK: - Computed Property
extension Badge {

  private static let rotateCount = 8

  private var badgeSymbols: some View {
    ForEach(0..<Badge.rotateCount) { item in
      RotatedBadgeSymbol(
        angle: .degrees(Double(item) / Double(Badge.rotateCount)) * 360.0
      )
      .opacity(0.5)
    }
  }

}

// MARK: - Preview
public struct Badge_Previews: PreviewProvider {
  public static var previews: some View {
    Badge()
  }
}
