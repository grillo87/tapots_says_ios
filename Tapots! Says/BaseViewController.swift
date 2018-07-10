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
        
    }
    
    private func setBackgroundFrame() {
        
        let gradientColorBackground = GradientColor(.diagonal, frame: self.view.frame, colors: [Colors.black, Colors.darkerBlue,Colors.blueDoots ])
        self.view.backgroundColor = gradientColorBackground
        
    }
    

}
