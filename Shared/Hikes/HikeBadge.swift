//
//  HikeBadge.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/9/22.
//

import SwiftUI

public struct HikeBadge: View {
  public let name: String

  public var body: some View {
    VStack {
      Badge()
        .frame(width: 300, height: 300)
        .scaleEffect(1.0 / 3.0)
        .frame(width: 100, height: 100)
      Text(name)
        .font(.caption)
        .accessibilityLabel("Badge for \(name).")
    }
  }
}

public struct HikeBadge_Previews: PreviewProvider {
  public static var previews: some View {
    HikeBadge(name: "Preview Testing")
  }
}
