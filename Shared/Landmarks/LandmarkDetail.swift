//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/7/18.
//

import SwiftUI

public struct LandmarkDetail: View {
  public let landmark: Landmark

  public var body: some View {

    ScrollView {
      MapView(coordinate: landmark.locationCoordinate)
        .edgesIgnoringSafeArea(.top)
        .frame(height: 300)

      CircleImage(image: landmark.image)
        .offset(y: -130)
        .padding(.bottom, -130)

      VStack(alignment: .leading) {
        Text(landmark.name)
          .font(.title)

        HStack(spacing: 0) {
          Text(landmark.park)
          Spacer()
          Text(landmark.state)
        }
        .font(.subheadline)
        .foregroundColor(.secondary)

        Divider()

        Text("About \(landmark.name)")
          .font(.title)
        Text(landmark.description)

      }
      .padding()
    }
    .navigationBarTitle(Text(landmark.name), displayMode: .inline)

  }
}

// MARK: - Preview
public struct LandmarkDetail_Previews: PreviewProvider {
  public static var previews: some View {
    LandmarkDetail(landmark: landmarks[0])
  }
}

