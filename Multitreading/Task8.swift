//
//  Task8.swift
//  Multitreading
//
//  Created by Sonata Girl on 19.03.2024.
//

import UIKit

final class Task8: UIViewController {
    private lazy var name = "I love RM"

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
