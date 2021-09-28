//
//  PageControl.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/9/28.
//

import SwiftUI
import UIKit

public struct PageControl: UIViewRepresentable {
  @Binding public var currentPage: Int
  public var numberOfPages: Int

  public func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }

  public func makeUIView(context: Context) -> UIPageControl {
    let control = UIPageControl()
    control.numberOfPages = numberOfPages
    control.addTarget(
      context.coordinator,
      action: #selector(Coordinator.updateCurrentPage(sender:)),
      for: .valueChanged
    )
    return control
  }

  public func updateUIView(_ uiView: UIPageControl, context: Context) {
    uiView.currentPage = currentPage
  }
}

extension PageControl {

  final public class Coordinator: NSObject {
    public let control: PageControl

    public init(_ control: PageControl) {
      self.control = control
    }

    @objc
    public func updateCurrentPage(sender: UIPageControl) {
      control.currentPage = sender.currentPage
    }
  }

}


public struct PageControl_Previews: PreviewProvider {
  public static var previews: some View {
    PageControl(currentPage: .constant(1), numberOfPages: 3)
      .background(Color.black)
      .previewLayout(.sizeThatFits)
  }
}
