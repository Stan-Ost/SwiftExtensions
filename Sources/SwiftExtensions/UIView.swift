
import Foundation
import UIKit

public extension UIView {
    
    var screenshot: UIImage {
        
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image ?? UIImage()
    }

    func animatePulse(scale: CGFloat, duration: TimeInterval, halfwayCompletion: (() -> Void)?, completion: (() -> Void)?) {
        UIView.animate(withDuration: duration,
                       animations: {
                        self.transform = CGAffineTransform(scaleX: scale, y: scale)
            }, completion: { (finish) in
                halfwayCompletion?()
                if finish {
                    UIView.animate(withDuration: 0.2,
                                   animations: {
                                    self.transform = CGAffineTransform.identity
                        }, completion: {( finish: Bool) in
                            completion?()
                        })
                }
        })
    }
    
    func pushTransition(_ duration: CFTimeInterval, from: CATransitionSubtype, delegate: CAAnimationDelegate) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(
            name: CAMediaTimingFunctionName.easeInEaseOut
        )
        animation.type = CATransitionType.push
        animation.subtype = from
        animation.duration = duration
        animation.delegate = delegate
        layer.add(animation, forKey: CATransitionType.push.rawValue)
    }

    func addBottomBorder(_ color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.borderColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: width)
        border.borderWidth = width
        self.layer.addSublayer(border)
    }
    
    func roundCorners(_ corners: RoundCorners) {
        layer.cornerRadius = corners.radius
        clipsToBounds = true
        
        switch corners {
        case .all:
            break
        case .bottom:
            layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        case .top:
            layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        }
    }
    
    enum RoundCorners {
        case all(CGFloat)
        case bottom(CGFloat)
        case top(CGFloat)
        
        var radius: CGFloat {
            switch self {
            case let .all(radius):
                return radius
            case let .top(radius):
                return radius
            case let .bottom(radius):
                return radius
            }
        }
    }
}
