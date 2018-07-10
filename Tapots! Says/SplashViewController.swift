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
    @IBOutlet weak var GreenCircle: CircleDrawer!
    @IBOutlet weak var YellowCircle: CircleDrawer!
    @IBOutlet weak var RedCircle: CircleDrawer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLabelTitle()
        drawGreenCircle()
        
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
    
    }
    
    private func setRedCircle() {
    
        RedCircle.setBackground(background: Colors.redDoots)
        RedCircle.setStartAngle(startAngle: 25)
        RedCircle.setEndAngle(endAngle: 50)
        RedCircle.setQuaterPosition(quaterPosition:GameConstants.RED_VALUE)
    
    }
    
    private func setGreenCircle() {
        
        GreenCircle.setBackground(background: Colors.greenDoots)
        GreenCircle.setStartAngle(startAngle: 50)
        GreenCircle.setEndAngle(endAngle: 75)
        GreenCircle.setQuaterPosition(quaterPosition:GameConstants.GREEN_VALUE)
        
    }
    
    private func setYellowCircle() {
    
        YellowCircle.setBackground(background: Colors.yellowDoots)
        YellowCircle.setStartAngle(startAngle: 75)
        YellowCircle.setEndAngle(endAngle: 100)
        YellowCircle.setQuaterPosition(quaterPosition:GameConstants.YELLOW_VALUE)
        
    }
    
    
    
    private func setLabelTitle() {
        
        let titleString = NSMutableAttributedString(string: "TAPOTS!")
        titleString.addAttribute(NSAttributedStringKey.foregroundColor, value: Colors.blueDoots, range: NSRange(location:0,length:1))
        titleString.addAttribute(NSAttributedStringKey.foregroundColor, value: Colors.redDoots, range: NSRange(location:1,length:1))
        titleString.addAttribute(NSAttributedStringKey.foregroundColor, value: Colors.orangeDoots, range: NSRange(location:2,length:1))
        titleString.addAttribute(NSAttributedStringKey.foregroundColor, value: Colors.yellowDoots, range: NSRange(location:3,length:1))
        titleString.addAttribute(NSAttributedStringKey.foregroundColor, value: Colors.purpleDoots, range: NSRange(location:4,length:1))
        titleString.addAttribute(NSAttributedStringKey.foregroundColor, value: Colors.greenDoots, range: NSRange(location:5,length:1))
        titleString.addAttribute(NSAttributedStringKey.foregroundColor, value: Colors.white, range: NSRange(location:6,length:1))
       
        TitleNameLabel.attributedText = titleString
        
    }
    
    private func drawGreenCircle() {
        /*
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: CGRect(x: 64, y: 64, width: 160, height: 160), cornerRadius: 50).cgPath
        layer.fillColor = UIColor.red.cgColor
        view.layer.addSublayer(layer)
 */
        
    }
    

}

extension UIView {
    
    func fadeIn(_ duration: TimeInterval = 3.0, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: completion)  }
}
