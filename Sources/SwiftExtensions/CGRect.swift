import Foundation

public extension CGRect {
    static func rectWithRadius(_ radius: CGFloat, center: CGPoint) -> Self {
        .init(
            x: center.x - radius,
            y: center.y - radius,
            width: radius * 2,
            height: radius * 2
        )
    }
}
