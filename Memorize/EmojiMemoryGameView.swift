//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Koe Jia-Yee on 1/9/20.
//  Copyright © 2020 Koe Jia-Yee. All rights reserved.
//

import SwiftUI

// View
struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Grid (items: viewModel.cards) { card in
            CardView(card: card ).onTapGesture {
                    self.viewModel.choose(card: card)
            }
            .padding(5)
            .aspectRatio(2/3, contentMode: .fit)
        }
            .padding()
            .foregroundColor(Color.orange)
    }
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        print(card.content)
        print(type(of: card.content))
        return GeometryReader { geometry in
            self.body(for: geometry.size)   // call function to reduce number of times we have to write self.
            
        }
    }
    
    @ViewBuilder    // to interpret function as a "list of Views"
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockwise: true)
                    .padding(5).opacity(0.5)
                Text("hello").font(Font.system(size: fontSize(for: size)))
                Circle()
            }
    //        .modifier(Cardify(isFaceUp: card.isFaceUp))     // using a ViewModifier without extension
                .cardify(isFaceUp: card.isFaceUp)   // extension which uses ViewModifier
        }
    }
    
    //MARK: - Drawing Constants
        
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
}











struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
