//
//  Task11.swift
//  Multitreading
//
//  Created by Sonata Girl on 21.03.2024.
//

import UIKit
/// Задача на проблемы многопоточности
final class Task11: UIViewController {

    // MARK: Life Cycle
   override func viewDidLoad() {
        super.viewDidLoad()

        let serialQueue = DispatchQueue(label: "com.example.myQueue")
        let concQueue = DispatchQueue(label: "concQueue", attributes: .concurrent)

        // Deadlock
        concQueue.async {
            serialQueue.sync {
                print("This will never be printed.")
            }
        }

       // Data Race
       var sharedResource = 0
       let lock = NSLock()
       DispatchQueue.global(qos: .background).async {
           for _ in 1...100 {
               lock.lock()
               sharedResource += 1
               lock.unlock()
           }
           lock.lock()
           print(sharedResource)
           lock.unlock()
       }

       DispatchQueue.global(qos: .background).async {
           for _ in 1...100 {
               lock.lock()
               sharedResource += 1
               lock.unlock()
           }
           lock.lock()
           print(sharedResource)
           lock.unlock()
       }

       // LiveLock
       var people1 = People1()
       var people2 = People2()
       let lockk = NSLock()

       let thread1 = Thread {
           people1.walkPast(with: people2)
       }

       lockk.lock()
       people1.isDifferentDirections = true
       thread1.start()
       lockk.unlock()

       let thread2 = Thread {
           people2.walkPast(with: people1)
       }

       lockk.lock()
       thread2.start()
       lockk.unlock()
   }

}

class People1 {
    var isDifferentDirections = false;

    func walkPast(with people: People2) {
        while (!people.isDifferentDirections) {
            print("People1 не может обойти People2")
            sleep(1)
        }

        print("People1 смог пройти прямо")
        isDifferentDirections = true
    }
}

class People2 {
    var isDifferentDirections = false;

    func walkPast(with people: People1) {
        while (!people.isDifferentDirections) {
            print("People2 не может обойти People1")
            sleep(1)
        }

        print("People2 смог пройти прямо")
        isDifferentDirections = true
    }
}
