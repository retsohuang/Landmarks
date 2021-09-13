//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/9/13.
//

import SwiftUI

public struct CategoryRow: View {
  public let categoryName: String
  public let items: [Landmark]

  public var body: some View {
    VStack(alignment: .leading) {
      Text(categoryName)
        .font(.headline)
        .padding(.leading, 15)
        .padding(.top, 5)

      ScrollView(.horizontal, showsIndicators: false) {
        HStack(alignment: .top, spacing: 0) {
          ForEach(items) { landmark in
            CategoryItem(landmark: landmark)
          }
        }
      }
      .frame(height: 185)
    }
  }
}

public struct CategoryRow_Previews: PreviewProvider {
  public static var landmarks = ModelData().landmarks

  public static var previews: some View {
    CategoryRow(
      categoryName: landmarks[0].category.rawValue,
      items: Array(landmarks.prefix(4))
    )
  }
}
