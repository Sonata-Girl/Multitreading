//
//  Task3_stars2.swift
//  Multitreading
//
//  Created by Sonata Girl on 24.03.2024.
//

import UIKit

final class Task3_stars2: UIViewController {
    private var lock = NSLock()

    lazy var someDate: Date = {
        print(" \n initialization happens only once!")
        startNumber += 1
        return Date()
    }()

    var startNumber: Int = 0 {
        willSet (newNumber) {
            print ("После иницициализации начнем работать с этим значением: \(newNumber)")
        }
        // какая-то логика
        didSet {
            print("Предыдущее значение: \(oldValue)")
            // какая-то логика
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("start")
        view.backgroundColor = .cyan
        DispatchQueue.global().async {
            // Имитация какой-то работы
            sleep(1)
            self.lock.lock()
            let _ = self.someDate
            self.lock.unlock()
        }

        DispatchQueue.global().async {
            // Имитация какой-то работы
            sleep (1)
            self.lock.lock()
            let _ = self.someDate
            self.lock.unlock()
        }

        DispatchQueue.global().async {
            // Имитация какой-то работы
            sleep (1)
            self.lock.lock()
            let _ = self.someDate
            self.lock.unlock()
        }
    }
}
