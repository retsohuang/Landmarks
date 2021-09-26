//
//  PageView\.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/9/26.
//

import SwiftUI

public struct PageView<Page: View>: View {
  public let pages: [Page]

  public var body: some View {
    PageViewController(pages: pages)
  }
}

public struct PageView_Previews: PreviewProvider {
  public static var previews: some View {
    PageView(
      pages: ModelData().features.map(FeatureCard.init)
    )
    .aspectRatio(3 / 2, contentMode: .fit)
  }
}
