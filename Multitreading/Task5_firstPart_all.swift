//
//  Task5_1.swift
//  Multitreading
//
//  Created by Sonata Girl on 24.03.2024.
//

import UIKit


final class Task5_firstPart_all: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

//        print(1)
//        1// Распечаталось так потому что мы положили блок выполнения в очередь после выполнения основного блока задач на мейн очереди
//        DispatchQueue.main.async {
//            print(2)
//        }
//        print(3)

//        print(1)
        // ================================================================
//        2 // Ничего особо не изменилось,потому что это аналогичное действие
//        Task {
//            print(2)
//            print(Thread.current)
//        }
//        print(3)
        // ================================================================
//       3// Отличается от таск только тем что мы задаем главный поток явно
//        print(1)
//        Task { @MainActor  in
//            print(2)
//        }
//        print(3)
        // ================================================================
        print("Task 1 is finished")

//       4// Происходит тоже самое , что и в глобал асинк
        Task.detached(priority: .userInitiated) {
            for i in 0..<50 {
                print(i)
            }
            print("Task 2 is finished")
            print(Thread.current)
        }

        print("Task 3 is finished")
    }
}
