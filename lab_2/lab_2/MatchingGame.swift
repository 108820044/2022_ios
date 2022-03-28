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
    var indexOfOneAndOnlyFaceUpCard: Int?
    var counter = 0
    
    func chooseCard(at index: Int){
        if(!cards[index].isMatched){
            counter += 1
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex == index{
                cards[index].isFaceUp = false
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
                for flipDownIndex in cards.indices{
                    if(!cards[flipDownIndex].isMatched){
                        cards[flipDownIndex].isFaceUp = false
                    }
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        for n in 1...numberOfPairsOfCards{
            let card = Card(identifier: n)
            cards += [card, card]
        }
    }
}

