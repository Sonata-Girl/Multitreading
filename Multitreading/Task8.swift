//
//  Task8.swift
//  Multitreading
//
//  Created by Sonata Girl on 19.03.2024.
//

import UIKit
/// Задача решение проблемы data race
final class Task8: UIViewController {
    
    // MARK: Private Properties
    private lazy var name = "I love RM"

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        updateName()
    }

    func updateName() {
        let lock = NSLock()
        DispatchQueue.global().async {
            lock.lock()
            print(self.name)
            print(Thread.current)
            lock.unlock()
        }
        lock.lock()
        print(self.name)
        lock.unlock()
    }
}
