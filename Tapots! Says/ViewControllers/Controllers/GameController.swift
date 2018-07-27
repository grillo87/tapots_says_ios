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
    
    
    public func playRound(color : Int, gameMode : Int) {
        
        if (color == gameSequence[currentGameElementPosition].getColor()) {
            
            updateGamePosition(gameMode:gameMode)
            gameViewController.playGoodSound()
            
            
            if (validateRoundEnd(gameMode : gameMode)) {
                
                generateNewRound(gameMode:gameMode)
                
            }
            
            
        } else {
            
            userLossLife()
            
        }
        
    }
    
    private func userLossLife() {
        
        gameViewController.playBadSound()
        
        
        switch (self.usersLives) {
            
        case (1):
            
            self.usersLives = self.usersLives - 1
            gameViewController.lostFirstLife()
            gameViewController.finishUserGame()
            
            
        case (2):
            
            self.usersLives = self.usersLives - 1
            gameViewController.lostSecondLife()
            
            
        case (3):
            
            self.usersLives = self.usersLives - 1
            gameViewController.lostThirdLife()
            
        default:
            
            print("Different value")
            
            
        }
        
    }
    
    private func updateGamePosition(gameMode : Int) {
        
        if (gameMode == GameConstants.NORMAL_MODE) {
            
            currentGameElementPosition = currentGameElementPosition + 1
            
        } else {
            
            currentGameElementPosition = currentGameElementPosition - 1
            
            
        }
        
    }
    
    private func generateNewRound(gameMode : Int) {
        
        var newIndexValues = 0
        
        if (gameMode == GameConstants.NORMAL_MODE) {
            
            newIndexValues = currentGameElementPosition
            
        } else {
            
            newIndexValues = calculateReverseGameRound()
            
        }
        
        generateGameSequence(gameRound : newIndexValues)
        gameViewController.setGameElementsDelay(newDelay: GameConstants.DELAY_UPDATE_FACTOR_VALUE)
        
        
    }
    
    private func calculateReverseGameRound() -> Int {
        
        var result = 0
        
        result = (gameSequence.count) - self.currentGameElementPosition
        
        return result
        
    }
    
    private func validateRoundEnd(gameMode : Int) -> Bool {
        
        var result = false
        
        if (gameMode == GameConstants.NORMAL_MODE) {
            
            if (currentGameElementPosition >= gameSequence.count) {
                
                result = true
                
            }
            
        } else {
            
            if (currentGameElementPosition < 0) {
                
                result = true
                
            }
            
        }
        
        return result
        
    }
    
    
}
