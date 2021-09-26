//
//  PageViewController.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/9/26.
//

import SwiftUI
import UIKit

public struct PageViewController<Page: View>: UIViewControllerRepresentable {

  public var pages: [Page]

  public func makeUIViewController(context: Context) -> UIPageViewController {
    let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    return pageViewController
  }

  public func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
    uiViewController
      .setViewControllers([UIHostingController(rootView: pages[0])], direction: .forward, animated: true)
  }

}
