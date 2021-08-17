//  Created by Ky Nguyen

import UIKit
struct Messenger {
    /**
     Create a UIAlertController. Skip cancelActionName to have an OK button by default. Enter your button title string. Pass a nil to receive an empty UIAlertController
     - Parameter `message`: String?
     - Parameter `title`: String?
     - Parameter `cancelActionName`: String?
     */
    static func getMessage(_ message: String?, title: String?,
                           cancelActionName: String? = "OK") -> UIAlertController {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if cancelActionName != nil {
            controller.addAction(UIAlertAction(title: cancelActionName, style: .destructive, handler: nil))
        }
        return controller
    }
}

extension UIScreen {
    static var topSpace: CGFloat {
        let window = UIApplication.shared.windows.first
        return window?.safeAreaInsets.top ?? 0
    }
    
    static var bottomSpace: CGFloat {
        let window = UIApplication.shared.windows.first
        return window?.safeAreaInsets.bottom ?? 0
    }
}


