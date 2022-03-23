//
//  ViewController.swift
//  lab2
//
//  Created by student on 2022/3/14.
//  Copyright © 2022年 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var game = MatchingGame(numberOfPairsOfCards: 4)
    //var game = MatchingGame()
    
    @IBOutlet weak var label_count: UILabel!
    @IBOutlet var cards : [UIButton]!
    var texts = [1, 3, 4, 2, 3, 4, 2, 1]
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func flip_action(_ sender: UIButton) {
        var temp = 0
        while(temp < 8){
            if(sender == cards[temp]){
                break
            }
            temp += 1
        }
        // print(temp)
        if(sender.currentTitle == nil){
            counter += 1
            label_count.text = "flip count : " + String(counter);
            sender.setTitle(String(texts[temp]), for: UIControlState.normal)
            sender.backgroundColor = UIColor.white
        }else{
            counter += 1
            label_count.text = "flip count : " + String(counter);
            sender.setTitle(nil, for: UIControlState.normal)
            sender.backgroundColor = UIColor.purple
        }
    }
    
}

