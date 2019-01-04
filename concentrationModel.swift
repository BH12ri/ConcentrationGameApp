//
//  concentrationModel.swift
//  Concentration
//
//  Created by BHAVANASINGH on 04/01/19.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import Foundation
class Concentration
{
    var cards = [Card]()
    var oneAndOnlyOneCardFaceUp : Int?
    
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            cards[index].isFaceUp = true
            if let matchIndex = oneAndOnlyOneCardFaceUp, matchIndex != index{
                //If cards match and one card is already FACEUP
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    if cards[matchIndex].isFaceUp == true, cards[index].isFaceUp == true{
                        for flipCardDown in cards.indices{
                            cards[flipCardDown].isFaceUp = false
                        }
                    }
                }
                oneAndOnlyOneCardFaceUp = nil
                
            }else{
             //If no card FACEUP
                for flipCardDown in cards.indices{
                    cards[flipCardDown].isFaceUp = false
                }
                oneAndOnlyOneCardFaceUp = index
                cards[index].isFaceUp = true
            }
        }
        
    }
    
    init(numberOfPairOfCards: Int){
        for _ in 1...numberOfPairOfCards{
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
    
    
    
}

