import Foundation

public extension Bundle {
    var appVersion: String {
        return object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }
}

