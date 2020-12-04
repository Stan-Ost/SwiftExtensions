import Foundation
import UIKit

public enum DeviceType: String {
    case iPad = "iPad"
    case iPhone5 = "iPhone 5, 5s, or SE"
    case iPhone8 = "iPhone 6, 6s, 7, or 8"
    case iPhone8plus = "iPhone 6+, 6s+, 7+ or 8+"
    case iPhoneX = "iPhone X, iPhone XR, or iPhone 11 Pro"
    case iPhoneXSMax = "iPhone XS Max, or 11 Pro MAX"
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
                return .iPhone8
            case 640, 736:
                return .iPhone8plus
            case 812:
                return .iPhoneX
            case 896:
                return .iPhoneXSMax
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
