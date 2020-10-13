//
//  Knight.swift
//  Knight Fight
//
//  Created by KTIOS2 on 10/24/19.
//  Copyright © 2019 Cim. All rights reserved.
//

import Foundation

class Knight:Soldier{
    
    var sword : Sword?
        init?(firstName: String, lastName: String, placeOfLiving: String, sword:Sword?, healthPoints: Int) {
            self.sword=sword
        super.init(firstName: firstName, lastName: lastName, placeOfLiving: placeOfLiving, healthPoints: healthPoints)
            basicDefence = 1
            basicAttack = 2
            soldierFlag = false
            
    }
            
    override func totalAttack() -> Int {
        var attackValue : Int
        //let randomAttack = Int(arc4random_uniform(4))
        let randomAttack = Int.random (in: 0...3)
        if let sword = sword {
            
            attackValue = basicAttack + randomAttack + sword.swordBasicAttack
            
        }
        else{
            
            attackValue = basicAttack + randomAttack
            
        }
        return attackValue
    }
    
    override func totalDefence() -> Int {
        var defenceValue: Int
        
        defenceValue = basicDefence
        
        return defenceValue
        
    }

    override func strike(fighter:Soldier) -> Int{
        if (self.isAlive == false){
            return 0
        }
        let attackValue  = self.totalAttack()
        let defenceValue = fighter.totalDefence()
        
        var strikeValue = attackValue - defenceValue
        
        if (strikeValue<0){
            
            strikeValue=0
            
        }
        var healthPointsCheckNegative : Int
        healthPointsCheckNegative = fighter.healthPoints - strikeValue
        
        if (healthPointsCheckNegative<0){
            fighter.healthPoints = 0
        }
        else{
            fighter.healthPoints -= strikeValue
        }
        
        print("\(self.firstName) \(self.lastName) attacks \(fighter.firstName) \(fighter.lastName). The attacker has attack value of \(attackValue), and the defender has defence value of \(defenceValue). Fighter \(fighter.firstName) \(fighter.lastName) will lose \(strikeValue) health points.")
        
          if let commander = fighter as? Commander{
            if (attackValue == 6 && commander.droppedShield == false){
              if(commander.isAlive == true && commander.shield != nil){
                print("*Knight \(self.lastName) made a very strong punch and Commander \(commander.lastName) dropped the shield*")
                commander.dropShield()
                commander.droppedShield = false
              }
            } else {

              if(commander.droppedShield == true){
                print("*The deffender was kicked so many times and he is powerless to defend himself with shiled anymore.*")
                commander.droppedShield = false
        }
              
            }
          }
        
        print("\tHEALTH POINTS : \(self.firstName) \(self.lastName) (\(self.healthPoints)) | \(fighter.firstName) \(fighter.lastName) (\(fighter.healthPoints))\n")
                
        if(strikeAgain == true && fighter.isAlive == true){
          strikeAgain = false
          strike(fighter:fighter)
        }
        

        return strikeValue
        
    }

    override func takeSword(fighter:Soldier){
        
        if (self.sword == nil) {
            if let knight = fighter as? Knight{
                if (knight.sword != nil){
                    self.sword = knight.sword
                    knight.sword = nil
                    print("The Knight \(self.lastName) doesn't have a sword and he will take the sword.")
                    }
                else {
                    print("The Knight \(self.lastName) can take the sword, but the opponent doesn't have it.")
                }
            }
                    
        }
        
    }
}

        


