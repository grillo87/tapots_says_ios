//
//  LoadingViewController.swift
//  Tapots! Says
//
//  Created by José Grillo on 20/7/18.
//  Copyright © 2018 José Grillo. All rights reserved.
//

import UIKit

class LoadingViewController: BaseDialogViewController {

    @IBOutlet weak var LoadingLabel: UILabel!
    
    
    override public func setLabelText (text : String) {
        
        LoadingLabel.text = text
        
    }

}
