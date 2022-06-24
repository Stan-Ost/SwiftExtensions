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
    public func unique() -> [Element] {
        var uniqueValues: [Element] = .init()
        for element in self {
            if !uniqueValues.contains(element) {
                uniqueValues.append(element)
            }
        }
        return uniqueValues
    }
}
