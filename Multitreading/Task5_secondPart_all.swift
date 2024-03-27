//
//  Task5_secondPart_all.swift
//  Multitreading
//
//  Created by Sonata Girl on 24.03.2024.
//

import UIKit

final class Task5_secondPart_all: UIViewController {

    // 1 перевести на async/await
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//        func randomD6() async -> Int {
//            Int.random(in: 1...6)
//        }
//
//        Task {
//            let result = await randomD6()
//            print(result)
//        }
//    }
    var networkService = NetworkService()

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchMessagesResult { message in
            print(message)
        }

    }

    func fetchMessagesResult(completion: @escaping ([Message]) -> Void) {
        Task {
            completion(try! await networkService.fetchMessages())
        }
    }
}

struct Message: Decodable, Identifiable {
    let id: Int
    let from: String
    let message: String
}


class NetworkService {

    func fetchMessages() async throws -> [Message] {
        let url = URL(string: "https://hws.dev/user-messages.json")!
      
        return await withCheckedContinuation { continuation in
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    if let messages = try? JSONDecoder().decode([Message].self, from: data) {
                        continuation.resume(returning: messages)
                        return
                    }
                }
            }
            .resume()
        }
    }
}
