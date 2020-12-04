import Foundation

public extension String {
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    var trimmingTrailingSpaces: String? {
        let result = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return result.isEmpty ? nil : result.trimmingTrailingSpaces
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    var oneLiner: String {
        return replacingOccurrences(of: "\n", with: " ")
    }
    
    func slice(from: String, to: String) -> String? {
        
        return (range(of: from)?.upperBound).flatMap { substringFrom in
            (range(of: to, range: substringFrom..<endIndex)?.lowerBound).map { substringTo in
                String(self[substringFrom..<substringTo])
            }
        }
    }
}
