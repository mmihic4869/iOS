//
//  Soldier.swift
//  Knight Fight
//
//  Created by KTIOS2 on 10/24/19.
//  Copyright © 2019 Cim. All rights reserved.
//

import Foundation

class Soldier:Human{
    
    var strikeAgain : Bool = false 
    var basicAttack : Int
    var basicDefence : Int
    var soldierFlag : Bool 
    
    override init?(firstName:String, lastName:String, placeOfLiving:String?, healthPoints : Int) {
        self.basicAttack = 1
        self.basicDefence = 0
        self.soldierFlag = true
        super.init(firstName: firstName, lastName: lastName, placeOfLiving: placeOfLiving, healthPoints: healthPoints)
        
    }
        
    func totalAttack() -> Int{
        var attackValue: Int
        //let randomAttack = Int(arc4random_uniform(7))
        let randomAttack = Int.random (in: 0...4)
        attackValue = basicAttack + randomAttack
        
        return attackValue
    }

    func totalDefence() -> Int{
        var defenceValue: Int
        
        defenceValue = basicDefence
        
        return defenceValue
    }
    
    func strike(fighter:Soldier) -> Int{
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
        
        if( soldierFlag == true && attackValue > 4 && fighter.isAlive == true){
            print("***  COMBO STRIKE  *** \nSoldier \(self.lastName) will punch again!")
            strikeAgain = true
    
          if let commander = fighter as? Commander{
            if (attackValue == 5 && commander.droppedShield == false){
              if(commander.isAlive == true && commander.shield != nil){
                print("*Soldier \(self.lastName) made a very strong punch and Commander \(commander.lastName) dropped the shield*")
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
        }
        
        print("\tHEALTH POINTS : \(self.firstName) \(self.lastName) (\(self.healthPoints)) | \(fighter.firstName) \(fighter.lastName) (\(fighter.healthPoints))\n")
        
        if(strikeAgain == true && fighter.isAlive == true){
          strikeAgain = false
          strike(fighter:fighter)
        }
        

        return strikeValue
        
    }

    func dropShield(){}
    func takeShield(){}
    
    func takeSword(fighter:Soldier){
            if let knight = fighter as? Knight{
                if (knight.sword != nil){
                    knight.sword = nil
                    print("Soldier can't take a sword!")
                    }
                else {
                    print("Soldier can't take a sword! The opponent doesn't have a sword.")
                }
            }
                  
    }

}
    
    


