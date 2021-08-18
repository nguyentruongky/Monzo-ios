//  Created by Ky Nguyen

import UIKit

extension UIFont {
    enum KNWeight: String {
        case semiBold = "SFProText-Black"
        case bold = "SFProText-Bold"
        case medium = "SFProText-SemiBold"
        case regular = "SFProText-Regular"
    }
    
    static func main(_ weight: KNWeight = .regular, size: CGFloat = 15) -> UIFont {
        return font(weight.rawValue, size: size)
    }
    
    static func font(_ name: String, size: CGFloat) -> UIFont {
        guard let font = UIFont(name: name, size: size) else {
            return UIFont.boldSystemFont(ofSize: size)
        }
        return font
    }
}

extension UIColor {
    static let bg = UIColor(hex: "#17233b")!
    static let secondaryBg = UIColor(r: 47, g: 57, b: 77)
    static let buttonBg = UIColor(hex: "#4da3d4")!
    static let color999999 = UIColor(hex: "#999999")!
    static let color_35_46_65 = UIColor(r: 35, g: 46, b: 65)
    static let color_58_68_86 = UIColor(r: 58, g: 68, b: 68)
    static let color_88_192_85 = UIColor(r: 88, g: 192, b: 85)
    static let color_198_205_208 = UIColor(r: 198, g: 205, b: 208)
}
