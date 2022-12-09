import Foundation
import UIKit

public enum DeviceType: String {
    case iPad = "iPad"
    case iPhone5 = "iPhone 5, 5s, or SE"
    case iPhoneSE = "iPhone SE"
    case iPhone11 = "iPhone 11"
    case iPhone12 = "iPhone 12, 12 Pro"
    case iPhone12ProMax = "iPhone 12 Pro Max"
    case iPhone11Pro = "iPhone 11 Pro"
    case iPhone11ProMax = "iPhone 11 Pro Max"
    case iPhone12Mini = "iPhone 12 Mini"
    case iPhone8plus = "iPhone 6+, 6s+, 7+ or 8+"
    case iPhone14Pro = "iPhone 14 Pro"
    case iPhone14ProMax = "iPhone 14 Pro Max"
    case unknown = "unknown device"
}

public extension UIDevice {
    
    class var type: DeviceType {
        if current.userInterfaceIdiom == UIUserInterfaceIdiom.pad {
            return .iPad
        } else {
            switch height() {
            case 568:
                return .iPhone5
            case 667:
                return .iPhoneSE
            case 812:
                return .iPhone11Pro
            case 844:
                return .iPhone12
            case 896:
                return .iPhone11
            case 640, 736:
                return .iPhone8plus
            case 926:
                return .iPhone12ProMax
            case 780:
                return .iPhone12Mini
            case 852:
                return .iPhone14Pro
            case 932:
                return
            default:
                return .unknown
            }
        }
    }
    
    class func isRealDevice() -> Bool {
        return !self.isSimulator()
    }
    
    class func isSimulator() -> Bool {
        #if TARGET_IPHONE_SIMULATOR
        return true
        #else
        return false
        #endif
    }
    
    class func orientation() -> UIDeviceOrientation {
        return current.orientation
    }
    
    class func height() -> CGFloat {
        return UIScreen.main.nativeBounds.height / UIScreen.main.scale
    }
    
    class func printDevice() {
        print(type.rawValue)
    }
}
