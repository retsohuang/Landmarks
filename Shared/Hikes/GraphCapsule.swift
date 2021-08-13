/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 A single line in the graph.
 */

import SwiftUI

public struct GraphCapsule: View {
  
  public let index: Int
  public let height: CGFloat
  public let range: Range<Double>
  public let overallRange: Range<Double>
  
  public var body: some View {
    Capsule()
      .fill(Color.white)
      .frame(height: height * heightRatio)
      .offset(x: 0, y: height * -offsetRatio)
  }
}

// MARK: - Computed Properties
extension GraphCapsule {

  public var heightRatio: CGFloat {
    max(CGFloat(magnitude(of: range) / magnitude(of: overallRange)), 0.15)
  }

  public var offsetRatio: CGFloat {
    CGFloat((range.lowerBound - overallRange.lowerBound) / magnitude(of: overallRange))
  }

}

// MARK: - Previews
struct GraphCapsule_Previews: PreviewProvider {
  static var previews: some View {
    // The graph that uses the capsule tints it by multiplying against its
    // base color of white. Emulate that behavior here in the preview.
    GraphCapsule(index: 0, height: 150, range: 10..<50, overallRange: 0..<100)
      .colorMultiply(.blue)
  }
}
