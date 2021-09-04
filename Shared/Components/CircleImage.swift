//
//  CircleImage.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/7/16.
//

import SwiftUI

public struct CircleImage: View {
  public let image: Image

  public var body: some View {
    image
      .clipShape(Circle())
      .overlay(Circle().stroke(Color.white, lineWidth: 4))
      .shadow(radius: 7)
  }
}

// MARK: - Preview
public struct CircleImage_Previews: PreviewProvider {
  public static var previews: some View {
    CircleImage(image: Image("turtlerock"))
  }
}
