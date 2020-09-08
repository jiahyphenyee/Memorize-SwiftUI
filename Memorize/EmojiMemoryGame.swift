//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Koe Jia-Yee on 1/9/20.
//  Copyright © 2020 Koe Jia-Yee. All rights reserved.
//

import SwiftUI

// View Model
class EmojiMemoryGame: ObservableObject {
//    private(set) var model: MemoryGame<String>  // glassdoor: read-only by external, readwrite by this class
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    // static function as a type of the class
    private static func createMemoryGame() -> MemoryGame<String> {
        print("creating emoji game...")
//        let theme = EmojiTheme(themeIndex: Int.random(in: 1...6))
//        let emojis = theme.emojis
        let emojis = ["👻", "🎃", "🕷"]
        print(emojis)
//        let numberOfCardPairs = Int.random(in: 2...5)
        // last argument of the function can be placed in curly brackets
        return MemoryGame<String>(numberOfCardPairs: 3) { pairIndex in return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
//    var theme: EmojiTheme {
//        model.cardTheme
//    }
//
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
