//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/7/18.
//

import SwiftUI

public struct LandmarkList: View {
  public let landmarks: [Landmark]

  public init(landmarks: [Landmark]) {
    self.landmarks = landmarks

    let defaultNavigationBarAppearance = UINavigationBarAppearance()
    defaultNavigationBarAppearance.configureWithOpaqueBackground()

    UINavigationBar.appearance().standardAppearance = defaultNavigationBarAppearance
  }

  public var body: some View {
    NavigationView {
      List(landmarks) { landmark in
        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
          LandmarkRow(landmark: landmark)
        }
      }
      .navigationBarTitle("Landmarks", displayMode: .inline)
    }
  }
}

// MARK: - Preview
public struct LandmarkList_Previews: PreviewProvider {
  public static var previews: some View {
    ForEach(["iPhone SE (2nd generation)", "iPhone 12"], id: \.self) { deviceName in
      LandmarkList(landmarks: landmarks)
        .previewDevice(PreviewDevice(rawValue: deviceName))
        .previewDisplayName(deviceName)
    }
  }
}
