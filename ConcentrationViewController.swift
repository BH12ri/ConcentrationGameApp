//
//  ViewController.swift
//  Concentration
//
//  Created by BHAVANASINGH on 02/01/19.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {
    private var countLabel = ""
    private var gameThemeSelected = false
    private lazy var game = Concentration(numberOfPairOfCards: numberOfPairOfCards)
    var numberOfPairOfCards: Int {
        get{
            return (visibleCardButtons.count+1)/2
        }
    }
    @IBOutlet private var cardButtons: [UIButton]!
    
    private var visibleCardButtons: [UIButton]!{
        return cardButtons?.filter { !$0.superview!.isHidden }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateViewFromModel()
    }
    
    // ------LABEL UPDATE AND DISPLAY-------
    private(set) var score = 0{
        didSet{
            countLabel = "Score:"
            updateLabel(Label : countLabel , Value : score, LabelType: scoreLabel)
        }
    }
    private(set) var flipCount = 0 {
        didSet {
            countLabel = "Flips:"
            updateLabel(Label : countLabel, Value : flipCount, LabelType: flipCountLabel)
        }
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!{
        didSet{
            countLabel = "Flips:"
            updateLabel(Label : countLabel, Value : flipCount, LabelType: flipCountLabel)
        }
    }
    
    @IBOutlet weak var scoreLabel: UILabel!{
        didSet{
            countLabel = "Score:"
            updateLabel(Label : countLabel, Value : score, LabelType: scoreLabel)
        }
    }
    
    private func updateLabel(Label: String, Value : Int, LabelType : UILabel){
        let attributes : [NSAttributedString.Key : Any] = [
            .strokeWidth : 5.0,
            .strokeColor : #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        ]
        let attributedString = NSAttributedString(string:"\(Label) \(Value)" , attributes: attributes)
        LabelType.attributedText = attributedString
    }
    
    
    //-----------***-------
    
    // Funtion: When a card is touched to flip it over
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        let cardCount = visibleCardButtons.index(of: sender)!
        game.chooseCard(at: cardCount)
        score = game.updateScoreValue()
        updateViewFromModel()
    }
    
    // Function : To restart the game
    @IBAction private func newGame(_ sender: UIButton) {
        game = Concentration(numberOfPairOfCards: numberOfPairOfCards)
        flipCount = 0
        score = 0
        //gameThemeSelected = false
        updateViewFromModel()
    }
    
    
    // ---Function : Update View of Game during playing Concentration----
    private func updateViewFromModel(){
        //if gameThemeSelected{
        if visibleCardButtons != nil {
            for index in visibleCardButtons.indices{
                let button = visibleCardButtons[index]
                let card = game.cards[index]
                if card.isFaceUp{
                    button.setTitle(emoji(for: card), for: UIControl.State.normal)
                    button.backgroundColor = #colorLiteral(red: 0.4352941176, green: 0.4431372549, blue: 0.4745098039, alpha: 1)
                }else{
                    button.setTitle("", for: UIControl.State.normal)
                    button.backgroundColor = card.isMatched ?#colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
                }
            }
            
        }
//        }else{
//            gameThemeSelected = true
//            gameThemeCaseRandomSelect()
//
//        }
    }
    
    // -------EMOJI THEME SELECTION (assignment)-------
//    private var theme : Theme! {
//        didSet {
//            implementTheme()
//        }
//    }
//    private func gameThemeCaseRandomSelect(){
//        print(gameThemeSelected)
//        theme = Theme(rawValue: Theme.count.arc4random) ?? Theme.Halloween
//    }
//
//    private func implementTheme() {
//        emoji = [:]
//        unusedEmojis = theme.emojiChoices
//        updateViewFromModel()
//
//    }
    
//    ----Code for selection of the emojis to appear on cards---
//    private var emoji = [Card:String]()
//    private var unusedEmojis: String!
//
//    private func emoji(for card: Card) -> String {
//        if emoji[card] == nil, unusedEmojis != nil {
//            let randomStringIndex = unusedEmojis.index(unusedEmojis.startIndex, offsetBy: unusedEmojis.count.arc4random)
//            emoji[card] = String(unusedEmojis.remove(at: randomStringIndex))
//        }
//        return emoji[card] ?? "?"
//    }
// -----Theme Selection using Multiple MVC Concept------
    var theme: String?{
        didSet {
            emojiChoices = theme ?? ""
            emoji = [:]
            updateViewFromModel()
            
        }
    }
    private var emojiChoices = "🐶🐣🐼🐙🦋🐳🐯🦁"
    private var emoji = [Card:String]()
    var usedEmoji = ""
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            let emojiAtCurrentIndex = String(emojiChoices.remove(at: randomStringIndex))
            usedEmoji = self.usedEmoji + emojiAtCurrentIndex
            emoji[card] = emojiAtCurrentIndex
        }
        if emojiChoices.count == 0 {
            emojiChoices = usedEmoji
        }
        return emoji[card] ?? "?"
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







