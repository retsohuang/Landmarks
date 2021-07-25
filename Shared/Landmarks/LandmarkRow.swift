//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/7/18.
//

import SBPAsyncImage
import SwiftUI

public struct LandmarkRow: View {

  let landmark: Landmark

  public var body: some View {
    HStack {
      landmark.image.resizable()
        .frame(width: 50, height: 50)

      Text(landmark.name)

      Spacer()

      if landmark.isFavorite {
        Image(systemName: "star.fill")
          .foregroundColor(.yellow)
      }
    }
  }

}

// MARK: - Preview
public struct LandmarkRow_Previews: PreviewProvider {
  public static var landmarks = ModelData().landmarks

  public static var previews: some View {
    Group {
      LandmarkRow(landmark: landmarks[0])
      LandmarkRow(landmark: landmarks[1])
    }
    .previewLayout(.sizeThatFits)
  }
}
