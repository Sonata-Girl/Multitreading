//
//  Task5_secondPart_3.swift
//  Multitreading
//
//  Created by Sonata Girl on 24.03.2024.
//

import UIKit

final class Task5_secondPart_3: UIViewController {

   var networkService = NetworkServiceSec()

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchMessagesResult { message in
            print(message)
        }

    }

    func fetchMessagesResult(completion: @escaping ([MessageSec]) -> Void) {
        Task {
            completion(try! await networkService.fetchMessages())
        }
    }
}

struct MessageSec: Decodable, Identifiable {
    let id: Int
    let from: String
    let message: String
}


class NetworkServiceSec {

    func fetchMessages() async throws -> [MessageSec] {
        let url = URL(string: "https://hws.dev/user-messages.json")!

        return try await withCheckedThrowingContinuation { continuation in
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    if let messages = try? JSONDecoder().decode([MessageSec].self, from: data) {
                        if messages.isEmpty {
                            continuation.resume(throwing: NSError(domain: "Пустые данные", code: 0, userInfo: nil))
                        } else {
                            continuation.resume(returning: messages)
                        }
                       return
                    }
                }
            }
            .resume()
        }
    }
}
