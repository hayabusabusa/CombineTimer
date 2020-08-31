//
//  Button.swift
//  CombineTimer
//
//  Created by 山田隼也 on 2020/08/06.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import UIKit

class Button: UIButton {

    // MARK: IBInspectable

    @IBInspectable var cornerRadius: CGFloat = 0
    @IBInspectable var borderColor: UIColor = .clear
    @IBInspectable var borderWidth: CGFloat = 0
    @IBInspectable var shadowRadius: CGFloat = 0
    @IBInspectable var shadowColor: UIColor = .clear
    @IBInspectable var shadowOffset: CGSize = .zero
    @IBInspectable var shadowOpacity: Float = 0

    // MARK: Overrides

    override var isEnabled: Bool {
        didSet {
            alpha = isEnabled ? 1 : 0.4
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonInit()

        if let title = title(for: state) {
            setAttributedTitle(NSAttributedString(string: title,
                                                  attributes: [NSAttributedString.Key(String(kCTLanguageAttributeName)): "ja"]),
                               for: .normal)
        }
    }

    private func commonInit() {
        isExclusiveTouch = true
        layer.masksToBounds = true
        layer.cornerRadius = cornerRadius
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
    }
}
