import UIKit
public extension UIRectCorner {
    var cornerMask: CACornerMask {
        var corners: CACornerMask = []
        if contains(.allCorners) {
            corners = [
                .layerMaxXMinYCorner,
                .layerMaxXMaxYCorner,
                .layerMinXMinYCorner,
                .layerMinXMaxYCorner
            ]
        } else {
            if contains(.topLeft) {
                corners.insert(.layerMinXMinYCorner)
            }
            if contains(.topRight) {
                corners.insert(.layerMaxXMinYCorner)
            }
            if contains(.bottomLeft) {
                corners.insert(.layerMinXMaxYCorner)
            }
            if contains(.bottomRight) {
                corners.insert(.layerMaxXMaxYCorner)
            }
        }
        return corners
    }
}
