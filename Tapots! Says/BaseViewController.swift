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
    
    override public var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundFrame()
        
    }
    
    private func setBackgroundFrame() {
        
        let gradientColorBackground = GradientColor(.diagonal, frame: self.view.frame, colors: [Colors.black, Colors.darkerBlue,Colors.blueDoots ])
        self.view.backgroundColor = gradientColorBackground
        
    }
    

}
