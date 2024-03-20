//
//  Task4.swift
//  Multitreading
//
//  Created by Sonata Girl on 19.03.2024.
//

import UIKit
/// Задача на работу с приоритетами потоков
final class Task4: UIViewController {

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Создаем поток и запускаем
        let thread1 = ThreadPrintDemon()
        let thread2 = ThreadPrintAngel()

        // 1 приоритеты сначала 1 потом 2
        //        thread1.qualityOfService = .userInteractive
        //        thread2.qualityOfService = .userInitiated

        // 2 приоритеты сначала 2 потом 1
        //        thread1.qualityOfService = .background
        //        thread2.qualityOfService = .userInitiated

        // 3 приоритеты вперемешку
        thread1.qualityOfService = .background
        thread2.qualityOfService = .background

        thread1.start()
        thread2.start()

    }

    final class ThreadPrintDemon: Thread {
        override func main() {
            for _ in 0..<100 {
                print("1")
            }
        }
    }

    final class ThreadPrintAngel: Thread {
        override func main() {
            for _ in 0..<100 {
                print("2")
            }
        }
    }

}
