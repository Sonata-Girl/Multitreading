//
//  Task3_stars6.swift
//  Multitreading
//
//  Created by Sonata Girl on 24.03.2024.
//

import UIKit

final class Task3_stars6: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let group = DispatchGroup()

        let groupQueue = DispatchQueue(label: "group")

        group.enter()
        groupQueue.async() {
            self.fetchData()
        }
        group.leave()
        groupQueue.async() {
            self.decodeData()
        }

        group.enter()
        groupQueue.async() {
            self.modifyData()
        }
        group.leave()
        
        group.wait()
        group.notify(queue: .main) {
            self.showData()
        }
        // используя DispatchGroup вызвать методы в следующем порядке
        //1) fetchData
        // 2) decodeData
        // 3) modifyData
        // После того как данные были получены, декодированы и обработаны вызвать метод showData
    }

    func fetchData() {
        DispatchQueue.global().async {
            sleep(10)
            print("data did obtain")
        }
    }

    func decodeData() {
        DispatchQueue.global().async {
            sleep(2)
            print("data did decode")
        }
    }

    func modifyData() {
        DispatchQueue.global().async {
            sleep(1)
            print("data did modify")
        }
    }

    func showData() {
        DispatchQueue.global().async {
            print("data did show")
        }
    }
}
