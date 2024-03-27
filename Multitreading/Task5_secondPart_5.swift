//
//  Task5_secondPart_5.swift
//  Multitreading
//
//  Created by Sonata Girl on 24.03.2024.
//

import UIKit

final class Task5_secondPart_5: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        Task {
            await printMessage()
        }
    }

    func printMessage() async {
        let string = await withTaskGroup(of: String.self) { group -> String in
            // тут добавляем строки в группу
            group.addTask(operation: { "Hello" })
            group.addTask(operation: { "My" })
            group.addTask(operation: { "Road" })
            group.addTask(operation: { "Map" })
            group.addTask(operation: { "Group" })

            var collected = [String]()

            for await value in group {
                collected.append(value)
            }

            return collected.joined(separator: " ")
        }

        print(string)
    }
    
}
