//
//  GameElement.swift
//  Tapots! Says
//
//  Created by José Grillo on 9/7/18.
//  Copyright © 2018 José Grillo. All rights reserved.
//

import Foundation

public class GameElement {
    
    private var color : Int
    // Sound
    
    init (color :Int) {
    
    self.color = color
    
    }
    
    
    func setColor (color :Int) {
        
        self.color = color
        
    }
    
    func getColor () -> Int {
        
        return self.color
        
    }

    
}

