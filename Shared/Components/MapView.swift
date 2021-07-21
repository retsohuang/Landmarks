//
//  MapView.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/7/16.
//

import SwiftUI
import MapKit

public struct MapView: View {
  public let coordinate: CLLocationCoordinate2D

  @State private var region = MKCoordinateRegion()

  public var body: some View {
    Map(coordinateRegion: $region)
      .onAppear {
        setRegion(coordinate)
      }
  }

  private func setRegion(_ coordinate: CLLocationCoordinate2D) {
    region = MKCoordinateRegion(
      center: coordinate,
      span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
  }

}

// MARK: - Preview
public struct MapView_Previews: PreviewProvider {
  public static var previews: some View {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
  }
}

