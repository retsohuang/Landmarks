//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/9/24.
//

import SwiftUI

public struct ProfileEditor: View {
  @Binding public var profile: Profile

  public var body: some View {
    List {
      HStack {
        Text("Username")
          .bold()
        Divider()
        TextField("Username", text: $profile.username)
      }

      Toggle(isOn: $profile.prefersNotifications, label: {
        Text("Enable Notifications")
          .bold()
      })

      VStack(alignment: .leading, spacing: 20) {
        Text("Seasonal Photo")
          .bold()

        Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
          ForEach(Profile.Season.allCases) { season in
            Text(season.rawValue)
              .tag(season)
          }
        }
        .pickerStyle(SegmentedPickerStyle())
      }

      DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
        Text("Goal Date")
          .bold()
      }
    }
  }
}

// MARK: - Computed Properties
extension ProfileEditor {

  private var dateRange: ClosedRange<Date> {
    let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
    let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
    return min...max
  }

}

public struct ProfileEditor_Previews: PreviewProvider {
  public static var previews: some View {
    ProfileEditor(profile: .constant(.default))
  }
}
