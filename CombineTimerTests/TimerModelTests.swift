//
//  TimerModelTests.swift
//  CombineTimerTests
//
//  Created by 山田隼也 on 2020/08/31.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import XCTest
@testable import CombineTimer

class TimerModelTests: XCTestCase {
    
    private var model: TimerModel!

    override func setUp() {
        super.setUp()
        // NOTE: 毎回タイマーを初期化
        model = TimerModel(interval: 0.1)
    }
    
    func test_タイマーの開始が正しく行えることを確認() {
        XCTContext.runActivity(named: "タイマー開始1秒後に正しい値が流れていることを確認") { _ in
            let expectValues = [0, 1]
            let result = expectValue(of: model.countPublisher, equals: expectValues)
            model.startTimer()
            wait(for: [result.expectation], timeout: 0.1)
        }
    }
    
    func test_タイマーの停止が正しく行えることを確認() {
        XCTContext.runActivity(named: "タイマー開始後即停止させて、1秒後に値が流れないことを確認") { _ in
            let expectValues = [0]
            let result = expectValue(of: model.countPublisher, equals: expectValues)
            model.startTimer()
            model.pauseTimer()
            wait(for: [result.expectation], timeout: 0.1)
        }
    }
    
    func test_タイマーのリセットが正しく行えることを確認() {
        XCTContext.runActivity(named: "リセットの動作時に0の値が流れることを確認") { _ in
            let expectValues = [0, 0]
            let result = expectValue(of: model.countPublisher, equals: expectValues)
            model.resetTimer()
            wait(for: [result.expectation], timeout: 0)
        }
    }
    
    func test_CountSubjectの動作が正しいことを確認() {
        XCTContext.runActivity(named: "初期値0が流れていることを確認") { _ in
            let expectValues = [0]
            let result = expectValue(of: model.countPublisher, equals: expectValues)
            wait(for: [result.expectation], timeout: 0)
        }
        
        XCTContext.runActivity(named: "タイマー開始2秒後までに値が正しく流れていることを確認") { _ in
            let expectValues = [0, 1, 2]
            let result = expectValue(of: model.countPublisher, equals: expectValues)
            model.startTimer()
            wait(for: [result.expectation], timeout: 0.2)
        }
    }
}
