//
//  FinishGameViewController.swift
//  Tapots! Says
//
//  Created by José Grillo on 26/7/18.
//  Copyright © 2018 José Grillo. All rights reserved.
//

import UIKit

class FinishGameViewController: BaseViewController {
    
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var NewGameButton: UIButton!
    @IBOutlet weak var MenuGameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TitleLabel.attributedText = Utils.getLabelTitle()
        setButtonBordersColors()
    }
    
    
    @IBAction func GoBackToGameMode(_ sender: UIButton) {
        
        let targetController: UIViewController = navigationController!.viewControllers[navigationController!.viewControllers.count - 3]
        
        navigationController?.popToViewController(targetController, animated: true)
        
    }
    
    
    @IBAction func GoBackToMenu(_ sender: UIButton) {
        
        _ = navigationController?.popToRootViewController(animated: true)
        
    }
    
    
    override public func setNavigationBar() {
        
        super.setNavigationBar()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Finalizar", style: .done, target: self, action:#selector(self.displayConfirmation(sender:)))
        
        
    }
    
    
    @objc func displayConfirmation(sender: AnyObject) {
        _ = navigationController?.popToRootViewController(animated: true)
    }
    
    
    private func setButtonBordersColors(){
        
        NewGameButton.layer.borderColor = UIColor(named: "white")!.cgColor
        MenuGameButton.layer.borderColor = UIColor(named: "white")!.cgColor
        
    }
    
}
