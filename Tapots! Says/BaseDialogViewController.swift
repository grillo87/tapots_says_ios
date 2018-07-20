//
//  BaseDialogViewController.swift
//  Tapots! Says
//
//  Created by José Grillo on 20/7/18.
//  Copyright © 2018 José Grillo. All rights reserved.
//

import Foundation
import UIKit

public class BaseDialogViewController : BaseViewController {
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        showAnimate()
        
    }
    
    public func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    public func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    
    
    public func setLabelText (text : String) {
        
        
        
    }
    
    
}
