//
//  ViewController.swift
//  MemoryGame
//
//  Created by Sladjana on 7/9/20.
//  Copyright (c) 2020 Milos. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet fileprivate var cardButtons: [UIButton]!
    
    @IBOutlet fileprivate weak var flipCount: UILabel!
        
    fileprivate(set) var flips : Int = 0{
        didSet{
            flipCount.text = "Flips: \(flips)"
        }
    }
    
    @IBAction fileprivate func newGame(_ sender: UIButton) {
        game = MemoryGame(numberOfPairsOfCards: numberOfPairsOfCards)
        updateEmoji()
        updateViewFromModel()
        score = 0
        flips = 0
    }
    fileprivate lazy var game = MemoryGame(numberOfPairsOfCards: numberOfPairsOfCards
    )
    
    fileprivate var numberOfPairsOfCards: Int{
        get{
            return cardButtons.count/2
        }
    }
    
    fileprivate var score: Float = 0{
        didSet{
            scoreLabel.text = "Score: \(Int(score))"
        }
    }
    
    fileprivate func getPoint(with card: UIButton){
        
        if let cardNumber = cardButtons.index(of: card){
            game.chooseCard(at: cardNumber)
            
                    if game.cards[cardNumber].seenCard{
                        if game.cards[cardNumber].isMatched {
                            score += 1
                        }else{
                            score -= 0.5
                        }
                        
                    }
            }
            
        }
        
    
    @IBOutlet fileprivate weak var scoreLabel: UILabel!
    

    @IBAction fileprivate func touchCard(_ sender: UIButton) {
        
        
        if let cardNumber = cardButtons.index(of: sender){
            
            //print(game.cards[cardNumber].seenCard)
            game.chooseCard(at: cardNumber)
            if !game.cards[cardNumber].isMatched
            {
                flips += 1
            }
            updateViewFromModel()
            
            
        }
          
            
        else {
            
            sender.backgroundColor = UIColor.orange
            sender.setTitle("", for: .normal)
            
        }
        
        
    }
    
    
    fileprivate func getPoint(on cards: [Card]){
        
        var numberOfFaceUpCards = 0
        var fuc = [Card]()
        //cards.filter($0.seenCard = true)
        for i in 0..<cards.count{
            if cards[i].isFaceUp {
                numberOfFaceUpCards += 1
                fuc.append(cards[i])
            }
        }
        
        if numberOfFaceUpCards == 2{
            for i in 0..<fuc.count{
                if fuc[i].isMatched{
                    score += 1
                }
                else {
                    if fuc[i].seenCard && !fuc[i].isMatched{
                        score -= 0.5
                    }
                }
            }
           numberOfFaceUpCards = 0
        }
        
       
            }
    
    fileprivate func updateViewFromModel()
    {
        
        for index in 0..<cardButtons.count{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                
                button.setTitle(emoji(on: card), for: .normal)
                button.backgroundColor = UIColor.white
                

                
            } else {
                
        
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? UIColor.clear : UIColor.orange
            }
            
        }
        getPoint(on: game.cards)
   
    }
    
    
    fileprivate func updateEmoji(){
            emojiChoices = [
            "faces": ["😃", "😊", "☺️", "😉", "😍","😘"],
            "sports": ["⚽️","🏀","🏈","⚾️","🎾","🏐","🏉","🎱"],
            "animals": ["🐶","🐱","🐭","🐹","🐰","🐻","🐼","🐨"]
        ]
        
        
    }
    
    var niz: [Int] = [1,2,3,4]
    
    
    fileprivate var emojiChoices = [
        "faces": ["😃", "😊", "☺️", "😉", "😍","😘"],
        "sports": ["⚽️","🏀","🏈","⚾️","🎾","🏐","🏉","🎱"],
        "animals": ["🐶","🐱","🐭","🐹","🐰","🐻","🐼","🐨"]
    ]
    
    
    fileprivate var themes : String = "sports"
    fileprivate var emoji = [Int:String]()
    fileprivate func emoji(on card: Card) -> String {
        
        if emoji[card.identifier] == nil{
            let emojiThemeLimit = (emojiChoices[themes]?.count)! - 1
            let randomIndex = Int(arc4random_uniform(UInt32(emojiThemeLimit)))
            emoji[card.identifier] = emojiChoices[themes]?.remove(at: randomIndex)
        
        }
        //print(emoji[card.identifier]!)
        return  emoji[card.identifier] ?? "?"
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

extension Array{

    func index(of element: UIButton?) -> Int?{
        var returnValue: Int? = nil
        if let el = element{
            for i in 0..<self.count{
                if let tmp = self[i] as? UIButton{
                    if tmp == el{
                        returnValue = i
                    }
                }

                }
        }

        else{

            returnValue = nil
        }
        return returnValue
        }




}

