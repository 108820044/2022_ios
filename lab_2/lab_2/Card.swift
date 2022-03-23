//
//  Card.swift
//  lab_2
//
//  Created by student on 2022/3/23.
//  Copyright © 2022年 student. All rights reserved.
//

import Foundation

struct Card{
    var isFaceUp = false
    var isMatched = false
    var identifier:Int
    
    init(identifier i:Int) {
        identifier = i
    }
}

