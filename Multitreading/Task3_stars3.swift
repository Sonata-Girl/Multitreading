//
//  Task3_stars3.swift
//  Multitreading
//
//  Created by Sonata Girl on 24.03.2024.
//

import UIKit

class HeavilyComputation {
    private var rezult = 0
    func doSomething(value: Int) -> Int {
        rezult += value
        return rezult
    }
}


final class Task3_stars3: UIViewController {
    private lazy var heavyComputationObject = HeavilyComputation()
    private var rezult: Int = 0
    private var lock = NSLock()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("start")
        view.backgroundColor = .cyan
        start()
        print("finish")
    }

    func start() {
        DispatchQueue.global().async {
            self.lock.lock()
            let value = self.heavyComputationObject.doSomething(value: 10)
            self.lock.unlock()
            sleep(1)
            print (value)
        }

        DispatchQueue.global().async {
            self.lock.lock()
            let value = self.heavyComputationObject.doSomething(value: 11)
            self.lock.unlock()
            sleep(2)
            print (value)
        }

        DispatchQueue.global().async {
            self.lock.lock()
            let value = self.heavyComputationObject.doSomething(value: 12)
            self.lock.unlock()
            print (value)
        }

        DispatchQueue.global().async {
            self.lock.lock()
            let value = self.heavyComputationObject.doSomething(value: 13)
            self.lock.unlock()
            print (value)
        }

        DispatchQueue.global().async {
            self.lock.lock()
            let value = self.heavyComputationObject.doSomething(value: 14)
            sleep(3)
            self.lock.unlock()
            print (value)
        }

        DispatchQueue.global().async {
            self.lock.lock()
            let value = self.heavyComputationObject.doSomething(value: 15)
            self.lock.unlock()
            print (value)
        }
    }
}
