//
//  HexagonParameters.swift
//  Landmarks
//
//  Created by Retso Huang on 2021/7/25.
//

import CoreGraphics

public struct HexagonParameters {

  public struct Segment {
    public let line: CGPoint
    public let curve: CGPoint
    public let control: CGPoint
  }

  public static let adjustment: CGFloat = 0.085

  public static let segments = [
    Segment(
      line:    CGPoint(x: 0.60, y: 0.05),
      curve:   CGPoint(x: 0.40, y: 0.05),
      control: CGPoint(x: 0.50, y: 0.00)
    ),
    Segment(
      line:    CGPoint(x: 0.05, y: 0.20 + adjustment),
      curve:   CGPoint(x: 0.00, y: 0.30 + adjustment),
      control: CGPoint(x: 0.00, y: 0.25 + adjustment)
    ),
    Segment(
      line:    CGPoint(x: 0.00, y: 0.70 - adjustment),
      curve:   CGPoint(x: 0.05, y: 0.80 - adjustment),
      control: CGPoint(x: 0.00, y: 0.75 - adjustment)
    ),
    Segment(
      line:    CGPoint(x: 0.40, y: 0.95),
      curve:   CGPoint(x: 0.60, y: 0.95),
      control: CGPoint(x: 0.50, y: 1.00)
    ),
    Segment(
      line:    CGPoint(x: 0.95, y: 0.80 - adjustment),
      curve:   CGPoint(x: 1.00, y: 0.70 - adjustment),
      control: CGPoint(x: 1.00, y: 0.75 - adjustment)
    ),
    Segment(
      line:    CGPoint(x: 1.00, y: 0.30 + adjustment),
      curve:   CGPoint(x: 0.95, y: 0.20 + adjustment),
      control: CGPoint(x: 1.00, y: 0.25 + adjustment)
    )
  ]

}
