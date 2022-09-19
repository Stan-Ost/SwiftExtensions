import UIKit

public extension NSDirectionalEdgeInsets {
    var horizontal: CGFloat {
        get {
            leading + trailing
        }
        set {
            leading = newValue
            trailing = newValue
        }
    }

    var vertical: CGFloat {
        get {
            top + bottom
        }
        set {
            top = newValue
            bottom = newValue
        }
    }

    init(value: CGFloat) {
        self.init(top: value, leading: value, bottom: value, trailing: value)
    }
}
