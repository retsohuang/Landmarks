//
//  ModelData.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/7/17.
//

import Foundation
import Combine

final class ModelData: ObservableObject {

  @Published public var landmarks: [Landmark] = load("landmarkData.json")
  @Published public var profile = Profile.default
  @Published public var showFavoritesOnly = false
  public var hikes: [Hike] = load("hikeData.json")

}

// MARK: - Computed Properties
extension ModelData {

  public var features: [Landmark] {
    landmarks.filter(\.isFeatured)
  }

  public var categories: [String: [Landmark]] {
    Dictionary(grouping: landmarks, by: { $0.category.rawValue })
  }

}

func load<T: Decodable>(_ filename: String) -> T {
  let data: Data

  guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
    print("")
    fatalError("Couldn't find \(filename) in main bundle.")
  }

  do {
    data = try Data(contentsOf: file)
  } catch {
    print("")
    fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
  }

  do {
    let decoder = JSONDecoder()
    return try decoder.decode(T.self, from: data)
  } catch {
    print("")
    fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
  }
}
