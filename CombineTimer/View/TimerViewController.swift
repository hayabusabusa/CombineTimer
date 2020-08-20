//
//  TimerViewController.swift
//  CombineTimer
//
//  Created by 山田隼也 on 2020/08/06.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import UIKit

final class TimerViewController: UIViewController {

    // MARK: IBOutlet

    // MARK: Properties

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
    }
}

extension TimerViewController {

    private func configureNavigation() {
        navigationItem.title = "タイマー"
        navigationItem.titleView = UIImageView(image: Asset.imgTitle.image)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: Asset.icList.image, style: .plain, target: self, action: nil)
    }
}
