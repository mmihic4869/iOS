//
//  Human.swift
//  Knight Fight
//
//  Created by KTIOS2 on 10/24/19.
//  Copyright © 2019 Cim. All rights reserved.
//

import Foundation
import UIKit

class Human{
    var firstName : String
    var lastName : String
    var placeOfLiving : String?
    var healthPoints : Int
    var isAlive : Bool {
        
        get {
            if (self.healthPoints>0){
                
                return true
            }
            else{
                
                return false
            }
            
            
        }
        
    }
    var imageName : String

    init?(firstName:String, lastName:String, placeOfLiving:String?, healthPoints : Int){
        self.firstName = firstName
        self.lastName = lastName
        self.placeOfLiving = placeOfLiving
        if(healthPoints<10) 
		{
			print("The fihter has very low level of lealth points. Put more then 10. ")
			return nil}
			else{
		self.healthPoints = healthPoints
        }
		self.imageName = "img1"
    }

}

