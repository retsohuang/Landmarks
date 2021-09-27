//
//  PageViewController.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/9/26.
//

import SwiftUI
import UIKit

public struct PageViewController<Page: View>: UIViewControllerRepresentable {

  @Binding public var currentPage: Int
  public let pages: [Page]

  public func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }

  public func makeUIViewController(context: Context) -> UIPageViewController {
    let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    pageViewController.dataSource = context.coordinator
    pageViewController.delegate = context.coordinator
    return pageViewController
  }

  public func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
    uiViewController
      .setViewControllers([context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
  }

}

extension PageViewController {

  final public class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    public let parent: PageViewController
    public let controllers: [UIViewController]

    public init(_ parent: PageViewController) {
      self.parent = parent
      controllers = parent.pages.map(UIHostingController.init)
    }

    // MARK: - UIPageViewControllerDataSource
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
      guard let index = controllers.firstIndex(of: viewController) else {
        return nil
      }
      if index == 0 {
        return controllers.last
      }
      return controllers[index - 1]
    }

    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
      guard let index = controllers.firstIndex(of: viewController) else {
        return nil
      }
      if index + 1 == controllers.count {
        return controllers.first
      }
      return controllers[index + 1]
    }

    // MARK: - UIPageViewControllerDelegate
    public func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
      if completed,
         let visibleViewController = pageViewController.viewControllers?.first,
         let index = controllers.firstIndex(of: visibleViewController) {
        parent.currentPage = index
      }
    }
  }

}
