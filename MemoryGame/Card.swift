//
//  Card.swift
//  MemoryGame
//
//  Created by Sladjana on 7/9/20.
//  Copyright (c) 2020 Milos. All rights reserved.
//

import Foundation

struct Card: Hashable{
    
    
    var isFaceUp: Bool = false{
        willSet{
            if isFaceUp == true{
                seenCard = true
            }
            
}
    }
    public var isMatched = false
    public var identifier: Int
    public var seenCard : Bool = false
  
    fileprivate static var identifierFactory = 0
    
    fileprivate static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
    
}
