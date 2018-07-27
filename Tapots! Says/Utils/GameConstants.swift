//
//  GameConstants.swift
//  Tapots! Says
//
//  Created by José Grillo on 9/7/18.
//  Copyright © 2018 José Grillo. All rights reserved.
//

import Foundation

public class GameConstants {
    
    public static let DEFAULT_COLOR_VALUE = 0
    public static let BLUE_VALUE = 1
    public static let RED_VALUE = 2
    public static let GREEN_VALUE = 3
    public static let YELLOW_VALUE = 4
    
    public static let GOOD_SOUND = URL(fileURLWithPath: Bundle.main.path(forResource: "sounds/good", ofType: "mp3")!)
    public static let BAD_SOUND = URL(fileURLWithPath: Bundle.main.path(forResource: "sounds/bad", ofType: "mp3")!)
    public static let BLUE_SOUND = URL(fileURLWithPath: Bundle.main.path(forResource: "sounds/simonblue", ofType: "mp3")!)
    public static let RED_SOUND = URL(fileURLWithPath: Bundle.main.path(forResource: "sounds/simonred", ofType: "mp3")!)
    public static let GREEN_SOUND = URL(fileURLWithPath: Bundle.main.path(forResource: "sounds/simongreen", ofType: "mp3")!)
    public static let YELLOW_SOUND = URL(fileURLWithPath: Bundle.main.path(forResource: "sounds/simonyellow", ofType: "mp3")!)
    
    public static let NORMAL_MODE = 1
    public static let REVERSE_MODE = 2
    
    public static let NORMAL_TITLE = "Modo Normal de Juego"
    public static let REVERSE_TITLE = "Modo Inverso de Juego"
    
    public static let INITIAL_GAME_DELAY_VALUE : Double = 1
    public static let DELAY_UPDATE_FACTOR_VALUE : Double = 0.02
    
    public static let NEW_GAME_VALUE = 1
    public static let MENU_VALUE = 2
    
    
    
}
