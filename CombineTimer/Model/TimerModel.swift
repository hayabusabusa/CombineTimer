//
//  TimerModel.swift
//  CombineTimer
//
//  Created by 山田隼也 on 2020/08/20.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import Foundation
import Combine

protocol TimerModelProtocol {
    // NOTE: `@Published` は protocol 内で使えないので、AnyPublisher として公開.
    var countPublisher: AnyPublisher<Int, Never> { get }
    func pauseTimer()
    func resetTimer()
    func startTimer()
}

final class TimerModel: TimerModelProtocol {

    // MARK: Properties

    private let countSubject: CurrentValueSubject<Int, Never>
    private let isValidSubject: PassthroughSubject<Bool, Never>
    private var cancelables: [AnyCancellable] = []

    // MARK: I/O

    var countPublisher: AnyPublisher<Int, Never>

    // MARK: Initializer

    init() {
        // NOTE: プロパティの初期化.
        let countSubject = CurrentValueSubject<Int, Never>(0)
        self.countSubject = countSubject
        self.countPublisher = countSubject.eraseToAnyPublisher()

        let isValidSubject = PassthroughSubject<Bool, Never>()
        self.isValidSubject = isValidSubject

        // NOTE: `FlatMapLatest` で最新の Publisher に切り替え.
        let isValidSubscriber = isValidSubject
            .flatMapLatest { isValid -> AnyPublisher<Date, Never> in
                isValid ? Timer.publish(every: 1.0, on: .main, in: .default).autoconnect().eraseToAnyPublisher() : Empty<Date, Never>(completeImmediately: true).eraseToAnyPublisher()
            }.sink { _ in
                countSubject.send(countSubject.value + 1)
            }

        // NOTE: `sink()` した Publisher を全て格納
        cancelables += [isValidSubscriber]
    }

    func pauseTimer() {
        isValidSubject.send(false)
    }

    func resetTimer() {
        countSubject.send(0)
    }

    func startTimer() {
        isValidSubject.send(true)
    }
}
