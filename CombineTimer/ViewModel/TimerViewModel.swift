//
//  TimerViewModel.swift
//  CombineTimer
//
//  Created by 山田隼也 on 2020/08/20.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import Foundation
import Combine

protocol TimerViewModelInput {
    /// 一時停止のボタンが押された時に呼ばれる.
    func tappedPauseButton()

    /// リセットのボタンが押された時に呼ばれる.
    func tappedResetButton()

    /// タイマー開始のボタンが押された時に呼ばれる.
    func tappedStartButton()
}

protocol TimerViewModelOutput {
    var currentSecondsPublisher: AnyPublisher<String?, Never> { get }
}

protocol TimerViewModelType {
    var input: TimerViewModelInput { get }
    var output: TimerViewModelOutput { get }
}

final class TimerViewModel: TimerViewModelType, TimerViewModelInput, TimerViewModelOutput {

    // MARK: Dependency

    private let model: TimerModelProtocol

    // MARK: I/O

    var input: TimerViewModelInput { self }
    var output: TimerViewModelOutput { self }

    // MARK: Initializer

    init(model: TimerModelProtocol = TimerModel()) {
        self.model = model
        self.currentSecondsPublisher = model.countPublisher
            .map { String(format: "%02i:%02i", $0 / 60 % 60, $0 % 60) }
            .eraseToAnyPublisher()
    }

    // MARK: Input

    func tappedPauseButton() {
        model.pauseTimer()
    }

    func tappedResetButton() {
        model.resetTimer()
    }

    func tappedStartButton() {
        model.startTimer()
    }

    // MARK: Output

    var currentSecondsPublisher: AnyPublisher<String?, Never>
}
