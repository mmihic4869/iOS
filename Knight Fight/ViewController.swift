//
//  ViewController.swift
//  Knight Fight
//
//  Created by KTIOS2 on 10/24/19.
//  Copyright © 2019 Cim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    func fight(_ fighter1: Soldier, _ fighter2: Soldier){
//    while fighter1.healthPoints != 0 && fighter2.healthPoints != 0{
//        fighter1.strike(fighter: fighter2)
//        fighter2.strike(fighter: fighter1)
//    }
//    }
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var shield = Shield()
        var shield2 = Shield()
        var shield1 = Shield()
        var sword1 = Sword()
        //var civillian = Human.init(firstName: "Peter", lastName: "Baelish", placeOfLiving: "Harenhall")
        //var soldier = Human.init(firstName: "Robert", lastName: "Baratheon", placeOfLiving: "Dragonstone")
        //var knight = Human.init(firstName: "Eddard", lastName: "Stark", placeOfLiving: "Winterfell")
        
        var soldier1 = Soldier(firstName: "Milos", lastName: "Mihic", placeOfLiving: "Novi Sad", healthPoints : 20)
        //var soldier2 = Soldier.init(firstName: "Eddard", lastName: "Stark", placeOfLiving: "Winterfell")
		var knight1 = Knight.init(firstName: "Ragnar", lastName: "Lothbrok", placeOfLiving: "Kategat", sword: sword1, healthPoints : 20)
        //var knight2 = Knight.init(firstName: "Aegon", lastName: "Targaryen", placeOfLiving: "Valiria",sword: nil)
        var commander1 = Commander.init(firstName: "Jon", lastName: "Snow", placeOfLiving: "Castle Black", sword: nil, shield: shield1, healthPoints : 20)
       // var commander2 = Commander.init(firstName: "Robert", lastName: "Baratheon", placeOfLiving: "Dragonstone", sword: sword1 , shield: shield1)
        
        var hit = soldier1?.strike(fighter: knight1!)
        print(hit)
        
        let fight = FightController()
        fight.fight(fighter1: soldier1!, fighter2: knight1!)
        //fight(soldier1!, knight1!)
        
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

