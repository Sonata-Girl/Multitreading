//
//  Task2.swift
//  Multitreading
//
//  Created by Sonata Girl on 19.03.2024.
//

import UIKit

final class Task1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        Thread.detachNewThread {
            print(Thread.current)
            for _ in (0..<10) {
                let currentThread = Thread.current
                print("1, Current thread: \(currentThread)")
            }
        }


        for _ in (0..<10) {
            let currentThread = Thread.current
            print("2, Current thread: \(currentThread)")
        }
    }

    /// Только первый цикл перевести в другой поток с помощью Thread.detachNewThread и обяснить почему изменился вывод.
    /// Вывод изменился, потому что мы первый цикл перевели в другой поток и они отрабатывают параллельно.

}
