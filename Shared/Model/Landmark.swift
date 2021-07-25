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
  public let name: String
  public let category: String
  public let city: String
  public let state: String
  public let isFeatured: Bool
  public var isFavorite: Bool
  public let park: String
  public let description: String

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

// MARK: - Computed Properties
extension Landmark {

  public var image: Image {
    Image(imageName)
  }

  public var locationCoordinate: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
  }

}
