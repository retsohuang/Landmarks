//
//  CocoaMap.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/7/17.
//

import SwiftUI
import MapKit

@available(iOS, introduced: 13.0, deprecated: 14.0, renamed: "SwiftUI.Map")
@available(macOS, introduced: 10.15, deprecated: 11.0, renamed: "SwiftUI.Map")
@available(tvOS, introduced: 13.0, deprecated: 14.0, renamed: "SwiftUI.Map")
@available(watchOS, introduced: 6.0, deprecated: 7.0, renamed: "SwiftUI.Map")
public typealias Map = CocoaMap

@available(iOS, introduced: 13.0, deprecated: 14.0, renamed: "SwiftUI.Map")
@available(macOS, introduced: 10.15, deprecated: 11.0, renamed: "SwiftUI.Map")
@available(tvOS, introduced: 13.0, deprecated: 14.0, renamed: "SwiftUI.Map")
@available(watchOS, introduced: 6.0, deprecated: 7.0, renamed: "SwiftUI.Map")
public struct CocoaMap: UIViewRepresentable {

  public typealias UIViewType = MKMapView

  @Binding var coordinateRegion: MKCoordinateRegion

  // MARK: - UIViewRepresentable
  public func makeUIView(context: UIViewRepresentableContext<CocoaMap>) -> MKMapView {
    let mapView = MKMapView()
    mapView.delegate = context.coordinator
    return mapView
  }

  public func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<CocoaMap>) {
    uiView.setRegion(coordinateRegion, animated: true)
  }

  public func makeCoordinator() -> Coordinator {
    CocoaMap.Coordinator(self)
  }

}

extension CocoaMap {

  final public class Coordinator: NSObject, MKMapViewDelegate {
    private let map: CocoaMap

    // MARK: - Initializer
    public init(_ map: CocoaMap) {
      self.map = map
    }

    // MARK: - MKMapViewDelegate
    public func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
      self.map.coordinateRegion = mapView.region
    }
  }

}
