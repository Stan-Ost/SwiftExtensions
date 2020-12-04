import Foundation

public extension Double {
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1
        if let string = formatter.string(from: NSNumber(value: Darwin.round(self * divisor) / divisor)), let number = formatter.number(from: string) {
            return Double(truncating: number)
        } else {
            return self
        }
    }
    
    var zeroWhenNegative: Double {
        self < 0 ? 0 : self
    }
}
