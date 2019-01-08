//
//  ViewController.swift
//  Concentration
//
//  Created by BHAVANASINGH on 02/01/19.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfPairOfCards: numberOfPairOfCards)
    var numberOfPairOfCards: Int {
        get{
            return (cardButtons.count+1)/2
        }
    }
    private(set) var flipCount = 0{
        didSet {
            updateFlipCountLabel()
        }
    }
    
    private func updateFlipCountLabel(){
        let attributes : [NSAttributedString.Key : Any] = [
            .strokeWidth : 5.0,
            .strokeColor : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        ]
        let attributedString = NSAttributedString(string:"Flips: \(flipCount)" , attributes: attributes)
        flipCountLabel.attributedText = attributedString
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet private weak var flipCountLabel: UILabel!{
        didSet{
            updateFlipCountLabel()
        }
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        let cardCount = cardButtons.index(of: sender)!
        game.chooseCard(at: cardCount)
        updateViewFromModel()
    }
   
    
    private func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ?#colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
        
    }
   
    private var emojis = ["👻","🎃","🍭","🤡","🍕","🧚‍♀️","🐼","🦋","🙉","🍸","🍿","🦄","❄️","🏀","🍹","⭐️","🎾"]
    private var emojiChoice = [Card:String]()
    
    private func emoji(for card: Card) -> String{
        if emojiChoice[card] == nil, emojis.count > 0 {
            emojiChoice[card] = emojis.remove(at: emojis.count.arc4random)
        }
        return emojiChoice[card] ?? "?"
    }
    
}

extension Int {
        var arc4random : Int {
            if self < 0 {
                return -Int(arc4random_uniform(UInt32(abs(self))))
            }else if self > 0 {
                return Int(arc4random_uniform(UInt32(self)))
            }else {
                return 0
            }
        }
}
    
    
    
    


