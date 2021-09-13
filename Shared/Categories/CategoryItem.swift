//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/9/13.
//

import SwiftUI

public struct CategoryItem: View {
  public let landmark: Landmark

  public var body: some View {
    VStack(alignment: .leading) {
      landmark.image
        .resizable()
        .frame(width: 155, height: 155)
        .cornerRadius(5)
      Text(landmark.name)
        .font(.caption)
    }
    .padding(.leading, 15)
  }
}

public struct CategoryItem_Previews: PreviewProvider {
  public static var previews: some View {
    CategoryItem(landmark: ModelData().landmarks[0])
  }
}
