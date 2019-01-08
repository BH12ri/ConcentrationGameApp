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
    private var oneAndOnlyOneCardFaceUp : Int?{
        get{
            //THIRD METHOD OF IMPLEMENTATION
            return cards.indices.filter{ cards[$0].isFaceUp }.oneAndOnly
            
            //SECOND METHOD OF IMPLEMENTATION
          //  let faceUpCardIndices = cards.indices.filter{ cards[$0].isFaceUp }
          //  return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
            
        // FIRST METHOD OF IMPLEMENTATION
        /*         var foundIndex: Int?
                   for index in cards.indices{
                   if cards[index].isFaceUp{
                    if foundIndex == nil{
                        foundIndex = index
                    }else{
                        return nil
                    }
                }
            }
            return foundIndex
        */
        }
        set{
            for index in cards.indices{
                cards[index].isFaceUp = (newValue == index)
            }
        }
    }
    
    
    func chooseCard(at index: Int){
        assert(cards.indices.contains(index), "Concentration.chooseCard.index:\(index) = Not a valid index in cards array")
        if !cards[index].isMatched{
            if let matchIndex = oneAndOnlyOneCardFaceUp, matchIndex != index{
                //If cards match and only ONE card is FACEUP
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            }else{
             //If NO card faceup or TWO cards face up
                oneAndOnlyOneCardFaceUp = index
            }
        }
        
    }
    
    init(numberOfPairOfCards: Int){
        assert(numberOfPairOfCards > 0, "Concentration.numberOfPairOfCards: = Should be atleast 1")
        for _ in 1...numberOfPairOfCards{
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
}
    extension Collection {
        var oneAndOnly : Element? {
            return count == 1 ? first : nil
        }
    }
    


