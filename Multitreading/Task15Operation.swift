//
//  Task15.swift
//  Multitreading
//
//  Created by Sonata Girl on 22.03.2024.
//

import UIKit

protocol RMOperationProtocol {
    // Приоритеты
    var priority: DispatchQoS.QoSClass { get }
    // Выполняемый блок
    var completionBlock: (() -> Void)? { get }
    // Завершена ли операция
    var isFinished: Bool { get }
    // Завершена ли операция
    var isExecuting: Bool { get }
    // Метод для запуска операции
    func start()
}

final class RMOperation: RMOperationProtocol {
    var priority: DispatchQoS.QoSClass = .default
    var completionBlock: (() -> Void)?
    var isFinished: Bool = false
    var isExecuting: Bool = false

    /// В методе start. реализуйте все через глобальную паралельную очередь с приоритетами.
    func start() {
        let queue = DispatchQueue.global(qos: priority)
        isExecuting = true
        queue.async {
            self.completionBlock?()
        }
        isExecuting = false
        isFinished = true
    }
}

final class Task15Operation: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let operationFirst = Operation()
        let operationSecond = Operation()

//        operationFirst.priority = .userInitiated
        operationFirst.completionBlock = {
            for _ in 0..<50 {
                print(2)
            }
            print(Thread.current)
            print("Операция полностью завершена!")
        }

        operationFirst.start()

//        operationSecond.priority = .background
        operationSecond.completionBlock = {
            for _ in 0..<50 {
                print(2)
            }
            print(Thread.current)
            print("Операция полностью завершена!")
        }

        operationSecond.start()
    }

}
