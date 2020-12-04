import UIKit

public extension UIFont {

    /// Helper method to create a UIFont with updated attributes applied to the UIFontDescriptor
    ///
    /// - parameter attributes: The new attributes to apply to the fontDescriptor
    ///
    /// - returns: A UIFont object with the new attributes appended to the receivers fontDescriptor
    func addingAttributes(_ attributes: [UIFontDescriptor.AttributeName: Any] = [:]) -> UIFont {

        return UIFont(descriptor: fontDescriptor.addingAttributes(attributes), size: pointSize)
    }

    /// Returns a UIFont object based on the receiver with small caps applied to upper case letters
    var addingUpperCaseSmallCaps: UIFont {

        return addingAttributes([

            UIFontDescriptor.AttributeName.featureSettings: [
                [
                    UIFontDescriptor.FeatureKey.featureIdentifier: kUpperCaseType,
                    UIFontDescriptor.FeatureKey.typeIdentifier: kUpperCaseSmallCapsSelector
                ]
            ]
        ])
    }

    /// Returns a UIFont object based on the receiver with small caps applied to lower case letters
    var addingLowerCaseSmallCaps: UIFont {

        return addingAttributes([

            UIFontDescriptor.AttributeName.featureSettings: [
                [
                    UIFontDescriptor.FeatureKey.featureIdentifier: kLowerCaseType,
                    UIFontDescriptor.FeatureKey.typeIdentifier: kLowerCaseSmallCapsSelector
                ]
            ]
        ])
    }
}
