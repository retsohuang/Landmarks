//
//  ContentView.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/7/16.
//

import Introspect
import SwiftUI

public struct ContentView: View {

  public var body: some View {
    LandmarkList()
  }

}

// MARK: - Preview
public struct ContentView_Previews: PreviewProvider {
  public static var previews: some View {
    ContentView().environmentObject(ModelData())
  }
}
