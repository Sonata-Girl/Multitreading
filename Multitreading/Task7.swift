//
//  Task7.swift
//  Multitreading
//
//  Created by Sonata Girl on 19.03.2024.
//

import UIKit

final class Task7: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(2)
        DispatchQueue.main.async {
            print(3)
            DispatchQueue.main.async {
//                DispatchQueue.main.sync {
                print(5)
            }
            print(4)
        }
        print(6)
    }
}

// ViewDidLoad вызывается потому что мы инициализировали,создали вью контроллер, так как это его метод жизненного цикла
//let vc = ViewController()
//print(1)
//let view = vc.view
//print(7)
