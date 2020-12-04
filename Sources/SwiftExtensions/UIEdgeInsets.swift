import UIKit

public extension UIEdgeInsets {
    init(all: CGFloat) {
        self.init(top: all, left: all, bottom: all, right: all)
    }
    
    init(horizontal: CGFloat = 0, vertical: CGFloat = 0) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
    
    init(bottom: CGFloat) {
        self.init(top: 0, left: 0, bottom: bottom, right: 0)
    }
}
