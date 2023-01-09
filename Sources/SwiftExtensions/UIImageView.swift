import Foundation
import UIKit

public extension UIImageView {
    func setSystemImage(name: String, font: UIFont, colors: [UIColor]) {
        if #available(iOS 15.0, *) {
            let config = UIImage
                .SymbolConfiguration(paletteColors: colors)
                .applying(UIImage.SymbolConfiguration(font: font))
            
            let image = UIImage(systemName: name, withConfiguration: config)
            self.image = image
        } else {
            let config = UIImage.SymbolConfiguration(font: font)
            self.tintColor = colors.first
            let image = UIImage(systemName: name, withConfiguration: config)
            self.image = image
        }
        self.contentMode = .scaleAspectFit
    }
}
