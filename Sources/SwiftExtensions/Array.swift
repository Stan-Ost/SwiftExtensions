import UIKit

public extension Array where Element: BinaryInteger {

    /// The average value of all the items in the array
    var average: Double {
        if self.isEmpty {
            return 0.0
        } else {
            let sum = self.reduce(0, +)
            return Double(sum) / Double(self.count)
        }
    }

}

public extension Array where Element: BinaryFloatingPoint {

    /// The average value of all the items in the array
    var average: Double {
        if self.isEmpty {
            return 0.0
        } else {
            let sum = self.reduce(0, +)
            return Double(sum) / Double(self.count)
        }
    }

}

public extension Array {
     subscript(safe index: Int) -> Element? {
        guard indices.contains(index) else {
            return nil
            }
        return self[index]
     }
}

public extension Array where Element: Hashable {
    // Returns a copy of the array where all values are unique. Preserves order of the original.
    /// e.g. [‘a’, ‘b’, ‘a’, ‘c’].unique() == [‘a’, ‘b’, ‘c’]
    func unique() -> [Element] {
        var uniqueValues: [Element] = .init()
        for element in self {
            if !uniqueValues.contains(element) {
                uniqueValues.append(element)
            }
        }
        return uniqueValues
    }
}

public extension Array where Element: UIViewPropertyAnimator {
    
    var isReversed: Bool {
        set {
            forEach { $0.isReversed = newValue }
        }
        get {
            assertionFailure("The getter is not supported!")
            return false
        }
    }
    
    var fractionComplete: CGFloat {
        set {
            forEach { $0.fractionComplete = newValue }
        }
        get {
            assertionFailure("The getter is not supported!")
            return 0
        }
    }
    
    func startAnimations() {
        forEach { $0.startAnimation() }
    }
    
    func pauseAnimations() {
        forEach { $0.pauseAnimation() }
    }
    
    func continueAnimations(withTimingParameters parameters: UITimingCurveProvider? = nil, durationFactor: CGFloat = 0) {
        forEach { $0.continueAnimation(withTimingParameters: parameters, durationFactor: durationFactor) }
    }
    
    func reverse() {
        forEach { $0.isReversed = !$0.isReversed }
    }
    
    mutating func remove(_ element: Element) {
        self = self.filter { $0 != element }
    }
}
