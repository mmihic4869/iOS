//
//  FightController.swift
//  Knight Fight
//
//  Created by Miloš Mihić on 13/10/2020.
//  Copyright © 2020 Cim. All rights reserved.
//


import Foundation

class FightController{
    
    
     func fight(fighter1:Soldier,fighter2:Soldier){
    
        
        while ( fighter1.isAlive && fighter2.isAlive){
            
            fighter1.strike(fighter: fighter2)
            fighter2.strike(fighter: fighter1)
            
            }
        
        if (fighter2.isAlive){
        print("The winner in this battle is \(fighter2.firstName) \(fighter2.lastName).")
            fighter2.takeSword(fighter: fighter1)
        }
        else{
        print("The winner in this battle is \(fighter1.firstName) \(fighter1.lastName).")
            fighter1.takeSword(fighter: fighter2)
    }
    }
    }
