//
//  ViewMakers+Extensions.swift
//  GoPizza
//
//  Created by Rafael Rocha on 09/01/23.
//

import Foundation
import UIKit

extension UILabel {
    static func label(text: String? = nil,
                      font: UIFont = .systemFont(ofSize: 32, weight: .regular),
                      textColor: UIColor? = UIColor.white,
                      numberOflines: Int = 1,
                      textAlignment: NSTextAlignment = .left,
                      lineBreakMode: NSLineBreakMode = .byTruncatingTail,
                      accessibilityIdentifier: String? = nil) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = textColor
        label.numberOfLines = numberOflines
        label.textAlignment = textAlignment
        label.lineBreakMode = lineBreakMode
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = accessibilityIdentifier
        return label
    }
}

extension UIButton {
    static func button(type: ButtonType = .system,
                       title: String? = nil,
                       backgroundColor: UIColor? = nil,
                       titleColor: UIColor?,
                       titleFont: UIFont = .systemFont(ofSize: 14, weight: .medium),
                       cornerRadius: CGFloat? = 12,
                       borderWidth: CGFloat = 0,
                       borderColor: CGColor? = nil,
                       accessibilityIdentifier: String? = nil) -> UIButton {
        let button = UIButton(type: type)
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = titleFont
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.backgroundColor = backgroundColor
        button.accessibilityIdentifier = accessibilityIdentifier
        if let cornerRadius = cornerRadius {
            button.layer.cornerRadius = cornerRadius
            button.clipsToBounds = true
        }
        button.layer.borderWidth = borderWidth
        if let borderColor = borderColor {
            button.layer.borderColor = borderColor
        }
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}

extension UIImageView {
    static func imageView(image: UIImage? = nil,
                          contentMode: UIView.ContentMode = .scaleAspectFit,
                          backgroundColor: UIColor? = nil,
                          tintColor: UIColor? = nil,
                          accessibilityIdentifier: String? = nil) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = contentMode
        imageView.accessibilityIdentifier = accessibilityIdentifier
        if let backgroundColor = backgroundColor {
            imageView.backgroundColor = backgroundColor
        }
        if let tintColor = tintColor {
            imageView.tintColor = tintColor
        }
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
}

extension UIStackView {
    static func stack(axis: NSLayoutConstraint.Axis,
                      spacing: CGFloat = 16,
                      distribution: UIStackView.Distribution = .fill,
                      alignment: UIStackView.Alignment = .fill,
                      contentMode: UIStackView.ContentMode = .scaleToFill,
                      accessibilityIdentifier: String? = nil) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.alignment = alignment
        stackView.contentMode = contentMode
        stackView.distribution = distribution
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.accessibilityIdentifier = accessibilityIdentifier
        return stackView
    }
}

extension UITextField {
    static func textField(keybordType: UIKeyboardType,
                          textPlaceHolder: String,
                          colorPlaceHolder: UIColor = .white,
                          textColor: UIColor = .white,
                          font: UIFont = .systemFont(ofSize: 14, weight: .regular),
                          borderColor: CGColor?,
                          leftViewMode: ViewMode = .always,
                          leftView: UIView = .init(frame: CGRect(x: 0, y: 0, width: 20, height: 0)),
                          cornerRadius: CGFloat = 12,
                          borderWidth: CGFloat = 1,
                          autocorrectionType: UITextAutocorrectionType = .no,
                          autocapitalizationType: UITextAutocapitalizationType = .none,
                          accessibilityIdentifier: String? = nil) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = keybordType
        textField.attributedPlaceholder = NSAttributedString(string: textPlaceHolder, attributes: [NSAttributedString.Key.foregroundColor: colorPlaceHolder])
        textField.textColor = textColor
        textField.font = font
        textField.layer.borderColor = borderColor
        textField.leftViewMode = leftViewMode
        textField.leftView = leftView
        textField.layer.cornerRadius = cornerRadius
        textField.layer.borderWidth = borderWidth
        textField.autocorrectionType = autocorrectionType
        textField.autocapitalizationType = autocapitalizationType
        textField.accessibilityIdentifier = accessibilityIdentifier
        return textField
    }
}

extension UITableView {
    static func uiTableView(frame: CGRect = .zero,
                            style: UITableView.Style = .plain,
                            backgroundColor: UIColor,
                            accessibilityIdentifier: String) -> UITableView {
        let tableView = UITableView(frame: frame, style: style)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = backgroundColor
        tableView.accessibilityIdentifier = accessibilityIdentifier
        return tableView
    }
}

extension UIView {
    public func addSubviews(_ subView: UIView...) {
        subView.forEach(addSubview)
    }
}
