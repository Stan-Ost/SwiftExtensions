@testable import SwiftExtensions
import XCTest

final class UIColorTests: XCTestCase {
    
    func test_isEqual_isCorrect() {
        let color1 = UIColor.blue
        let color2 = UIColor.blue
        let color3 = UIColor.green
        
        XCTAssertTrue(color1.isEqualToColor(color2))
        XCTAssertFalse(color1.isEqualToColor(color3))
    }
    
    func test_initWithInt_returnsCorrectColor() {
        let actualColor = UIColor(hex: 0x87d0c9)
        let expectedColor = UIColor(
            red: 0.5294117647058824,
            green: 0.8156862745098039,
            blue: 0.788235294117647,
            alpha: 1
        )
                
        XCTAssertTrue(actualColor.isEqualToColor(expectedColor))
    }
    
    func test_initWithString_returnsCorrectColor() {
        let actualColor = UIColor(hexString: "87d0c9")
        let expectedColor = UIColor(
            red: 0.5294117647058824,
            green: 0.8156862745098039,
            blue: 0.788235294117647,
            alpha: 1
        )
                
        XCTAssertTrue(actualColor.isEqualToColor(expectedColor))
    }
    
    func test_initWithInvalidString_returnsDefaultWhiteColor() {
        let actualColor = UIColor(hexString: "870c9")
                
        XCTAssertTrue(actualColor.isEqualToColor(UIColor.white))
    }
}
