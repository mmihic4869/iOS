//
//  Me/Users/milosmihic/Desktop/iOS/MemoryGame/MemoryGame/ViewController.swiftmoryGame.swift
//  MemoryGame
//
//  Created by Sladjana on 7/11/20.
//  Copyright (c) 2020 Milos. All rights reserved.
//

//nema import UIKit jer je ovo model i on je UI independet
import Foundation

class MemoryGame
{
    fileprivate(set)var cards = [Card]()
    
    
    fileprivate var indexOfFaceUpCard: Int?
    
    func chooseCard(at index: Int){
        
        if !cards[index].isMatched{
            if let matchIndex = indexOfFaceUpCard {
                if matchIndex != index{
                if cards[index].identifier == cards[matchIndex].identifier{
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                    
                }
                    cards[index].isFaceUp = true
                    indexOfFaceUpCard = nil
                
            }
            }
            
           
            
            
            else {
                for i in 0..<cards.count{
                cards[i].isFaceUp = false
            }
            
            cards[index].isFaceUp = true
            indexOfFaceUpCard = index
        }
    }
    
    }
    
    
    init(numberOfPairsOfCards: Int){
        assert(numberOfPairsOfCards>0, "You must have at least one pair of cards.")
        for _ in 1...numberOfPairsOfCards{
            
            let card = Card()
            cards.append(card)
            cards.append(card)
            
            
            
        }
        
       
         var shuffledCards = cards
         var randomIndex: Int = 0
        for i in 0..<cards.count{
            randomIndex = (Int(arc4random_uniform(UInt32(shuffledCards.count) - 1)))
            cards[i] = shuffledCards.remove(at: randomIndex)

        }
        
    }
}
