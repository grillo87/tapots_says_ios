//
//  OptionsViewController.swift
//  Tapots! Says
//
//  Created by José Grillo on 11/7/18.
//  Copyright © 2018 José Grillo. All rights reserved.
//

import UIKit

class OptionsViewController: BaseViewController {
    
    @IBAction func TopPlayersSelected(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "TopPlayersSegue", sender: self)
        
    }
    
    @IBAction func NewGameSelected(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "GameModeSegue", sender: self)
        
    }
    
    
    
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var NewGameButton: UIButton!
    @IBOutlet weak var TopPlayersButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TitleLabel.attributedText = Utils.getLabelTitle()
        setButtonBordersColors()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setButtonBordersColors(){
        
        NewGameButton.layer.borderColor = UIColor(named: "white")!.cgColor
        TopPlayersButton.layer.borderColor = UIColor(named: "white")!.cgColor
        
    }


}
