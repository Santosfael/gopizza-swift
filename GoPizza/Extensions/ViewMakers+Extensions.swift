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
                      isHidden: Bool = false,
                      lineBreakMode: NSLineBreakMode = .byTruncatingTail,
                      accessibilityIdentifier: String? = nil) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = textColor
        label.numberOfLines = numberOflines
        label.textAlignment = textAlignment
        label.isHidden = isHidden
        label.lineBreakMode = lineBreakMode
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = isHidden
        label.accessibilityIdentifier = accessibilityIdentifier
        return label
    }
}

extension UIButton {
    static func button(type: ButtonType = .system,
                       title: String? = nil,
                       backgroundColor: UIColor? = nil,
                       titleColor: UIColor? = nil,
                       titleFont: UIFont = .systemFont(ofSize: 14, weight: .medium),
                       cornerRadius: CGFloat? = 12,
                       borderWidth: CGFloat = 0,
                       borderColor: CGColor? = nil,
                       isEnabled: Bool = true,
                       alpha: CGFloat = 1,
                       accessibilityIdentifier: String? = nil,
                       image: UIImage? = nil,
                       imageColor: UIColor? = nil) -> UIButton {
        let button = UIButton(type: type)
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = titleFont
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.backgroundColor = backgroundColor
        button.accessibilityIdentifier = accessibilityIdentifier
        button.setImage(image, for: .normal)
        button.isEnabled = isEnabled
        button.alpha = alpha
        if let imageColor = imageColor {
            button.setImageTintColorButton(imageColor)
        }
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

    public func alignItensVertical(spacing: CGFloat = 12) {
        guard let imageSize = self.imageView?.image?.size,
            let text = self.titleLabel?.text,
            let font = self.titleLabel?.font
            else { return }
        self.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: -imageSize.width, bottom: -(imageSize.height + spacing), right: 0.0)
        let labelString = NSString(string: text)
        let titleSize = labelString.size(withAttributes: [kCTFontAttributeName as NSAttributedString.Key: font])
        self.imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0.0, bottom: 0.0, right: -titleSize.width)
        self.contentEdgeInsets = UIEdgeInsets(top: 14, left: 12, bottom: 16, right: 0.0)
    }

    public func setImageTintColorButton(_ color: UIColor) {
        let tintedImage = self.imageView?.image?.withRenderingMode(.alwaysTemplate)
        self.setImage(tintedImage, for: .normal)
        self.tintColor = color
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
                      backgroundColor: UIColor? = .clear,
                      isHidden: Bool = false,
                      accessibilityIdentifier: String? = nil) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.alignment = alignment
        stackView.contentMode = contentMode
        stackView.backgroundColor = backgroundColor
        stackView.distribution = distribution
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isHidden = isHidden
        stackView.accessibilityIdentifier = accessibilityIdentifier
        return stackView
    }
}

extension UITextField {
    static func textField(keybordType: UIKeyboardType,
                          textPlaceHolder: String,
                          colorPlaceHolder: UIColor = .white,
                          textColor: UIColor? = .white,
                          font: UIFont = .systemFont(ofSize: 14, weight: .regular),
                          borderColor: CGColor?,
                          leftViewMode: ViewMode = .always,
                          leftView: UIView? = .init(frame: CGRect(x: 0, y: 0, width: 20, height: 0)),
                          cornerRadius: CGFloat = 12,
                          borderWidth: CGFloat = 1,
                          autocorrectionType: UITextAutocorrectionType? = .no,
                          autocapitalizationType: UITextAutocapitalizationType = .none,
                          secureTextField: Bool = false,
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
        if let autocorrectionType = autocorrectionType {
            textField.autocorrectionType = autocorrectionType
        }
        textField.autocapitalizationType = autocapitalizationType
        textField.accessibilityIdentifier = accessibilityIdentifier
        textField.isSecureTextEntry = secureTextField
        return textField
    }
}

extension UITableView {
    static func uiTableView(frame: CGRect = .zero,
                            style: UITableView.Style = .plain,
                            backgroundColor: UIColor,
                            isHidden: Bool = false,
                            accessibilityIdentifier: String) -> UITableView {
        let tableView = UITableView(frame: frame, style: style)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = backgroundColor
        tableView.accessibilityIdentifier = accessibilityIdentifier
        tableView.isHidden = isHidden
        return tableView
    }
}

extension CAGradientLayer {
    static func linearGradient(topColor: UIColor?,
                               bottomColor: UIColor?,
                               type: CAGradientLayerType = .axial,
                               bounds: CGRect) -> CALayer {
        guard let topColor = topColor,
              let bottomColor = bottomColor
        else { return CALayer() }
        let gradientLayer = CAGradientLayer()
        gradientLayer.type = type
        gradientLayer.frame = bounds
        gradientLayer.colors = [
            topColor.cgColor,
            bottomColor.cgColor
        ]
        
        return gradientLayer
    }
}

extension UISearchBar {
    static func searchBar(placeholder: String,
                          autocapitalizationType: UITextAutocapitalizationType = .none,
                          searchTextFieldBackgroundColor: UIColor,
                          borderColor: UIColor? = nil,
                          cornerRadius: CGFloat,
                          clipsToBounds: Bool,
                          borderWidth: CGFloat? = nil,
                          accessibilityIdentifier: String) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = placeholder
        searchBar.autocapitalizationType = autocapitalizationType
        searchBar.searchTextField.backgroundColor = searchTextFieldBackgroundColor
        searchBar.layer.borderColor = borderColor?.cgColor
        searchBar.layer.cornerRadius = cornerRadius
        if let borderWidth = borderWidth {
            searchBar.layer.borderWidth = borderWidth
        }
        searchBar.clipsToBounds = clipsToBounds
        searchBar.accessibilityIdentifier = accessibilityIdentifier
        return searchBar
    }
}

extension UIView {
    public func addSubviews(_ subView: UIView...) {
        subView.forEach(addSubview)
    }
}

extension UIActivityIndicatorView {
    static func activityIndicator(style: UIActivityIndicatorView.Style,
                                  hidesWhenStopped: Bool,
                                  isHidden: Bool,
                                  backgroundColor: UIColor?,
                                  clipsToBounds: Bool,
                                  cornerRadius: CGFloat = 12,
                                  color: UIColor?,
                                  accessibilityIdentifier: String) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: style)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = hidesWhenStopped
        indicator.isHidden = isHidden
        indicator.backgroundColor = backgroundColor
        indicator.clipsToBounds = clipsToBounds
        indicator.layer.cornerRadius = cornerRadius
        indicator.color = color
        indicator.accessibilityIdentifier = accessibilityIdentifier
        return indicator
    }
}
