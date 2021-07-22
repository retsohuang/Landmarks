//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/7/18.
//

import SwiftUI

public struct LandmarkList: View {

  public let landmarks: [Landmark]
  @State private var showFavoritesOnly = true

  // MARK: - Initializer
  public init(landmarks: [Landmark]) {
    self.landmarks = landmarks

    let defaultNavigationBarAppearance = UINavigationBarAppearance()
    defaultNavigationBarAppearance.configureWithOpaqueBackground()

    UINavigationBar.appearance().standardAppearance = defaultNavigationBarAppearance
  }

  public var body: some View {
    NavigationView {
      List(filteredLandmarks) { landmark in
        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
          LandmarkRow(landmark: landmark)
        }
      }
      .navigationBarTitle("Landmarks", displayMode: .inline)
    }
  }
}

// MARK: - Computed Properties
extension LandmarkList {

  private var filteredLandmarks: [Landmark] {
    landmarks.filter { landmark in
      (!showFavoritesOnly || landmark.isFavorite)
    }
  }

}

// MARK: - Preview
public struct LandmarkList_Previews: PreviewProvider {
  public static var previews: some View {
    LandmarkList(landmarks: landmarks)
  }
}
