//
//  BaseViewController.swift
//  Tapots! Says
//
//  Created by José Grillo on 9/7/18.
//  Copyright © 2018 José Grillo. All rights reserved.
//

import UIKit
import ChameleonFramework

public class BaseViewController: UIViewController {
    
    @IBOutlet weak var BlueCircle: CircleDrawer! = nil
    @IBOutlet weak var GreenCircle: CircleDrawer! = nil
    @IBOutlet weak var YellowCircle: CircleDrawer! = nil
    @IBOutlet weak var RedCircle: CircleDrawer! = nil
    
    struct AppUtility {
        
        static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
            
            if let delegate = UIApplication.shared.delegate as? AppDelegate {
                delegate.orientationLock = orientation
            }
        }
        
        /// OPTIONAL Added method to adjust lock and rotate to the desired orientation
        static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {
            
            self.lockOrientation(orientation)
            
            UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
        }
        
    }
    
    override public var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        AppUtility.lockOrientation(.portrait)
        setBackgroundFrame()
        setNavigationBar()
        
        setBlueCircle()
        setRedCircle()
        setYellowCircle()
        setGreenCircle()
        
    }
    
    private func setBackgroundFrame() {
        
        let gradientColorBackground = GradientColor(.diagonal, frame: self.view.frame, colors: [UIColor(named: "black")!, UIColor(named: "darkerBlue")!,UIColor(named: "blueDoots")! ])
        self.view.backgroundColor = gradientColorBackground
        
    }
    
    
    public func setNavigationBar() {
        
        let navigationBarAppearace = UINavigationBar.appearance()
        
        navigationBarAppearace.tintColor = UIColor(named: "white")!
        navigationBarAppearace.barTintColor = UIColor(named: "darkerBlue")!
        navigationBarAppearace.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor(named: "white")!]
        
    }
    
    public func setBlueCircle() {
        
        BlueCircle.setBackground(background: UIColor(named: "blueDoots")!)
        BlueCircle.setStartAngle(startAngle: 0)
        BlueCircle.setEndAngle(endAngle: 25)
        BlueCircle.setQuaterPosition(quaterPosition: GameConstants.BLUE_VALUE)
        
        bounceBlueCircle()
        
    }
    
    public func setRedCircle() {
        
        RedCircle.setBackground(background: UIColor(named: "redDoots")!)
        RedCircle.setStartAngle(startAngle: 25)
        RedCircle.setEndAngle(endAngle: 50)
        RedCircle.setQuaterPosition(quaterPosition:GameConstants.RED_VALUE)
        
    }
    
    public func setYellowCircle() {
        
        YellowCircle.setBackground(background: UIColor(named: "yellowDoots")!)
        YellowCircle.setStartAngle(startAngle: 50)
        YellowCircle.setEndAngle(endAngle: 75)
        YellowCircle.setQuaterPosition(quaterPosition:GameConstants.YELLOW_VALUE)
        
        
        
    }
    
    public func setGreenCircle() {
        
        GreenCircle.setBackground(background: UIColor(named: "greenDoots")!)
        GreenCircle.setStartAngle(startAngle: 75)
        GreenCircle.setEndAngle(endAngle: 100)
        GreenCircle.setQuaterPosition(quaterPosition:GameConstants.GREEN_VALUE)
        
    }
    
    
    
    public func bounceBlueCircle() {
        
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
    
    public func bounceRedCircle() {
        
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
    
    
    public func bounceGreenCircle() {
        
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
    
    public func bounceYellowCircle() {
        
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
