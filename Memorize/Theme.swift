//
//  Theme.swift
//  Memorize
//
//  Created by Koe Jia-Yee on 6/9/20.
//  Copyright © 2020 Koe Jia-Yee. All rights reserved.
//

import Foundation
import SwiftUI

struct EmojiTheme {
    enum Themes: Int {
        case halloween = 1, sports, countries, vehicles, food, animals
    }
    
    let emojis: [String]
    let numberOfCardPairs: Int = 3
    let color: Color
    
    init(themeIndex raw: Int) {
        let themeName = Themes(rawValue: raw)
        
        switch themeName {
        case .halloween:
            emojis = ["👻", "🎃", "🕷"]
            color = Color.orange
        case .sports:
            emojis = ["🏋🏽‍♀️", "🤸🏽‍♀️", "🥊"]
            color = Color.blue
        case .countries:
            emojis = ["🇲🇾", "🇵🇱", "🇬🇭"]
            color = Color.purple
        case .vehicles:
            emojis = ["🚀", "🚑", "🚊"]
            color = Color.gray
        case .food:
            emojis = ["🍱", "🥨", "🍫"]
            color = Color.pink
        case .animals:
            emojis = ["🦄", "🐵", "🐶"]
            color = Color.yellow
        case .none:
            emojis = ["👻", "🎃", "🕷"]
            color = Color.orange
        }
        
    }
}
