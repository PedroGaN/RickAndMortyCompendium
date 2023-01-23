//
//  Extensions.swift
//  RickAndMortyCompendium
//
//  Created by pedro.garcia.local on 23/1/23.
//

import Foundation
import UIKit

// MARK: - String

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
}

// MARK: - UIView

extension UIView {

    public static var identifier: String {
        return String(describing: self)
    }

    public static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    public func setCorners(corners: CACornerMask? = nil,
                           radius: CGFloat? = nil) {

        if let corners = corners {
            layer.maskedCorners = corners
        }

        if let radius = radius {
            layer.cornerRadius = radius
        } else {
            layer.cornerRadius = layer.frame.height / 2
        }
    }

    public func setBorder(borderColor: UIColor, borderWidth: CGFloat = 1.0) {
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
    }
    
    public enum ConstraintType {
        case container
        case center
    }
    
    public func addSubview(childView: UIView, constraintType: ConstraintType = .container) {
        addSubview(childView)
        childView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = constraintType == .container ? Utils.getContainerConstraints(item: childView, toItem: self)
                                                       : Utils.getCenterConstraints(item: childView, toItem: self)
        addConstraints(constraints)
    }
    
    public func toggleVisibility() {
        isHidden = !isHidden
    }

}

// MARK: - UIViewController

extension UIViewController {
    
    public static var identifier: String {
        return String(describing: self)
    }

}

// MARK: - UINavigationController

extension UINavigationController {

    func pushRootViewController(animated: Bool) {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }

        window.rootViewController = self

        if animated {
            UIView.transition(with: window,
                              duration: 0.3,
                              options: .transitionCrossDissolve,
                              animations: nil,
                              completion: nil)
        }
    }

}

// MARK: - UIButton

extension UIButton {
    
    public func disable() {
        alpha = 0.7
        isEnabled = false
    }
    
    public func enable() {
        alpha = 1
        isEnabled = true
    }
    
    
    func setTitle(string: String, size: CGFloat = 12, uppercased: Bool = false, fontColor: UIColor = .nero) {
        let font = Utils.getApplicationFont(withSize: size)
        let attributedTitleNormal = NSMutableAttributedString(string: uppercased ? string.uppercased() : string,
                                                              attributes: [.font: font,
                                                                           .foregroundColor: fontColor])
        setAttributedTitle(attributedTitleNormal, for: .normal)
    }
    
}

// MARK: - Optional

extension Optional {
    
    func isNil() -> Bool {
        return self == nil
    }
    
}

// MARK: - UITextfield

extension UITextField {
    
    func getText() -> String? {
        if let text = text,
           !text.isEmpty {
            return text
        } else {
            return nil
        }
    }
    
}
