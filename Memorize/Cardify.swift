//
//  Cardify.swift
//  Memorize
//
//  Created by Koe Jia-Yee on 4/9/20.
//  Copyright © 2020 Koe Jia-Yee. All rights reserved.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    
    func body (content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth) // returns a View
                content
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill() // for back of card, fill with environment color
                // if else, do nothing: no need to specify else create empty view
            }
            
        }
    }
    
    //MARK: - Drawing Constants
    
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        print("cardifying...")
        return self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
