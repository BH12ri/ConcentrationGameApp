//
//  Card.swift
//  Concentration
//
//  Created by BHAVANASINGH on 04/01/19.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import Foundation
struct Card : Hashable {
    var hashValue : Int { return identifier }
    
    static func ==(lhs: Card, rhs: Card) -> Bool{
        return lhs.identifier == rhs.identifier
    }
    var isFaceUp = false
    var isMatched = false
    private var identifier : Int
    private static var identifierNumber = 0
    
    private static func getUniqueIdentifier() -> Int{
        Card.identifierNumber += 1
        return Card.identifierNumber
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
