//
//  Task5.swift
//  Multitreading
//
//  Created by Sonata Girl on 19.03.2024.
//

import UIKit
/// Задача на синхронизацию очередей
final class Task5: UIViewController {

    // MARK: Private Properties

    private var name = "Введите имя"
    private let lock = DispatchQueue(label: "name.lock.queue")

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        updateName()
    }

    // так происходит потому что мы перевели исполнение на глобал очередь,а так как она пустая она отрабатывает сразу
//    func updateName() {
//        DispatchQueue.global().async {
//            self.name = "I love RM"
//            print(Thread.current)
//            print(self.name)
//        }
//        print(Thread.current)
//        print(self.name) // из main
//    }

    // это происходит потому что self. имеет привязку к главному потоку. Потому что это часть кода внутри контроллера который был создан и работает на главном потоке
//    func updateName() {
//        DispatchQueue.global().sync {
//            self.name = "I love RM"
//            print(Thread.current)
//            print(self.name)
//        }
//        print(Thread.current)
//        print(self.name) // из main
//    }
    // MARK: Private Methods

    private func updateName() {
        DispatchQueue.global().async {
            self.lock.async {
                self.name = "I love RM"
                print(Thread.current)
                print(self.name)
            }
        }

        lock.async {
            print(Thread.current)
            print(self.name) // из main
        }
    }
}
