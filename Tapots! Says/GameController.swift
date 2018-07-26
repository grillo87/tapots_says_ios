//
//  GameController.swift
//  Tapots! Says
//
//  Created by José Grillo on 23/7/18.
//  Copyright © 2018 José Grillo. All rights reserved.
//

import Foundation

public class GameController {
    
    var gameSequence : [GameElement]
    var currentGameElementPosition : Int
    var gameViewController : GameViewController
    var gameElements : Int
    var gameMode : Int
    var usersLives : Int
    
    init(gameViewController : GameViewController, gameMode : Int) {
        
        self.gameViewController = gameViewController
        self.gameMode = gameMode
        self.gameElements = 3
        self.usersLives = 3
        self.currentGameElementPosition = 0
        self.gameSequence = []
        
    }
    
    
    public func generateGameSequence(gameRound : Int) {
        
        gameViewController.setGameRound(gameRound : gameViewController.getGameRound() + 1);
        
        let gameListElements : Int = self.gameElements
        self.gameElements = self.gameElements + 1
        self.gameSequence = []
        
        for _ in 0..<gameListElements {
            
            self.gameSequence.append(generateGameElementRandom())
            
        }
        
        setInitialCurrentGameElementPosition(gameMode: self.gameMode)
        self.gameViewController.setPlayingSequence(playingSequence:true)
        self.gameViewController.playGameSequence(gameSequence : gameSequence)
        
        
    }
    
    private func generateGameElementRandom() -> GameElement {
        
        let gameElement : GameElement = GameElement()
        gameElement.setColor(color : Utils.randomInt())
        
        return gameElement;
        
    }
    
    public func getGameSequence() -> [GameElement] {
        return self.gameSequence
    }
    
    
    private func setInitialCurrentGameElementPosition(gameMode : Int) {
        
        if (self.gameMode == GameConstants.NORMAL_MODE) {
            
            self.currentGameElementPosition = 0
            
        } else {
            
            self.currentGameElementPosition = gameSequence.count - 1
            
        }
        
    }
    
    
}
