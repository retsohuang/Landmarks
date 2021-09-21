//
//  Profile.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/9/22.
//

import Foundation

public struct Profile {
  public var goalDate = Date()
  public var prefersNotifications = true
  public var sessionalPhoto = Session.winter
  public var username: String

  public static let `default` = Profile(username: "g_kumar")

  public enum Session: String, CaseIterable, Identifiable {
    case spring = "🌷"
    case summer = "🌞"
    case autumn = "🍂"
    case winter = "☃️"

    public var id: String {
      rawValue
    }
  }
}
