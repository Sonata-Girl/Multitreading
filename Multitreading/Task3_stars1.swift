//
//  Task3_stars.swift
//  Multitreading
//
//  Created by Sonata Girl on 24.03.2024.
//

import UIKit

final class Task3_stars1: UIViewController {
    // не вывелись потому что стоял лок и блокировал очередь
    override func viewDidLoad() {
        super.viewDidLoad()
        print("R")
        let lock = NSLock()
        DispatchQueue.global().async {
            lock.lock()
            print("A")
            lock.unlock()
            lock.lock()
            print ("D")
            lock.unlock()
            DispatchQueue.main.async {
                print ("Map")
            }
            print ("0")
        }
    }
}
