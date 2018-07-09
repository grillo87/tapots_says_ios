//
//  Utils.swift
//  Tapots! Says
//
//  Created by José Grillo on 9/7/18.
//  Copyright © 2018 José Grillo. All rights reserved.
//

import Foundation

public class Utils {
    
    public static func randomInt () -> Int {
        
        let randomInt = Int(arc4random_uniform(UInt32(GameConstants.YELLOW_VALUE)) + UInt32(GameConstants.BLUE_VALUE))
        return randomInt
        
    }
    
    
}
