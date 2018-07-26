//
//  Gate.swift
//  Circuit Thinger
//
//  Created by Spenser Kline on 7/26/18.
//  Copyright © 2018 Spencer Kline. All rights reserved.
//

import Foundation

class Gate {
    var gateType: String = ""
    init(gateType: String){
        self.gateType = gateType
    }
    
    func output(input1: Bool, input2: Bool) -> Bool{
        if(self.gateType == "AND"){
            return input1 && input2
        }else if(self.gateType == "NAND"){
            return !(input1 && input2)
        }
        
        return false
    }
    
}
