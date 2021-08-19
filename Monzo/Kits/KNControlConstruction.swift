//  Created by Ky Nguye

import UIKit

extension UIButton {
    convenience init(image: UIImage?) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
        setImage(image, for: .normal)
    }
    
    convenience init(imageName: String) {
        let image = UIImage(named: imageName)
        self.init(image: image)
        translatesAutoresizingMaskIntoConstraints = false
        setImage(image, for: .normal)
    }
    
    convenience init(title: String?,
                     titleColor: UIColor? = .black,
                     font: UIFont? = nil,
                     background: UIColor? = .clear,
                     cornerRadius: CGFloat = 0,
                     borderWidth: CGFloat = 0,
                     borderColor: UIColor = .clear) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(title, for: .normal)
        
        setTitleColor(titleColor, for: .normal)
        setTitleColor(titleColor?.withAlphaComponent(0.4), for: .disabled)
        if let bg = background {
            setBackground(color: bg, forState: .normal)
            setBackground(color: bg.withAlphaComponent(0.5), forState: .disabled)
        }
        
        titleLabel?.font = font
        setCorner(radius: cornerRadius)
        setBorder(width: borderWidth, color: borderColor)
    }
    
    convenience init(mainButtonWithTitle title: String,
                     bgColor: UIColor = UIColor.gray,
                     titleColor: UIColor? = UIColor.white,
                     font: UIFont? = UIFont.main(.bold, size: 18), height buttonHeight: CGFloat? = nil) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(title, for: .normal)
        titleLabel?.font = font
        setTitleColor(titleColor, for: .normal)
        setTitleColor(UIColor.white.alpha(0.5), for: .disabled)
        setBackground(color: bgColor, forState: .normal)
        setBackground(color: bgColor.alpha(0.5), forState: .disabled)
        setCorner(radius: 7)
        if let buttonHeight = buttonHeight {
            height(buttonHeight)
        }
    }
}

extension UILabel {
    convenience init(text: String? = nil,
                     font: UIFont = .systemFont(ofSize: 15),
                     color: UIColor? = .black,
                     numberOfLines: Int = 1,
                     alignment: NSTextAlignment = .left) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
        self.font = font
        textColor = color
        self.text = text
        self.numberOfLines = numberOfLines
        textAlignment = alignment
    }
}

extension UIView {
    convenience init(background: UIColor?){
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = background
    }
}

extension UIImageView {
    convenience init(image: UIImage? = nil,
                     contentMode: UIView.ContentMode = .scaleAspectFit) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = contentMode
        clipsToBounds = true
    }
    convenience init(imageName: String,
                     contentMode: UIView.ContentMode = .scaleAspectFit){
        let image = UIImage(named: imageName)
        self.init(image: image)
        translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = contentMode
    }
    
    
}
extension UITextField {
    convenience init(text: String? = nil,
                     placeholder: String? = nil,
                     font: UIFont = .systemFont(ofSize: 15),
                     color: UIColor = .black,
                     alignment: NSTextAlignment = .left) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
        self.font = font
        textColor = color
        self.text = text
        self.placeholder = placeholder
        textAlignment = alignment
    }
}

extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis = .vertical,
                     distributon: UIStackView.Distribution = .equalSpacing,
                     alignment: UIStackView.Alignment = .center,
                     space: CGFloat = 16) {
        self.init()
        self.axis = axis
        self.distribution = distributon
        self.alignment = alignment
        self.spacing = space
        translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UITableViewCell {
    convenience init(height h: CGFloat = 16, color: UIColor = .lightGray) {
        self.init()
        self.height(h)
        backgroundColor = color
    }
}

extension UIColor {
    
    convenience init(value: CGFloat, a: CGFloat = 1) {
        let c = value / 255
        self.init(red: c, green: c, blue: c, alpha: a)
    }
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1) {
        self.init(red: r / 255, green: g / 255, blue: b / 255, alpha: a)
    }
    
    convenience init?(hex: String, a: CGFloat = 1) {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) { return nil }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: a)
    }
}
