//
//  Landmark.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/7/17.
//

import CoreLocation
import Foundation
import SwiftUI

public struct Landmark: Codable, Identifiable, Hashable {

  public let id: Int
  public let category: Category
  public let city: String
  public let description: String
  public let isFeatured: Bool
  public let name: String
  public let park: String
  public let state: String
  public var isFavorite: Bool

  private let coordinates: Coordinates
  private let imageName: String
}

// MARK: - Model
extension Landmark {

  public struct Coordinates: Hashable, Codable {
    public let longitude: Double
    public let latitude: Double
  }

}

// MARK: - Enum
extension Landmark {

  public enum Category: String, CaseIterable, Codable {
    case lakes = "Lakes"
    case rivers = "Rivers"
    case mountains = "Mountains"
  }

}

// MARK: - Computed Properties
extension Landmark {

  public var image: Image {
    Image(imageName)
  }

  public var featureImage: Image? {
    isFeatured ? Image(imageName + "_feature"): nil
  }

  public var locationCoordinate: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
  }

}
