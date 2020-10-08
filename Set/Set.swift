//
//  Set.swift
//  Set
//
//  Created by Miloš Mihić on 20/07/2020.
//  Copyright © 2020 Miloš Mihić. All rights reserved.
//

import Foundation


class Set {
    
    
    
    var cards = [Card]()
  
    
    
    init(numberOfCards: Int){
        
        for _ in 0..<numberOfCards{
            let card = Card()
            cards.append(card)
        }
        
    }
    
}
