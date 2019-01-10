//
//  Theme.swift
//  Concentration
//
//  Created by BHAVANASINGH on 10/01/19.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import Foundation

enum Theme : Int, CaseIterable {
    
    case Halloween
    case Animals
    case Flowers
    case Flags
    case Sports
    case Food
    
    static var count : Int {
        return Theme.allCases.count
        
    }
    
    var emojiChoices: String {
        switch(self) {
        case .Halloween:
            return "🦇😱🙀😈🎃👻💀🧛‍♂️"
        case .Animals:
            return "🐶🐣🐼🐙🦋🐳🐯🦁"
        case .Sports:
            return "⚽️🏀🏈⚾️🎾🏐🏓🏑"
        case .Flowers:
            return "🌸🌼🌺🌹🌷🌻🥀🌾"
        case .Flags:
            return "🇬🇧🇻🇳🇲🇷🇳🇺🇲🇱🇭🇺🇴🇲🇵🇰"
        case .Food:
            return "🍧🥙🍩🍜🍰🌮🍲🍚"
        }
    }
    
}

