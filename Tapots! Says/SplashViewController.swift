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
    
    @IBOutlet weak var BlueCircle: CircleDrawer!
    @IBOutlet weak var RedCircle: CircleDrawer!
    @IBOutlet weak var GreenCircle: CircleDrawer!
    @IBOutlet weak var YellowCircle: CircleDrawer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TitleNameLabel.attributedText = Utils.getLabelTitle()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewDidAppear(false)
        
        TitleNameLabel.fadeIn()
        SaysLabel.fadeIn()
        
        setBlueCircle()
        setRedCircle()
        setYellowCircle()
        setGreenCircle()
 
        
    }
    
    private func setBlueCircle() {
    
        BlueCircle.setBackground(background: Colors.blueDoots)
        BlueCircle.setStartAngle(startAngle: 0)
        BlueCircle.setEndAngle(endAngle: 25)
        BlueCircle.setQuaterPosition(quaterPosition: GameConstants.BLUE_VALUE)
        
        bounceBlueCircle()
    
    }
    
    private func setRedCircle() {
    
        RedCircle.setBackground(background: Colors.redDoots)
        RedCircle.setStartAngle(startAngle: 25)
        RedCircle.setEndAngle(endAngle: 50)
        RedCircle.setQuaterPosition(quaterPosition:GameConstants.RED_VALUE)
    
    }
    
    private func setYellowCircle() {
        
        YellowCircle.setBackground(background: Colors.yellowDoots)
        YellowCircle.setStartAngle(startAngle: 50)
        YellowCircle.setEndAngle(endAngle: 75)
        YellowCircle.setQuaterPosition(quaterPosition:GameConstants.YELLOW_VALUE)
    
        
        
    }
    
    private func setGreenCircle() {
        
        GreenCircle.setBackground(background: Colors.greenDoots)
        GreenCircle.setStartAngle(startAngle: 75)
        GreenCircle.setEndAngle(endAngle: 100)
        GreenCircle.setQuaterPosition(quaterPosition:GameConstants.GREEN_VALUE)
        
    }
    
    
    
    private func bounceBlueCircle() {
        
        self.BlueCircle.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.4,
                       initialSpringVelocity: 0.1,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        self?.BlueCircle.transform = .identity
            },
                       completion: { _ in
                        
                        self.bounceRedCircle()
                        
        })
        
    }
    
    private func bounceRedCircle() {
        
        self.RedCircle.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.4,
                       initialSpringVelocity: 0.1,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        self?.RedCircle.transform = .identity
            },
                       completion: { _ in
                        
                        self.bounceYellowCircle()
                        
                        
        })
        
    }
    
    
    private func bounceGreenCircle() {
        
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
                        
                        self.bounceBlueCircle()
                        self.performSegue(withIdentifier: "MenuSegue", sender: self)
                        
                        
        })
        
    }
    
    private func bounceYellowCircle() {
        
        self.YellowCircle.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        UIView.animate(withDuration: 1.5,
                       delay: 0,
                       usingSpringWithDamping: 0.4,
                       initialSpringVelocity: 0.1,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        self?.YellowCircle.transform = .identity
            },
                       completion: { _ in
                        
                        self.bounceGreenCircle()
                        
                        
        })
        
    }
    

}

extension UIView {
    
    func fadeIn(_ duration: TimeInterval = 3.0, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: completion)  }
}
