//
//  ViewController.swift
//  Set
//
//  Created by Miloš Mihić on 20/07/2020.
//  Copyright © 2020 Miloš Mihić. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setGame()
        updateButtons()
        updateView()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet var addedCardButtons: [UIButton]!
    
    var set = Set(numberOfCards: 0)
    var usedCards = [Card]()
    
    

    //MARK: Red Attributes
    let stripedRedAttribute : [NSAttributedString.Key : Any] = [
        .strokeColor : UIColor.red,
        .strokeWidth : -5.0,
        .foregroundColor : UIColor.red.withAlphaComponent(0.15)
    ]
    let filledRedAttribute : [NSAttributedString.Key : Any] = [
        .strokeColor : UIColor.red,
        .strokeWidth : -5.0,
        .foregroundColor : UIColor.red.withAlphaComponent(1)
    ]
    let emptyRedAttribute : [NSAttributedString.Key : Any] = [
        .strokeColor : UIColor.red,
        .strokeWidth : 5.0,
        
    ]
    
    //MARK: Green Attributes
   
    let stripedGreenAttribute : [NSAttributedString.Key : Any] = [
        .strokeColor : UIColor.green,
        .strokeWidth : -5.0,
        .foregroundColor : UIColor.green.withAlphaComponent(0.15)
    ]
    let filledGreenAttribute : [NSAttributedString.Key : Any] = [
        .strokeColor : UIColor.green,
        .strokeWidth : -5.0,
        .foregroundColor : UIColor.green.withAlphaComponent(1)
    ]
    let emptyGreenAttribute : [NSAttributedString.Key : Any] = [
        .strokeColor : UIColor.green,
        .strokeWidth : 5.0,
        
    ]
    
    //MARK: Purple Attributes
    let stripedPurpleAttribute : [NSAttributedString.Key : Any] = [
        .strokeColor : UIColor.purple,
        .strokeWidth : -5.0,
        .foregroundColor : UIColor.purple.withAlphaComponent(0.15)
    ]
    let filledPurpleAttribute : [NSAttributedString.Key : Any] = [
        .strokeColor : UIColor.purple,
        .strokeWidth : -5.0,
        .foregroundColor : UIColor.purple.withAlphaComponent(1)
    ]
    let emptyPurpleAttribute : [NSAttributedString.Key : Any] = [
        .strokeColor : UIColor.purple,
        .strokeWidth : 5.0,
        
    ]
    

    func setGame(){
        Card.identifierFactory = 0
        if !buttonNames.isEmpty{
            for button in cardButtons{
                button.setAttributedTitle(nil, for: .normal)
            }
        buttonNames.removeAll()
        }
        putCardsinSetArray.removeAll()
        putButtonInSetArray.removeAll()
        
        if !usedCards.isEmpty{
            usedCards.removeAll()
        }
            set = Set(numberOfCards: 81)
        getButtonNames()
        for _ in 0..<12 {
            
            usedCards.append(set.cards.removeFirst())
        }
        for card in usedCards{
            card.isFaceUp = true
        }
        
        
    }
    
    func updateButtons(){
        
        var tmpAddedButtons = [UIButton]()
        while cardButtons.count != 12 {
           
        for i in stride(from: 3, through: 1, by: -1){
            let removedButton = cardButtons.remove(at: cardButtons.count - i)
            tmpAddedButtons.append(removedButton)
            
        }
            }
        for button in addedCardButtons{
            tmpAddedButtons.append(button)
        }
        addedCardButtons = tmpAddedButtons
        
        
    }
    
    
    @IBAction func newGame(_ sender: UIButton) {
        setGame()
        updateButtons()
        updateView()
        points = 0
        }
        
    @IBOutlet weak var score: UILabel!
    
    
    enum Shading: String{
        case empty, filled, striped, none
    }
    
    enum Color: String{
        case red, green, purple, none
    }
    var attributeForCompare1 : (shape: String.Shape, number: String.Number, shading: Shading, color: Color) = (.none, .zero, .none, .none)
    var attributeForCompare2 : (shape: String.Shape, number: String.Number, shading: Shading, color: Color) = (.none, .zero, .none, .none)
    var attributeForCompare3 : (shape: String.Shape, number: String.Number, shading: Shading, color: Color) = (.none, .zero, .none, .none)
    
    
    
    func additionForPrepareForCheck(){
        
        if !putButtonInSetArray.isEmpty{
            //first card
            let attributedText1 = putButtonInSetArray[0].attributedTitle(for: .normal)
            let string1 = attributedText1!.string
            let attributes1 = attributedText1!.attributes(at: 0, effectiveRange: nil)
            attributeForCompare1.number = string1.numberAndShape.number
            attributeForCompare1.shape = string1.numberAndShape.shape
            
           //second card
            let attributedText2 = putButtonInSetArray[1].attributedTitle(for: .normal)
            let string2 = attributedText2!.string
            let attributes2 = attributedText2!.attributes(at: 0, effectiveRange: nil)
            attributeForCompare2.number = string2.numberAndShape.number
            attributeForCompare2.shape = string2.numberAndShape.shape
            
            //third card
            let attributedText3 = putButtonInSetArray[2].attributedTitle(for: .normal)
            let string3 = attributedText3!.string
            let attributes3 = attributedText3!.attributes(at: 0, effectiveRange: nil)
            attributeForCompare3.number = string3.numberAndShape.number
            attributeForCompare3.shape = string3.numberAndShape.shape
           
            var attributesForCards = [attributes1, attributes2, attributes3]
            
            var attributeForCompare = [attributeForCompare1, attributeForCompare2, attributeForCompare3]
           
            
            for i in 0...2{
                for key in attributesForCards[i].keys{
                var keyString = key.rawValue
                switch keyString{
                case "NSStrokeWidth" :do {
                    if attributesForCards[i][key] as? Int == 5{
                        //print("Shape is empty.")
                        
                        //prevent from override attribute, later in code I calculate shading by using
                        //another param so if this attribut happend after that one, this will make a mistake
                        
                            attributeForCompare[i].shading = .empty
                        
                        
                    }


                    }
                case "NSStrokeColor": do {
                    if attributesForCards[i][key] as? UIColor == UIColor.red{
                       // print("Red")
                        attributeForCompare[i].color = .red
                    }
                    if attributesForCards[i][key] as? UIColor == UIColor.green{
                        //print("Green")
                        attributeForCompare[i].color = .green
                    }
                    if attributesForCards[i][key] as? UIColor == UIColor.purple{
                        //print("Purple")
                        attributeForCompare[i].color = .purple
                    }
                    }
                case "NSColor": do{
                    //red
                    if attributesForCards[i][key] as? UIColor == UIColor.red.withAlphaComponent(1){
                        //print("Red and filled.")
                        attributeForCompare[i].color = .red
                        attributeForCompare[i].shading = .filled
                    }
                    if attributesForCards[i][key] as? UIColor == UIColor.red.withAlphaComponent(0.15){
                        //print("Red and striped.")
                        attributeForCompare[i].color = .red
                        attributeForCompare[i].shading = .striped
                    }

                    //green
                    if attributesForCards[i][key] as? UIColor == UIColor.green.withAlphaComponent(1){
                        //print("Green and filled.")
                        attributeForCompare[i].color = .green
                        attributeForCompare[i].shading = .filled
                    }
                    if attributesForCards[i][key] as? UIColor == UIColor.green.withAlphaComponent(0.15){
                        //print("Green and striped.")
                        attributeForCompare[i].color = .green
                        attributeForCompare[i].shading = .striped
                    }

                    if attributesForCards[i][key] as? UIColor == UIColor.purple.withAlphaComponent(1){
                        //print("Purple and filled.")
                        attributeForCompare[i].color = .purple
                        attributeForCompare[i].shading = .filled
                    }
                    if attributesForCards[i][key] as? UIColor == UIColor.purple.withAlphaComponent(0.15){
                        //print("Purple and striped.")
                        attributeForCompare[i].color = .purple
                        attributeForCompare[i].shading = .striped
                    }
                    }
                default : print("Error with attributes.")
                }

            }
            }
            
            attributeForCompare1 = attributeForCompare[0]
            attributeForCompare2 = attributeForCompare[1]
            attributeForCompare3 = attributeForCompare[2]
            
            

        }
        
        
    }
    
    func prepareForCheck() -> Bool{
        additionForPrepareForCheck()
//           print(" \(attributeForCompare1.shape), \(attributeForCompare1.number), \(attributeForCompare1.shading), \(attributeForCompare1.color)   ")
//           print(" \(attributeForCompare2.shape), \(attributeForCompare2.number), \(attributeForCompare2.shading), \(attributeForCompare2.color)   ")
//           print(" \(attributeForCompare3.shape), \(attributeForCompare3.number), \(attributeForCompare3.shading), \(attributeForCompare3.color)   ")
//
          if ((attributeForCompare1.shape == attributeForCompare2.shape && attributeForCompare1.shape == attributeForCompare3.shape && attributeForCompare2.shape == attributeForCompare3.shape)||(attributeForCompare1.shape != attributeForCompare2.shape && attributeForCompare1.shape != attributeForCompare3.shape && attributeForCompare2.shape != attributeForCompare3.shape)) && ((attributeForCompare1.number == attributeForCompare2.number && attributeForCompare1.number == attributeForCompare3.number && attributeForCompare2.number == attributeForCompare3.number)||(attributeForCompare1.number != attributeForCompare2.number && attributeForCompare1.number != attributeForCompare3.number && attributeForCompare2.number != attributeForCompare3.number)) && ((attributeForCompare1.shading == attributeForCompare2.shading && attributeForCompare1.shading == attributeForCompare3.shading && attributeForCompare2.shading == attributeForCompare3.shading)||(attributeForCompare1.shading != attributeForCompare2.shading && attributeForCompare1.shading != attributeForCompare3.shading && attributeForCompare2.shading != attributeForCompare3.shading)) && ((attributeForCompare1.color == attributeForCompare2.color && attributeForCompare1.color == attributeForCompare3.color && attributeForCompare2.color == attributeForCompare3.color)||(attributeForCompare1.color != attributeForCompare2.color && attributeForCompare1.color != attributeForCompare3.color && attributeForCompare2.color != attributeForCompare3.color))

           {
               return true
           } else{
               return false
           }

        
    }
    
    
    
    var buttonNames = [NSAttributedString]()
    
    func getButtonNames(){
        
        let attributes = [emptyRedAttribute, filledRedAttribute, stripedRedAttribute, emptyGreenAttribute, filledGreenAttribute, stripedGreenAttribute, emptyPurpleAttribute, filledPurpleAttribute, stripedPurpleAttribute]
        let strings = ["●", "●●", "●●●", "◼︎", "◼︎◼︎", "◼︎◼︎◼︎", "♦︎", "♦︎♦︎", "♦︎♦︎♦︎"]
        for attribute in attributes{
            for string in strings
            {
                let text = NSAttributedString(string: string, attributes: attribute
                                                                           
                )
                buttonNames.append(text)
            }
        }
        
        //randomButtonNames()
        
    }
    
    func randomButtonNames(){
        var randomNames = buttonNames
        var randomIndex: Int = 0
        for i in 0 ..< buttonNames.count{
            randomIndex = (Int(arc4random_uniform(UInt32(randomNames.count) - 1)))
            buttonNames[i] = randomNames.remove(at: randomIndex)

        }
    }

 
    func updateView(){
        if cardButtons.count <= 12 {
            for index in 0..<cardButtons.count{
                let button = cardButtons[index]
                var card = usedCards[index]
                if (!card.isFaceUp && !card.isMatched) || (card.isMatched && buttonNames.isEmpty) {
                        button.setAttributedTitle(nil, for: .normal)
                        button.backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                    
                    
                } else {
                    if !buttonNames.isEmpty{
                        
                        if button.attributedTitle(for: .normal) == nil || card.isMatched{
                            
                           button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                           button.setAttributedTitle(buttonNames.removeFirst(), for: .normal)
                            
                            
                            
                        }
                    }
                    
                    
                }
                if card.isMatched{
                   
                  if !set.cards.isEmpty{
                                    //ovde obrati paznju mozda imam memory lick, proveri tu dodelu vrednosti
                        usedCards[index] = set.cards.removeFirst()
                        usedCards[index].isFaceUp = true
                                }
                 else {
                                    
                       usedCards[index].isFaceUp = false
                                    
                                }
                                
                            }
                
            }
        } else{

                
                var step = 0
                var end = 0
                if setIsMade {
                    end = cardButtons.count - 3
                } else{
                    end = cardButtons.count
                }
                for iterator in 0..<end
                {
                    let button = cardButtons[iterator]
                    let card = usedCards[iterator]

                    if card.isMatched, step <= 3{
                        
                        while usedCards[iterator + step].isMatched{
                            step = step + 1
                            
                        }
                        
                        if step >= 3 {
                            step = 3
                        }


                        usedCards[iterator] = usedCards[iterator + step]
                        button.setAttributedTitle(cardButtons[iterator + step].attributedTitle(for: .normal), for: .normal)

                    }else {
                        
                        if usedCards[iterator + step].isMatched{
                            step += 1
                        }
                        if step >= 3 {
                            step = 3
                        }

                        usedCards[iterator] = usedCards[iterator + step]
                        usedCards[iterator].isFaceUp = true
                        button.setAttributedTitle(cardButtons[iterator + step].attributedTitle(for: .normal), for: .normal)
                    }


                }
                
                
                var tmpAddedButtons = [UIButton]()
            
            if setIsMade{
                for i in stride(from: 3, through: 1, by: -1){
                    let removedButton = cardButtons.remove(at: cardButtons.count - i)
                    tmpAddedButtons.append(removedButton)
                }
                for button in addedCardButtons{
                    tmpAddedButtons.append(button)
                }
                addedCardButtons = tmpAddedButtons
                
                for _ in 0...2{
                    usedCards.removeLast()
                }
        }
            }
            
        
        
        for card in addedCardButtons{
               card.setAttributedTitle(nil, for: .normal)
               card.backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
              }
        
    }
    

    
    var putButtonInSetArray = [UIButton]()
    var putCardsinSetArray = [Card]()
    var setIsMade : Bool = false
    var points = 0 {
        didSet{
            score.text = "score: \(points)"
        }
    }

    func checkIfisSet(){
            setIsMade = prepareForCheck()
            if setIsMade{
           
                if cardButtons.count == 12{
                    points = points + 5
                }
                if cardButtons.count == 15{
                    points = points + 4
                }
                if cardButtons.count == 18{
                    points = points + 3
                }
                if cardButtons.count == 21{
                    points = points + 2
                }
                if cardButtons.count == 24{
                    points = points + 1
                }
                print("set is made")
               
                for button in putButtonInSetArray{
                    
                   
                    
                    button.setAttributedTitle(nil, for: .normal)
                }
               for card in putCardsinSetArray{
                   card.isSelected = false
                   card.isMatched = true
               }
               
            } else{
                points = points - 3
                for button in putButtonInSetArray{
                    button.backgroundColor = UIColor.red.withAlphaComponent(0.2)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                    }
                }

                for card in putCardsinSetArray {
                card.isSelected = false
                
                }
                
        }
        print("Score is \(points)")

        putButtonInSetArray.removeAll()
        putCardsinSetArray.removeAll()
       }
    

           
    @IBAction func addThreeMoreCards(_ sender: UIButton) {
        if !addedCardButtons.isEmpty, set.cards.count > 0 {
            
            for _ in 0...2{
                cardButtons.insert(addedCardButtons.removeFirst(), at: cardButtons.count )
                
                usedCards.insert(set.cards.removeFirst(), at: usedCards.count)
                usedCards.last?.isFaceUp = true
                
            }
            for button in cardButtons{
                if button.attributedTitle(for: .normal) == nil{
                    button.setAttributedTitle(buttonNames.removeFirst(), for: .normal)
                    button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                }
            }
        }
    }
    @IBAction func deselectCard(_ sender: UIButton) {
        
            if !putButtonInSetArray.isEmpty && putButtonInSetArray.count != 3 {
                points = points - 1
                putCardsinSetArray.last?.isSelected = false
                putButtonInSetArray.last?.layer.borderWidth = 3.0
                putButtonInSetArray.last?.layer.borderColor = UIColor.white.cgColor
                putButtonInSetArray.removeLast()
                putCardsinSetArray.removeLast()
                
                
            }
        
        
    }
   
    
    @IBAction func touchCard(_ sender: UIButton) {
     
        
        if let cardNumber = cardButtons.index(of: sender) {
            //card is selected or not
            if !usedCards[cardNumber].isSelected {
                usedCards[cardNumber].isSelected = true
                //put in set array
                sender.layer.borderWidth = 3.0
                sender.layer.borderColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
                putButtonInSetArray.append(sender)
                putCardsinSetArray.append(usedCards[cardNumber])
                
            }
            if putCardsinSetArray.count == 3{
                
                checkIfisSet()
                for but in cardButtons{
                    but.layer.borderWidth = 0.0
                    but.layer.borderColor = UIColor.white.cgColor
                }
                updateView()
        }
    }
    
}
}


extension String {
    
   
    
    enum Shape: String{
        case circle, square , diamond , none
        
    }
    
    enum Number: String{
        case zero, one, two, three
    }
    
    var numberAndShape: (number: Number,shape: Shape) {
        switch self {
        case  "●":
            return (.one, .circle)
            
        case "●●":
            return (.two, .circle)
            
        case "●●●":
            return (.three, .circle)
            
        case  "◼︎":
            return (.one, .square)
            
        case "◼︎◼︎":
            return (.two, .square)
            
        case "◼︎◼︎◼︎":
            return (.three, .square)
            
        case  "♦︎":
            return (.one, .diamond)
            
        case "♦︎♦︎":
            return (.two, .diamond)
            
        case "♦︎♦︎♦︎":
            return (.three, .diamond)
            
        default:
            return (.zero, .none)
        }
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
