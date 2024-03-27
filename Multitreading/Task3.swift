//
//  Task3.swift
//  Multitreading
//
//  Created by Sonata Girl on 19.03.2024.
//
import UIKit
/// Задача на остановку потока
final class Task3: UIViewController {

    // MARK: Private Properties

    private var infinityThread: InfinityLoop?
    private let counterLock = NSLock()

    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Создаем поток и запускаем
        infinityThread = InfinityLoop(counterLock: counterLock)
        infinityThread?.start()

        print(infinityThread?.isExecuting ?? false)
        print(infinityThread?.isFinished ?? false)

        Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(checkCounter),
            userInfo: nil,
            repeats: true
        )
    }

    // MARK: Private Methods

    @objc private func checkCounter(timer: Timer) {
        if let thread = infinityThread {
            counterLock.lock()
            if thread.counter >= 5 {
                thread.cancel()
                timer.invalidate()
            }
            print(thread.isCancelled)
            counterLock.unlock()
        }
    }

   final class InfinityLoop: Thread {
        var counter = 0
        let counterLock: NSLock

        init(counterLock: NSLock) {
            self.counterLock = counterLock
        }

        override func main() {
            while counter < 30 && !isCancelled {
                counterLock.lock()
                counter += 1
                print(counter)
                counterLock.unlock()
                InfinityLoop.sleep(forTimeInterval: 1)
            }
        }
    }
}
