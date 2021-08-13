//
//  Hike.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/8/13.
//

import Foundation

public struct Hike: Codable, Hashable, Identifiable {

  public let id: Int
  public let name: String
  public let distance: Double
  public let difficulty: Int
  public let observations: [Observation]

}

// MARK: - Embedded Model
extension Hike {

  public struct Observation: Codable, Hashable {

    public let distanceFromStart: Double
    public let elevation: Range<Double>
    public let pace: Range<Double>
    public let heartRate: Range<Double>

  }

}

// MARK: - Computed Properties
extension Hike {

  public static var formatter = LengthFormatter()

  public var distanceText: String {
    Self.formatter.string(fromValue: distance, unit: .kilometer)
  }

}
