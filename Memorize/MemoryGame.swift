//
//  MemoryGame.swift
//  Memorize
//
//  Created by Koe Jia-Yee on 1/9/20.
//  Copyright © 2020 Koe Jia-Yee. All rights reserved.
//

import Foundation

// Model
struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
//    private(set) var cardTheme: CardTheme
    
    private var indexOfOnlyFaceUpCard: Int?  {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }      // same as ..filter{index in cards[index].isFaceUp}
        set {
            for index in cards.indices {
                    cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    
    // function that changes self has to be  declared for structs (bc it is a value type)
    mutating func choose(card:Card) {
        print("card chosen \(card)")
        
        // using the extension in Array + Identifiable
        // if let: checking if optional values are nil
        if let chosenIndex: Int = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            
            // check is there is already an existing 1 face up card
            if let indexOfPotentialMatch = indexOfOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[indexOfPotentialMatch].content {
                    cards[chosenIndex].isMatched = true
                    cards[indexOfPotentialMatch].isMatched = true
                }
                self.cards[chosenIndex].isFaceUp = true
                
            } else {
                indexOfOnlyFaceUpCard = chosenIndex
            }
        }
//        card.isFaceUp = !card.isFaceUp    // cannot just write this as this would be referring to a COPY of the struct type
    }
    
    init(numberOfCardPairs: Int, cardContentFactory:(Int) -> CardContent) {
//        self.cardTheme = cardTheme
        cards = Array<Card>()
        for pairIndex in 0..<numberOfCardPairs {
            let content = cardContentFactory(pairIndex) // passing functions
            print("content:", content)
            
//            cards.append(Card(isFaceUp: false, isMatched: false, content: content, id: pairIndex*2))
//            cards.append(Card(isFaceUp: false, isMatched: false, content: content, id: pairIndex*2+1))
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
    }
    
    // identifiables - constraint to allow foreach looping through Card items, while making each Card identifiable
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
