//
//  Array+Only.swift
//  Memorize
//
//  Created by Koe Jia-Yee on 4/9/20.
//  Copyright © 2020 Koe Jia-Yee. All rights reserved.
//

import Foundation

// checks and returns the only element in the Array
extension Array {
    
//    if Array.count == 1 {
//        return Array.first     // same as array[0] if exists
//    } else {
//        return nil
//    }
    
    var only: Element? {
        count == 1 ? first : nil
    }
    
}
