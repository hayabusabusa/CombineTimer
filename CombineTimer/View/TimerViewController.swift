//
//  TimerViewController.swift
//  CombineTimer
//
//  Created by 山田隼也 on 2020/08/06.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import UIKit
import Combine

final class TimerViewController: UIViewController {

    // MARK: IBOutlet

    @IBOutlet private weak var secondsLabel: UILabel!

    // MARK: Properties

    private var viewModel: TimerViewModelType!
    private var cancelables = Set<AnyCancellable>()

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        bindViewModel()
    }

    // MARK: IBAction

    @IBAction private func onTapResetButton(_ sender: UIButton) {
        viewModel.input.tappedResetButton()
    }

    @IBAction private func onTapStartButton(_ sender: UIButton) {
        viewModel.input.tappedStartButton()
    }

    @IBAction private func onTapPauseButton(_ sender: UIButton) {
        viewModel.input.tappedPauseButton()
    }
}

// MARK: - Configurations

extension TimerViewController {

    private func configureNavigation() {
        navigationItem.title = "タイマー"
        navigationItem.titleView = UIImageView(image: Asset.imgTitle.image)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: Asset.icList.image, style: .plain, target: self, action: nil)
    }
}

// MARK: - ViewModel

extension TimerViewController {

    private func bindViewModel() {
        let viewModel = TimerViewModel()
        self.viewModel = viewModel

        viewModel.currentSecondsPublisher
            .assign(to: \.text, on: secondsLabel)
            .store(in: &cancelables)
    }
}
