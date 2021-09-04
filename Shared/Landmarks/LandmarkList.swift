//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/7/18.
//

import SwiftUI

public struct LandmarkList: View {
  @EnvironmentObject private var modelData: ModelData

  @State private var price = 0.0

  private let numberFormatter: NumberFormatter = {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .currency
    numberFormatter.minimumFractionDigits = 0
    numberFormatter.maximumFractionDigits = 2
    return numberFormatter
  }()

  public var body: some View {
    TextField("Price", value: $price, formatter: numberFormatter)
      .disableAutocorrection(true)
      .border(Color(UIColor.separator))
    Text(price.debugDescription)
  }

//  public var body: some View {
//    NavigationView {
//      List {
//        Toggle(isOn: $modelData.showFavoritesOnly, label: {
//          Text("Favorites only")
//        })
//
//        ForEach(filteredLandmarks) { landmark in
//          NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
//            LandmarkRow(landmark: landmark)
//          }
//        }
//      }
//      .navigationBarTitle("Landmarks", displayMode: .inline)
//    }
//  }
}

// MARK: - Computed Properties
extension LandmarkList {

  private var filteredLandmarks: [Landmark] {
    modelData.landmarks.filter { landmark in
      (!modelData.showFavoritesOnly || landmark.isFavorite)
    }
  }

}

// MARK: - Preview
public struct LandmarkList_Previews: PreviewProvider {
  public static var previews: some View {
    LandmarkList()
      .environmentObject(ModelData())
  }
}
