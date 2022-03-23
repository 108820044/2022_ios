//
//  ViewController.swift
//  lab2
//
//  Created by student on 2022/3/14.
//  Copyright © 2022年 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = MatchingGame(numberOfPairsOfCards: (cards.count+1)/2)
    //var game = MatchingGame()
    
    @IBOutlet weak var label_count: UILabel!
    @IBOutlet var cards : [UIButton]!
    var texts = [1, 3, 4, 2, 3, 4, 2, 1]
    var emojiChoices = ["🤣", "😡", "🤡", "😈", "😇", "😱", "👍", "💄"]
    var emojiDictionary = Dictionary<Int, String>()
    
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func emoji(for card:Card)->String {
        /*if emojiDictionary[card.identifier] != nil {
            return emojiDictionary[card.identifier]!
        }else{
            return "?"
        }*/
        
        if emojiDictionary[card.identifier] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emojiDictionary[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emojiDictionary[card.identifier] ?? "?"
    }
    
    func updateViewFromModel() {
        for index in cards.indices {
            let button = cards[index]
            let card = game.cards[index]
            if (card.isFaceUp) {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = UIColor.white
            }else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? UIColor.gray : UIColor.purple
            }
        }
    }
    
    @IBAction func flip_action(_ sender: UIButton) {
        if let cardNumber = cards.index(of:sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("not")
        }
        counter += 1
        label_count.text = "flip count : " + String(counter);
        /*var temp = 0
        while(temp < 8){
            if(sender == cards[temp]){
                break
            }
            temp += 1
        }*/
        
        updateViewFromModel()
        // print(temp)
        /*if(sender.currentTitle == nil){
            sender.setTitle(String(texts[temp]), for: UIControlState.normal)
            sender.backgroundColor = UIColor.white
        }else{
            sender.setTitle(nil, for: UIControlState.normal)
            sender.backgroundColor = UIColor.purple
        }*/
    }
    
}

