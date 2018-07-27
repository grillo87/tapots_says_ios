//
//  AlertViewController.swift
//  Tapots! Says
//
//  Created by José Grillo on 20/7/18.
//  Copyright © 2018 José Grillo. All rights reserved.
//

import UIKit

class AlertViewController: BaseDialogViewController {

    
    @IBOutlet weak var AlertLabel: UILabel!
    
    override public func setLabelText (text : String) {
        
        AlertLabel.text = text
        
    }
    
    
    @IBAction func CloseAlertDialog(_ sender: UIButton) {
        
        self.removeAnimate()
        
    }
    
    
    
}
