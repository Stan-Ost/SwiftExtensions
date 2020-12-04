import UIKit

// swiftlint:disable identifier_name
public extension UIColor {
    
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
    
    convenience init(hexString: String) {
        let r, g, b: CGFloat

        let hexColor = String(hexString[hexString.startIndex...])

        if hexColor.count == 6 {
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0

            if scanner.scanHexInt64(&hexNumber) {
                let mask = 0x000000FF
                r = CGFloat(Int(hexNumber >> 16) & mask) / 255
                g = CGFloat(Int(hexNumber >> 8) & mask) / 255
                b = CGFloat(Int(hexNumber) & mask) / 255

                self.init(red: r, green: g, blue: b, alpha: 1)
                return
            }
        }

        self.init(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func isEqualToColor(_ color: UIColor) -> Bool {
        var red1: CGFloat = 0, green1: CGFloat = 0, blue1: CGFloat = 0, alpha1: CGFloat = 0
        getRed(&red1, green: &green1, blue: &blue1, alpha: &alpha1)

        var red2: CGFloat = 0, green2: CGFloat = 0, blue2: CGFloat = 0, alpha2: CGFloat = 0
        color.getRed(&red2, green: &green2, blue: &blue2, alpha: &alpha2)

        return red1 == red2 && green1 == green2 && blue1 == blue2 && alpha1 == alpha2
    }
}
