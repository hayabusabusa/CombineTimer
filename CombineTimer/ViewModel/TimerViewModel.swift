//
//  TimerViewModel.swift
//  CombineTimer
//
//  Created by 山田隼也 on 2020/08/20.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import Foundation

protocol TimerViewModelInput {
    /// 一時停止のボタンが押された時に呼ばれる.
    func tappedPauseButton()

    /// リセットのボタンが押された時に呼ばれる.
    func tappedResetButton()

    /// タイマー開始のボタンが押された時に呼ばれる.
    func tappedStartButton()
}

protocol TimerViewModelOutput {
    var isTimerValid: Bool { get }
    var currentSeconds: Int { get }
}

protocol TimerViewModelType {
    var input: TimerViewModelInput { get }
    var output: TimerViewModelOutput { get }
}

final class TimerViewModel: TimerViewModelType, TimerViewModelInput, TimerViewModelOutput {

    // MARK: I/O

    var input: TimerViewModelInput { self }
    var output: TimerViewModelOutput { self }

    // MARK: Initializer

    init() {
        isTimerValid = false
        currentSeconds = 0
    }

    // MARK: Input

    func tappedPauseButton() {
        print(#function)
    }

    func tappedResetButton() {
        print(#function)
    }

    func tappedStartButton() {
        print(#function)
    }

    // MARK: Output

    var isTimerValid: Bool
    var currentSeconds: Int
}
