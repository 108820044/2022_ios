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
    var flipCounter = 0
    var isFlipAll = false
    
//    var indexOfOneAndOnlyFaceUpCard: Int?{
//        get{
//            var foundIndex:Int?
//            for index in cards.indices{
//                if(cards[index].isFaceUp){
//                    if(foundIndex == nil){
//                        foundIndex = index
//                    }else{
//                        return nil
//                    }
//                }
//            }
//            return foundIndex
//        }set{
//            for index in cards.indices{
//                if(!cards[index].isMatched){
//                    cards[index].isFaceUp = (index == newValue)
//                }
//            }
//        }
//    }
    
//    func chooseCard(at index: Int){
//        if(!cards[index].isMatched){
//            flipCounter += 1
//            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
//                if cards[matchIndex].identifier == cards[index].identifier{
//                    cards[matchIndex].isMatched = true
//                    cards[index].isMatched = true
//                }
//                cards[index].isFaceUp = true
//            }else if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex == index{
//                // cards[index].isFaceUp = false
//                // indexOfOneAndOnlyFaceUpCard = index
//            }else{
//                indexOfOneAndOnlyFaceUpCard = index
//            }
//        }
//    }
    
    func chooseCard(at index: Int){
        if(!cards[index].isMatched){
            flipCounter += 1
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
    
    func reset(numberOfPairsOfCards: Int) {
        flipCounter = 0
        indexOfOneAndOnlyFaceUpCard = nil
        while(cards.count != 0){
            _ = cards.popLast()
        }
        for n in 1...numberOfPairsOfCards{
            let card = Card(identifier: n)
            cards += [card, card]
        }
        
        for _ in 1...numberOfPairsOfCards*2{
            cards.swapAt(Int(arc4random_uniform(UInt32(numberOfPairsOfCards*2))), Int(arc4random_uniform(UInt32(numberOfPairsOfCards*2))))
        }
    }
    
    func flip_all () {
        for index in cards.indices{
            if(!cards[index].isMatched){
                cards[index].isFaceUp = !isFlipAll
            }
        }
        isFlipAll = !isFlipAll
    }
    
    init(numberOfPairsOfCards: Int){
        for n in 1...numberOfPairsOfCards{
            let card = Card(identifier: n)
            cards += [card, card]
        }
    }
}

