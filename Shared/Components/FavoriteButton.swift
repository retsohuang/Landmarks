//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/7/24.
//

import SwiftUI

public struct FavoriteButton: View {
  @Binding public var isSet: Bool

  public var body: some View {
    Button(action: {
      isSet.toggle()
    }, label: {
      Image(systemName: isSet ? "star.fill": "star")
        .foregroundColor(isSet ? .yellow: .gray)
    })
  }
}

// MARK: - Preview
struct FavoriteButton_Previews: PreviewProvider {
  static var previews: some View {
    FavoriteButton(isSet: .constant(true))
      .previewLayout(.sizeThatFits)
  }
}

