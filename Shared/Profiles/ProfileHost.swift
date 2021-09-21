//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/9/22.
//

import SwiftUI

public struct ProfileHost: View {
  @State private var draftProfile = Profile.default

  public var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      ProfileSummary(profile: draftProfile)
    }
    .padding()
  }
}

public struct ProfileHost_Previews: PreviewProvider {
  public static var previews: some View {
    ProfileHost()
  }
}
