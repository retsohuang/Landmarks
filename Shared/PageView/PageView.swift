//
//  PageView\.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/9/26.
//

import SwiftUI

public struct PageView<Page: View>: View {
  @State private var currentPage = 0
  public let pages: [Page]

  public var body: some View {
    ZStack(alignment: .bottomTrailing) {
      PageViewController(currentPage: $currentPage, pages: pages)
      PageControl(currentPage: $currentPage, numberOfPages: pages.count)
        .frame(width: CGFloat(pages.count * 18))
        .padding(.trailing)
        .padding(.bottom, 5)
    }
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
