//
//  Task14.swift
//  Multitreading
//
//  Created by Sonata Girl on 21.03.2024.
//

import UIKit

class Task14Sendable: UIViewController {

    final class Post: Sendable {

    }

    enum State1: Sendable {
        case loading
        case data(String)
    }
// Ошибка была потому что String поддерживает протокол Sendable по умолчанию,а Post нужно еще подписать на наш протокол
    enum State2: Sendable {
        case loading
        case data(Post) // Out: Associated value 'data' of 'Sendable'-conforming enum 'State2' has non-sendable type 'ViewController.Post'
    }

}
