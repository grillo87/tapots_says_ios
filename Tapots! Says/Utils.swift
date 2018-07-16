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
    
    
    public static func getLabelTitle() -> NSMutableAttributedString {
        
        let titleString = NSMutableAttributedString(string: "TAPOTS!")
        titleString.addAttribute(NSAttributedStringKey.foregroundColor, value: Colors.blueDoots, range: NSRange(location:0,length:1))
        titleString.addAttribute(NSAttributedStringKey.foregroundColor, value: Colors.redDoots, range: NSRange(location:1,length:1))
        titleString.addAttribute(NSAttributedStringKey.foregroundColor, value: Colors.orangeDoots, range: NSRange(location:2,length:1))
        titleString.addAttribute(NSAttributedStringKey.foregroundColor, value: Colors.yellowDoots, range: NSRange(location:3,length:1))
        titleString.addAttribute(NSAttributedStringKey.foregroundColor, value: Colors.purpleDoots, range: NSRange(location:4,length:1))
        titleString.addAttribute(NSAttributedStringKey.foregroundColor, value: Colors.greenDoots, range: NSRange(location:5,length:1))
        titleString.addAttribute(NSAttributedStringKey.foregroundColor, value: Colors.white, range: NSRange(location:6,length:1))
        
        return titleString
        
    }
    
    
    public static func sortPlayers(players: [Players]) -> [Players] {
    
        let sortedPlayers = players.sorted { (firstValue, secondValue) in return firstValue.score < secondValue.score }
        return sortedPlayers
        
    }
    
    
}
