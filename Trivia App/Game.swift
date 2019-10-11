//
//  Game.swift
//  Trivia App
//
//  Created by Mohammad Yunus on 10/10/19.
//  Copyright © 2019 taptap. All rights reserved.
//

import Foundation
// structure of a game
struct Game {
    var questions = [Question]()
    
    init() {
        questions += [
        Question(id: 1, question: "who is the best cricketer in the world?", options: ["sachin", "kohli", "adam", "kallis"], type: "single"),
        Question(id: 2, question: "what are the colors in the Indian national flag?", options: ["white","yellow","orange","green"], type: "multiple")
        ]
    }
}
