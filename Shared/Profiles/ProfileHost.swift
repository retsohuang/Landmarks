//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/9/22.
//

import SwiftUI

public struct ProfileHost: View {
  @Environment(\.editMode) private var editMode
  @EnvironmentObject private var modelData: ModelData
  @State private var draftProfile = Profile.default

  public var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      HStack {
        if editMode?.wrappedValue == .active {
          Button("Cancel") {
            draftProfile = modelData.profile
            editMode?.animation().wrappedValue = .inactive
          }
        }
        Spacer()
        EditButton()
      }

      if editMode?.wrappedValue == .inactive {
        ProfileSummary(profile: modelData.profile)
      } else {
        ProfileEditor(profile: $draftProfile)
          .onAppear {
            draftProfile = modelData.profile
          }
          .onDisappear {
            modelData.profile = draftProfile
          }
      }

    }
    .padding()
  }
}

public struct ProfileHost_Previews: PreviewProvider {
  public static var previews: some View {
    ProfileHost()
      .environmentObject(ModelData())
  }
}
