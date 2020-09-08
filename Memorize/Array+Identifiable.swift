//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Koe Jia-Yee on 3/9/20.
//  Copyright © 2020 Koe Jia-Yee. All rights reserved.
//

import Foundation


extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            // we can use .id because Element is Identifiable
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
    
}
