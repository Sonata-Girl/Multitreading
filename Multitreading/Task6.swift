//
//  Task6.swift
//  Multitreading
//
//  Created by Sonata Girl on 19.03.2024.
//

import UIKit
/// Задача на порядок выполнения
final class Task6: UIViewController {

    // MARK: Life Cycle
    // A C B
    // Потому что мы положили исполнение блока на мейн поток,а она серийная очередь, исполнится когда закончит блок sync
    override func viewDidLoad() {
        super.viewDidLoad()

        print("A")

        DispatchQueue.main.async {
            print("B")
        }

        print("C")
    }
}
