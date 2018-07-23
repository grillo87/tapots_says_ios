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
    
    @IBOutlet weak var BlueCircle: CircleDrawer!
    
    @IBOutlet weak var YellowCircle: CircleDrawer!
    
    @IBOutlet weak var GreenCircle: CircleDrawer!
    
    @IBOutlet weak var RedCircle: CircleDrawer!
    
    
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
        setNavigationBar()
        
        setBlueCircle()
        setRedCircle()
        setYellowCircle()
        setGreenCircle()

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setNavigationBar() {
        
        let navigationBarAppearace = UINavigationBar.appearance()
        
        navigationBarAppearace.tintColor = UIColor(named: "white")!
        navigationBarAppearace.barTintColor = UIColor(named: "darkerBlue")!
        navigationBarAppearace.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor(named: "white")!]
        
    }
    
    
    private func setButtonBordersColors(){
        
        NormalGameButton.layer.borderColor = UIColor(named: "white")!.cgColor
        InverseGameButton.layer.borderColor = UIColor(named: "white")!.cgColor
        
    }
    
    
    private func setBlueCircle() {
        
        BlueCircle.setBackground(background: UIColor(named: "blueDoots")!)
        BlueCircle.setStartAngle(startAngle: 0)
        BlueCircle.setEndAngle(endAngle: 25)
        BlueCircle.setQuaterPosition(quaterPosition: GameConstants.BLUE_VALUE)
        
        bounceBlueCircle()
        
    }
    
    private func setRedCircle() {
        
        RedCircle.setBackground(background: UIColor(named: "redDoots")!)
        RedCircle.setStartAngle(startAngle: 25)
        RedCircle.setEndAngle(endAngle: 50)
        RedCircle.setQuaterPosition(quaterPosition:GameConstants.RED_VALUE)
        
    }
    
    private func setYellowCircle() {
        
        YellowCircle.setBackground(background: UIColor(named: "yellowDoots")!)
        YellowCircle.setStartAngle(startAngle: 50)
        YellowCircle.setEndAngle(endAngle: 75)
        YellowCircle.setQuaterPosition(quaterPosition:GameConstants.YELLOW_VALUE)
        
    }
    
    private func setGreenCircle() {
        
        GreenCircle.setBackground(background: UIColor(named: "greenDoots")!)
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
