//
//  FeatureCard.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/9/26.
//

import SwiftUI

public struct FeatureCard: View {
  public let landmark: Landmark

  public var body: some View {
    landmark
      .featureImage?
      .resizable()
      .aspectRatio(3 / 2, contentMode: .fit)
      .overlay(TextOverlay(landmark: landmark))
  }
}

public struct FeatureCard_Previews: PreviewProvider {
  public static var previews: some View {
    FeatureCard(landmark: ModelData().features[0])
  }
}
