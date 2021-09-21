//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/9/12.
//

import SwiftUI

public struct CategoryHome: View {

  @EnvironmentObject private var modelData: ModelData
  @State private var showingProfile = false

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
      .listStyle(InsetListStyle())
      .navigationBarTitle("Featured")
      .toolbar {
        Button(action: { showingProfile.toggle() }, label: {
          Image(systemName: "person.crop.circle")
            .accessibilityLabel("User Profile")
        })
      }
      .sheet(isPresented: $showingProfile) {
        ProfileHost()
          .environmentObject(modelData)
      }
    }
  }

}

public struct CategoryHome_Previews: PreviewProvider {

  public static var previews: some View {
    CategoryHome()
      .environmentObject(ModelData())
  }

}
