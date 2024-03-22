//
//  Task9.swift
//  Multitreading
//
//  Created by Sonata Girl on 20.03.2024.
//

import UIKit
/// Решение семафором
//final class Task9: UIViewController {
//
//    // MARK: Life Cycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        var phrasesService = PhrasesService()
//
//        let semaphore = DispatchSemaphore(value: 1)
//        let queue = DispatchQueue.global(qos: .utility)
//        queue.async {
//            DispatchQueue.concurrentPerform(
//                iterations: 10) { id in
//                    semaphore.wait()
//                    phrasesService.addPhrases("Phrase \(id)")
//                    semaphore.signal()
//                }
//        }
//
//        // Даем потокам время на завершение работы
//        Thread.sleep(forTimeInterval: 1)
//
//        // Выводим результат
//        queue.async {
//            semaphore.wait()
//            print(phrasesService.phrases)
//            semaphore.signal()
//        }
//    }
//
//    class PhrasesService {
//        var phrases: [String] = []
//
//        func addPhrases(_ phrase: String) {
//            phrases.append(phrase)
//        }
//    }
//}
/// Решение актором
final class Task9: UIViewController {

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        let phrasesService = PhrasesService()
        let semaphore = DispatchSemaphore(value: 0)

        for i in 0..<10 {
            DispatchQueue.global().async {
                phrasesService.addPhrase("Phrase \(i)")
            }
        }

        // Даем потокам время на завершение работы
        Thread.sleep(forTimeInterval: 1)

        // Выводим результат
        semaphore.wait()
        DispatchQueue.global().async {
            print(phrasesService.phrases)
        }
        semaphore.signal()
    }

    actor PhrasesService {
        var phrases: [String] = []
        let semaphore = DispatchSemaphore(value: 1)

        func addPhrase(_ phrase: String) {
            semaphore.wait()
            phrases.append(phrase)
            semaphore.signal()
        }
    }
}
