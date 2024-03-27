//
//  Task3_stars5.swift
//  Multitreading
//
//  Created by Sonata Girl on 24.03.2024.
//

import UIKit

final class Task3_stars5: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let resourceASemaphore = DispatchSemaphore(value: 1)
        let resourceBSemaphore = DispatchSemaphore(value: 1)
        let queue = DispatchQueue(label: "con", qos: .userInitiated, attributes: .concurrent)

        let firstWorkItem = DispatchWorkItem(qos: .userInteractive) {
            print("Поток 1 пытается захватить Ресурс А")
            resourceASemaphore.wait () // Захват Ресурса А
            print("Поток 1 захватил Ресурс А и пытается захватить Ресурс В")
            sleep(2) // имитация работы для демонстрации livelock
            resourceBSemaphore.wait() // Попытка захвата Ресурса В, который уже занят Потоком 2
            print("Поток 1 захватил Ресурс В")
            resourceBSemaphore.signal()
            resourceASemaphore.signal()
        }

        let secondWorkItem = DispatchWorkItem(qos: .background) {
            print("Поток 2 пытается захватить Ресурс В")
            resourceBSemaphore.wait() // Захват Ресурса B
            print("Поток 2 захватил Ресурс В и пытается захватить Ресурс A")
            sleep(2) // Имитация работы для демонстрации livelock
            resourceASemaphore.wait() // Попытка захвата Ресурса А, который уже занят Потоком 1 print("Поток 2 захватил Ресурс А")
            resourceASemaphore.signal()
            resourceBSemaphore.signal()
        }
           
        queue.async(execute: firstWorkItem)
        queue.async(execute: secondWorkItem)

        checkResource(first: firstWorkItem, second: secondWorkItem)

        // Вызвать метод taskCompleted, после успешного завершения
        resourceASemaphore.wait() // Попытка захвата Ресурса А, который уже занят Потоком 1
        print("Поток 2 захватил Ресурс А")
        resourceASemaphore.signal()
        resourceBSemaphore.signal()

        queue.async(execute: firstWorkItem)
        queue.async(execute: secondWorkItem)
        checkResource(first: firstWorkItem, second: secondWorkItem)
        // Вызвать метод taskCompleted, после успешного завершения

    }

    func checkResource(first: DispatchWorkItem, second: DispatchWorkItem) {
        DispatchQueue.main.asyncAfter (deadline: .now() + 10) {
            // проверить что работа все еще выполняется // и если выполняется отменить ее

            //если работа была отменена, вывести сообщение
        }
    }

    func taskCompleted () {
        print("Task completed successfully.")
    }
}
