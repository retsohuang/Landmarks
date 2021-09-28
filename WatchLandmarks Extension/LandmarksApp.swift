//
//  LandmarksApp.swift
//  WatchLandmarks Extension
//
//  Created by Retso Huang on 2021/9/29.
//

import SwiftUI

@main
struct LandmarksApp: App {

  @SceneBuilder
  var body: some Scene {
    WindowGroup {
      NavigationView {
        ContentView()
      }
    }

    WKNotificationScene(controller: NotificationController.self, category: "myCategory")
  }
}
