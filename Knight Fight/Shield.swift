//
//  Shield.swift
//  Knight Fight
//
//  Created by KTIOS2 on 10/24/19.
//  Copyright © 2019 Cim. All rights reserved.
//

import Foundation


class Shield{
    
    var counter : Int = 0
    var defence : Int {
        get{
            
            if (counter<3)
            {
                
                return 1
                
                
            }
            else {
                
                
                return 0
            }
        }
    }
    
    func useShield() -> Int{
        let def = self.defence
        self.counter += 1
        return def
    }
    
}
