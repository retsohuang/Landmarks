//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/9/12.
//

import SwiftUI

public struct CategoryHome: View {

  @EnvironmentObject private var modelData: ModelData

  public var body: some View {
    NavigationView {
      List {
        modelData.features[0].image
          .resizable()
          .scaledToFill()
          .frame(height: 200)
          .clipped()
          .listRowInsets(EdgeInsets())

        ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
          CategoryRow(categoryName: key, items: modelData.categories[key]!)
        }
        .listRowInsets(EdgeInsets())
      }
      .navigationBarTitle("Featured")
    }
  }

}

public struct CategoryHome_Previews: PreviewProvider {

  public static var previews: some View {
    CategoryHome()
      .environmentObject(ModelData())
  }

}
