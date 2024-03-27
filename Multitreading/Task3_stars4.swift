//
//  Task3_stars4.swift
//  Multitreading
//
//  Created by Sonata Girl on 24.03.2024.
//

import UIKit

final class Task3_stars4: UIViewController {
    // Семафор блокирует потоки,и возникает проблема инверсии приоритетов
    // Пример из жизни приходишь в парк на качелях покачаться,а там детей много и каждые успевают быстрее тебя,потому что не знают что такое вежливость)))))) и в итоге ты уйдешь не покачавшись,ну потому что это дети
    override func viewDidLoad() {
        super.viewDidLoad ()
        print("start")
        view.backgroundColor = .cyan
        let highPriority = DispatchQueue.global(qos: .userInitiated)
        let lowPriority = DispatchQueue.global(qos: .utility)
        let semaphore = DispatchSemaphore(value: 1)
        lowPriority.async {
            print("Ждем выполнения низкоприоретной задачи")
            semaphore.wait()
            print( "Низкоприоретная задача начала выполнение")
            Thread.sleep(forTimeInterval: 10) // Эмуляция затратной операции
            semaphore.signal()
            print("Низкоприоретная задача выполнена")
        }
        sleep(1)
        highPriority.async {
            print("Ждем выполнения высокоприоретентной задачи")
            semaphore.wait()
            semaphore.signal()
            print("Высокоприоретентная задача выполнена")
        }
    }
}
