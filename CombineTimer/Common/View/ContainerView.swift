//
//  ContainerView.swift
//  CombineTimer
//
//  Created by 山田隼也 on 2020/08/20.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import UIKit

class ContainerView: UIView {

    // MARK: IBInspectable

    @IBInspectable var cornerRadius: CGFloat = 4
    @IBInspectable var borderWidth: CGFloat = 0
    @IBInspectable var borderColor: UIColor = .clear
    @IBInspectable var shadowRadius: CGFloat = 0
    @IBInspectable var shadowColor: UIColor = .clear
    @IBInspectable var shadowOffset: CGSize = .zero
    @IBInspectable var shadowOpacity: Float = 0

    // MARK: Initializer

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
    }

    private func commonInit() {
        isExclusiveTouch = true

        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
    }
}
