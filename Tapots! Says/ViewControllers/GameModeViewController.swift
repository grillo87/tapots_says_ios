//
//  GameModeViewController.swift
//  Tapots! Says
//
//  Created by José Grillo on 11/7/18.
//  Copyright © 2018 José Grillo. All rights reserved.
//

import UIKit

class GameModeViewController: BaseViewController {

    
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var NormalGameButton: UIButton!
    @IBOutlet weak var InverseGameButton: UIButton!
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let gameViewController = segue.destination as? GameViewController {
                
                if let buttonSender = sender as? UIButton {
                    
                    if buttonSender.tag == NormalGameButton.tag {
                        
                        gameViewController.gameMode = GameConstants.NORMAL_MODE
                        
                        
                    } else {
                        
                        gameViewController.gameMode = GameConstants.REVERSE_MODE
                        
                    }
                
                }
                
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        TitleLabel.attributedText = Utils.getLabelTitle()
        setButtonBordersColors()

        
        
    }
    
    private func setButtonBordersColors(){
        
        NormalGameButton.layer.borderColor = UIColor(named: "white")!.cgColor
        InverseGameButton.layer.borderColor = UIColor(named: "white")!.cgColor
        
    }


}
