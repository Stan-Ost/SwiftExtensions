import Foundation
import UIKit

public extension UIImage {
    
    func tintedImageWithColor(_ color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: self.size.height)
        context?.scaleBy(x: 1, y: -1)
        context?.clip(to: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height), mask: self.cgImage!)
        context?.setFillColor(color.cgColor)
        context?.fill(CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        return image!
    }
    
    static func imageWithColor(_ fillColor: UIColor) -> UIImage {
        let size = CGSize(width: 1, height: 32)
        let renderer = UIGraphicsImageRenderer(size: size)
        let image = renderer.image { context in
            fillColor.setFill()
            context.fill(CGRect(origin: .zero, size: size))
        }
        return image
    }
    
    func rotate(radians: Float) -> UIImage {
        var newSize = CGRect(origin: CGPoint.zero, size: self.size).applying(CGAffineTransform(rotationAngle: CGFloat(radians))).size
        // Trim off the extremely small float value to prevent core graphics from rounding it up
        newSize.width = floor(newSize.width)
        newSize.height = floor(newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, self.scale)
        let context = UIGraphicsGetCurrentContext()!
        
        // Move origin to middle
        context.translateBy(x: newSize.width / 2, y: newSize.height / 2)
        // Rotate around middle
        context.rotate(by: CGFloat(radians))
        // Draw the image at its center
        self.draw(in: CGRect(
            x: -self.size.width / 2,
            y: -self.size.height / 2,
            width: self.size.width,
            height: self.size.height)
        )
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage ?? UIImage()
    }
    
    static func imageFromPDF(url: URL) -> UIImage? {
        let image = PDFImage(url: url)
        return image?.withRenderingMode(.alwaysTemplate)
    }
    
    static func PDFImage(url: URL) -> UIImage? {
        guard let document = CGPDFDocument(url as CFURL),
            let page = document.page(at: 1)
            else { return nil }
        
        let pageRect = page.getBoxRect(.mediaBox)
        let renderer = UIGraphicsImageRenderer(size: pageRect.size)
        return renderer.image { context in
            UIColor.clear.set()
            context.fill(pageRect)

            context.cgContext.translateBy(x: 0.0, y: pageRect.size.height)
            context.cgContext.scaleBy(x: 1.0, y: -1.0)

            context.cgContext.drawPDFPage(page)
        }
    }
}
