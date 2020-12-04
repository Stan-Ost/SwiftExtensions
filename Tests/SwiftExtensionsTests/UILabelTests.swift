@testable import SwiftExtensions
import XCTest

final class UILabelTests: XCTestCase {

    func test_wrap_setsCorrectProperties() {
        let label = UILabel().wrap()
                
        XCTAssertEqual(label.numberOfLines, 0)
        XCTAssertEqual(label.lineBreakMode, .byWordWrapping)
    }
    
    func test_format_setsCorrectFontAndColor() {
        let label = UILabel().format(font: UIFont.systemFont(ofSize: 12), color: .blue)
        
        XCTAssertEqual(label.textColor, .blue)
        XCTAssertEqual(label.font, UIFont.systemFont(ofSize: 12))
    }
    
    func test_requirePriority_setsCorrectPriority() {
        let label = UILabel().requirePriority(along: .vertical)
        
        XCTAssertEqual(label.contentHuggingPriority(for: .vertical), .required)
        XCTAssertEqual(label.contentCompressionResistancePriority(for: .vertical), .required)
    }
    
    func test_align_setsCorrectAlingment() {
        let label = UILabel().align(.center)
        
        XCTAssertEqual(label.textAlignment, .center)
    }
    
    func test_formatWithAttributes_setsCorrectAttributedString() {
        let label = UILabel()
        label.formatWithAttributes(text: "Hello!", font: UIFont.systemFont(ofSize: 12), color: .blue, alignment: .left, lineSpacing: 12)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        paragraphStyle.lineSpacing = 12
        let attrString = NSMutableAttributedString(string: "Hello!")
        
        let atributes = [
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12),
            NSAttributedString.Key.foregroundColor: UIColor.blue
        ]
        
        attrString.addAttributes(atributes, range: NSRange(location: 0, length: attrString.length))
        
        XCTAssertEqual(attrString, label.attributedText)
    }
}
