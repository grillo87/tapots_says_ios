//
//  GameViewController.swift
//  Tapots! Says
//
//  Created by José Grillo on 12/7/18.
//  Copyright © 2018 José Grillo. All rights reserved.
//

import UIKit
import AVFoundation

class GameViewController: BaseViewController {
    
    var gameMode : Int!
    var gameRound : Int!
    var gameController : GameController!
    var isPlayingSequence : Bool = false
    var gameSequenceIndex : Int!
    var gameElementDelay : Double!
    
    var audioPlayerGood = AVAudioPlayer()
    var audioPlayerBad = AVAudioPlayer()
    
    var audioPlayerBlue = AVAudioPlayer()
    var audioPlayerRed = AVAudioPlayer()
    var audioPlayerGreen = AVAudioPlayer()
    var audioPlayerYellow = AVAudioPlayer()
    
    @IBOutlet weak var FirstHearth: UIImageView!
    @IBOutlet weak var SecondHearth: UIImageView!
    @IBOutlet weak var ThirdHearth: UIImageView!
    
    @IBOutlet weak var GameRoundLabel: UILabel!
    
    @IBAction func colorSelected(recognizer:UITapGestureRecognizer) {
        
        if (self.isPlayingSequence == false) {
            
            switch recognizer.view?.tag {
            case GameConstants.BLUE_VALUE:
                bounceBlueCircle(playNext: false, gameElements: nil)
                gameController.playRound(color: GameConstants.BLUE_VALUE, gameMode: self.gameMode)
                
            case GameConstants.RED_VALUE:
                bounceRedCircle(playNext: false, gameElements: nil)
                gameController.playRound(color: GameConstants.RED_VALUE, gameMode: self.gameMode)
                
            case GameConstants.GREEN_VALUE:
                bounceGreenCircle(playNext: false, gameElements: nil)
                gameController.playRound(color: GameConstants.GREEN_VALUE, gameMode: self.gameMode)
                
            case GameConstants.YELLOW_VALUE:
                bounceYellowCircle(playNext: false, gameElements: nil)
                gameController.playRound(color: GameConstants.YELLOW_VALUE, gameMode: self.gameMode)
                
            default:
                print("No color")
            }
            
            
            
            
        }
        
    }
    
    
    public func setGameRound(gameRound : Int) {
        
        self.gameRound = gameRound
        GameRoundLabel.text = "Round: \(gameRound)"
        
        
    }
    
    public func finishUserGame() {
        
        self.performSegue(withIdentifier: "FinishGameSegue", sender: self)
        
    }
    
    
    public func lostFirstLife() {
        
        FirstHearth.image = UIImage(named: "heart_off")
        
    }
    
    public func lostSecondLife() {
        
        SecondHearth.image = UIImage(named: "heart_off")
        
    }
    
    public func lostThirdLife() {
        
        ThirdHearth.image = UIImage(named: "heart_off")
        
    }
    
    
    public func initializeGameSequenceIndex() {
        
        self.gameSequenceIndex = 0
        self.isPlayingSequence = false
        
    }
    
    
    public func getGameRound() -> Int {
        
        return self.gameRound
        
    }
    
    public func setGameElementsDelay(newDelay : Double) {
        
        self.gameElementDelay = self.gameElementDelay - newDelay;
        
    }
    
    
    
    
    
    private func initGame() {
        
        self.gameElementDelay = GameConstants.INITIAL_GAME_DELAY_VALUE
        self.setGameRound(gameRound: 0)
        self.gameController = GameController(gameViewController : self, gameMode : self.gameMode)
        self.gameController.generateGameSequence(gameRound: self.getGameRound())
        
    }
    
    public func setPlayingSequence(playingSequence : Bool) {
        
        self.isPlayingSequence = playingSequence;
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewControllerTitle()
        initializeGameSequenceIndex()
        initSounds()
        initGame()
        
    }
    
    
    private func initSounds() {
        
        do {
            
            try audioPlayerGood = AVAudioPlayer(contentsOf: GameConstants.GOOD_SOUND)
            audioPlayerGood.prepareToPlay()
            
            try audioPlayerBad = AVAudioPlayer(contentsOf: GameConstants.BAD_SOUND)
            audioPlayerBad.prepareToPlay()
            
            try audioPlayerBlue = AVAudioPlayer(contentsOf: GameConstants.BLUE_SOUND)
            audioPlayerBlue.prepareToPlay()
            
            try audioPlayerRed = AVAudioPlayer(contentsOf: GameConstants.RED_SOUND)
            audioPlayerRed.prepareToPlay()
            
            try audioPlayerGreen = AVAudioPlayer(contentsOf: GameConstants.GREEN_SOUND)
            audioPlayerGreen.prepareToPlay()
            
            try audioPlayerYellow = AVAudioPlayer(contentsOf: GameConstants.YELLOW_SOUND)
            audioPlayerYellow.prepareToPlay()
            
        } catch {
            
            print("Sounds error: \(error).")
            
        }
        
        
    }
    
    public func playGoodSound() {
        
        audioPlayerGood.play()
        
    }
    
    
    public func playBadSound() {
        
        audioPlayerBad.play()
        
    }
    
    private func setViewControllerTitle() {
        
        if (self.gameMode == GameConstants.NORMAL_MODE) {
            
            self.navigationItem.title = GameConstants.NORMAL_TITLE
            
        } else {
            
            self.navigationItem.title = GameConstants.REVERSE_TITLE
            
        }
        
        
    }
    
    
    public func playGameSequence(gameSequence : [GameElement]) {
        
        if (self.gameSequenceIndex <= gameSequence.count - 1) {
            
            let gameElement : GameElement = gameSequence[gameSequenceIndex]
            
            switch (gameElement.getColor()) {
                
            case (GameConstants.BLUE_VALUE):
                
                audioPlayerBlue.play()
                bounceBlueCircle(playNext: true, gameElements: gameSequence)
                
            case (GameConstants.RED_VALUE):
                
                audioPlayerRed.play()
                bounceRedCircle(playNext: true, gameElements: gameSequence)
                
            case (GameConstants.GREEN_VALUE):
                
                audioPlayerGreen.play()
                bounceGreenCircle(playNext: true, gameElements: gameSequence)
                
            case (GameConstants.YELLOW_VALUE):
                
                audioPlayerYellow.play()
                bounceYellowCircle(playNext: true, gameElements: gameSequence)
                
            default:
                print("No color")
                
            }
            
            self.gameSequenceIndex = self.gameSequenceIndex + 1
            
        } else {
            
            initializeGameSequenceIndex();
            
        }
        
        
    }
    
    
    override public func setBlueCircle() {
        
        BlueCircle.setBackground(background: UIColor(named: "blueDoots")!)
        BlueCircle.setStartAngle(startAngle: 0)
        BlueCircle.setEndAngle(endAngle: 25)
        BlueCircle.setQuaterPosition(quaterPosition: GameConstants.BLUE_VALUE)
        
    }
    
    
    private func bounceBlueCircle(playNext : Bool, gameElements : [GameElement]?) {
        
        self.BlueCircle.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        UIView.animate(withDuration: self.gameElementDelay,
                       delay: 0,
                       usingSpringWithDamping: 0.4,
                       initialSpringVelocity: 0.1,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        self?.BlueCircle.transform = .identity
            },
                       completion: { _ in
                        
                        if (playNext) {
                            
                            self.playGameSequence(gameSequence: gameElements!)
                            
                            
                        }
                        
        })
        
    }
    
    private func bounceRedCircle(playNext : Bool, gameElements : [GameElement]?) {
        
        self.RedCircle.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        UIView.animate(withDuration: self.gameElementDelay,
                       delay: 0,
                       usingSpringWithDamping: 0.4,
                       initialSpringVelocity: 0.1,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        self?.RedCircle.transform = .identity
            },
                       completion: { _ in
                        
                        if (playNext) {
                            
                            self.playGameSequence(gameSequence: gameElements!)
                            
                            
                        }
                        
                        
        })
        
    }
    
    
    private func bounceGreenCircle(playNext : Bool, gameElements : [GameElement]?) {
        
        self.GreenCircle.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        UIView.animate(withDuration: self.gameElementDelay,
                       delay: 0,
                       usingSpringWithDamping: 0.4,
                       initialSpringVelocity: 0.1,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        self?.GreenCircle.transform = .identity
            },
                       completion: { _ in
                        
                        if (playNext) {
                            
                            self.playGameSequence(gameSequence: gameElements!)
                            
                            
                        }
                        
        })
        
    }
    
    private func bounceYellowCircle(playNext : Bool, gameElements : [GameElement]?) {
        
        self.YellowCircle.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        UIView.animate(withDuration: self.gameElementDelay,
                       delay: 0,
                       usingSpringWithDamping: 0.4,
                       initialSpringVelocity: 0.1,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        self?.YellowCircle.transform = .identity
            },
                       completion: { _ in
                        
                        if (playNext) {
                            
                            self.playGameSequence(gameSequence: gameElements!)
                            
                            
                        }
                        
        })
        
    }
    
}
