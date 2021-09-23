//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/9/22.
//

import SwiftUI

public struct ProfileSummary: View {

  @EnvironmentObject private var modelData: ModelData
  public var profile: Profile

  public var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 10) {
        Text(profile.username)
          .bold()
          .font(.title)

        Text("Notifications: \(profile.prefersNotifications ? "On": "Off")")
        Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
        Text("Gold Date: ") + Text(profile.goalDate, style: .date)

        Divider()

        VStack(alignment: .leading) {
          Text("Completed Badges")
            .font(.headline)

          ScrollView(.horizontal) {
            HStack {
              HikeBadge(name: "First Hike")
              HikeBadge(name: "Earth Day")
                .hueRotation(Angle(degrees: 90))
              HikeBadge(name: "Tenth Hike")
                .grayscale(0.5)
                .hueRotation(Angle(degrees: 45))
            }
            .padding(.bottom)
          }
        }

        Divider()

        VStack(alignment: .leading) {
          Text("Recent Hikes")
            .font(.headline)

          HikeView(hike: modelData.hikes[0])
        }
      }
    }
  }
}

public struct ProfileSummary_Previews: PreviewProvider {
  public static var previews: some View {
    ProfileSummary(profile: .default)
      .environmentObject(ModelData())
  }
}
