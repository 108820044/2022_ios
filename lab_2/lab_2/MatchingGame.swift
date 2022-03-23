//
//  MatchingGame.swift
//  lab_2
//
//  Created by student on 2022/3/23.
//  Copyright © 2022年 student. All rights reserved.
//
import Foundation

class MatchingGame{
    var cards = [Card]()
    
    func chooseCard(at index: Int){
        if cards[index].isFaceUp{
            cards[index].isFaceUp = false
        }else{
            cards[index].isFaceUp = true
        }
    }
    
    init(numberOfPairsOfCards: Int){
        for n in 1...numberOfPairsOfCards{
            let card = Card(identifier: n)
            cards += [card, card]
        }
    }
}

