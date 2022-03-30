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
    
    @IBOutlet weak var label_count: UILabel!
    @IBOutlet var cards : [UIButton]!
    var emojiChoices = ["🤣", "😡", "🤡", "😈", "😇", "😱", "👍", "💄"]
    var emojiDictionary = Dictionary<Int, String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func emoji(for card:Card)->String {
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
                button.backgroundColor = card.isMatched ? UIColor.gray : UIColor.white
            }else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = UIColor.purple
            }
        }
        label_count.text = "flip count : " + String(game.flipCounter);
    }
    
    @IBAction func flip_action(_ sender: UIButton) {
        if(!game.isFlipAll){
            if let cardNumber = cards.index(of:sender){
                game.chooseCard(at: cardNumber)
                updateViewFromModel()
            }else{
                print("not")
            }
        }
    }
    
    
    @IBAction func reset_action(_ sender: UIButton) {
        game.reset(numberOfPairsOfCards: (cards.count+1)/2)
        updateViewFromModel()
    }
    
    @IBAction func flip_all_action(_ sender: UIButton) {
        game.flip_all()
        updateViewFromModel()
    }
}

