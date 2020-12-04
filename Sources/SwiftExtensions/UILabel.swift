import UIKit

public extension UILabel {
    @discardableResult
    func format(font: UIFont, color: UIColor) -> UILabel {
        self.font = font
        textColor = color
        return self
    }
    
    @discardableResult
    func wrap() -> UILabel {
        numberOfLines = 0
        lineBreakMode = .byWordWrapping
        return self
    }
    
    @discardableResult
    func requirePriority(along axis: NSLayoutConstraint.Axis) -> UILabel {
        setContentCompressionResistancePriority(.required, for: axis)
        setContentHuggingPriority(.required, for: axis)
        return self
    }
    
    @discardableResult
    func align(_ alignment: NSTextAlignment) -> UILabel {
        textAlignment = alignment
        return self
    }
    
    func formatWithAttributes(
        text: String,
        font: UIFont,
        color: UIColor,
        alignment: NSTextAlignment = .center,
        lineSpacing: CGFloat? = nil
    ) {
        let paragraphStyle = NSMutableParagraphStyle()
        if let lineSpacing = lineSpacing {
            paragraphStyle.lineSpacing = lineSpacing
        }

        paragraphStyle.alignment = alignment
        
        let attrString = NSMutableAttributedString(string: text)
        
        let atributes = [
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: color
        ]
        
        attrString.addAttributes(atributes, range: NSRange(location: 0, length: attrString.length))
        self.attributedText = attrString
    }
}
