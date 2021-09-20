//
//  ContentView.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/7/16.
//

import SwiftUI

public struct ContentView: View {
  @State public var selection: Tab = .featured

  public var body: some View {
    TabView(selection: $selection) {
      CategoryHome()
        .tabItem {
          if #available(iOS 14.0, *) {
            Label("Featured", systemImage: "star")
          } else {
            Image(systemName: "star")
            Text("Featured")
          }
        }
        .tag(Tab.featured)

      LandmarkList()
        .tabItem {
          if #available(iOS 14.0, *) {
            Label("List", systemImage: "list.bullet")
          } else {
            Image(systemName: "list.bullet")
            Text("List")
          }
        }
        .tag(Tab.list)
    }
  }

}

// MARK: - Enum
extension ContentView {

  public enum Tab {
    case featured
    case list
  }

}

// MARK: - Preview
public struct ContentView_Previews: PreviewProvider {
  public static var previews: some View {
    ContentView()
      .environmentObject(ModelData())
  }
}
