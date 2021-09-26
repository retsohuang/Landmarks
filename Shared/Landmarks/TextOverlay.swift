//
//  TextOverlay.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/9/26.
//

import SwiftUI

public struct TextOverlay: View {
  public let landmark: Landmark

  public var body: some View {
    ZStack(alignment: .bottomLeading) {
      Rectangle().fill(gradient)
      VStack(alignment: .leading) {
        Text(landmark.name)
          .font(.title)
          .bold()
        Text(landmark.park)
      }
      .padding()
    }
    .foregroundColor(.white)
  }
}

// MARK: - Computed Property
extension TextOverlay {

  private var gradient: LinearGradient {
    LinearGradient(
      gradient: Gradient(
        colors: [
          Color.black.opacity(0.6),
          Color.black.opacity(0)
        ]
      ),
      startPoint: .bottom,
      endPoint: .center
    )
  }

}

public struct TextOverlay_Previews: PreviewProvider {
  public static var previews: some View {
    TextOverlay(landmark: ModelData().landmarks[0])
  }
}
