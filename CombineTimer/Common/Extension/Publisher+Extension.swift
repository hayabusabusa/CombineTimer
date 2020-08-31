//
//  Publisher+Extension.swift
//  CombineTimer
//
//  Created by 山田隼也 on 2020/08/21.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import Combine

extension Publisher {

    /*
    `flatMapLatest` from https://gist.github.com/marty-suzuki/bee4d447def7770244a079dcf9b38601#file-flatmaplatestincombine-swift
     */
    func flatMapLatest<T: Publisher>(_ transform: @escaping (Output) -> T) -> Publishers.SwitchToLatest<T, Publishers.Map<Self, T>> where T.Failure == Failure {
        map(transform).switchToLatest()
    }
}
