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
    static let secondaryBg = UIColor(hex: "#2f394d")!
    static let buttonBg = UIColor(hex: "#4da3d4")!
    static let color999999 = UIColor(hex: "#999999")!
}
