//
//  SplashViewController.swift
//  Tapots! Says
//
//  Created by José Grillo on 9/7/18.
//  Copyright © 2018 José Grillo. All rights reserved.
//

import UIKit

class SplashViewController: BaseViewController {
    
    @IBOutlet weak var TitleNameLabel: UILabel!
    @IBOutlet weak var SaysLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TitleNameLabel.attributedText = Utils.getLabelTitle()
        
        
    }
    
    override public func bounceGreenCircle() {
        
        self.GreenCircle.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.4,
                       initialSpringVelocity: 0.1,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        self?.GreenCircle.transform = .identity
            },
                       completion: { _ in
                        
                        super.bounceBlueCircle()
                        self.performSegue(withIdentifier: "MenuSegue", sender: self)
                        
                        
        })
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewDidAppear(false)
        
        TitleNameLabel.fadeIn()
        SaysLabel.fadeIn()
        
        
    }
    
    
}

extension UIView {
    
    func fadeIn(_ duration: TimeInterval = 3.0, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: completion)  }
}
