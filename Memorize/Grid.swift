//
//  Grid.swift
//  Memorize
//
//  Created by Koe Jia-Yee on 3/9/20.
//  Copyright © 2020 Koe Jia-Yee. All rights reserved.
//

import SwiftUI
 
// Container View
struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    private var items: [Item]
    private var viewForItem: (Item) -> ItemView
    
    init(items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        return GeometryReader { geometry in
            // create GridLayout based on space offered
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))   // just so that we don't need to self. so many times
        }
    }
    
    private func body (for layout: GridLayout) -> some View {
        ForEach (items) { item in
            self.body(for: item, in: layout)
        }
    }
    
    private func body (for item: Item, in layout: GridLayout) -> some View {
        let index = items.firstIndex(matching: item)  // get index of item in items array
        return Group {
            if index != nil {
                 viewForItem(item)
                    .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                    .position(layout.location(ofItemAt: index!))    // without the if index != nil, this will crash if index == nil
            }
        }
    }
}
