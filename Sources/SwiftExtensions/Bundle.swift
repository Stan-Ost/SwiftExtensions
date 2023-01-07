import Foundation

public extension Bundle {
    var appVersion: String {
        return object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }
    
    var displayName: String {
        return object(forInfoDictionaryKey: "CFBundleDisplayName") as! String
    }
}

