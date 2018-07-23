//
//  Utils.swift
//  Tapots! Says
//
//  Created by José Grillo on 9/7/18.
//  Copyright © 2018 José Grillo. All rights reserved.
//

import Foundation
import UIKit

public class Utils {
    
    public static func randomInt () -> Int {
        
        let randomInt = Int(arc4random_uniform(UInt32(GameConstants.YELLOW_VALUE)) + UInt32(GameConstants.BLUE_VALUE))
        return randomInt
        
    }
    
    
    public static func getLabelTitle() -> NSMutableAttributedString {
        
        let titleString = NSMutableAttributedString(string: "TAPOTS!")
        titleString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor(named: "blueDoots")!, range: NSRange(location:0,length:1))
        titleString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor(named: "redDoots")!, range: NSRange(location:1,length:1))
        titleString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor(named: "orangeDoots")!, range: NSRange(location:2,length:1))
        titleString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor(named: "yellowDoots")!, range: NSRange(location:3,length:1))
        titleString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor(named: "purpleDoots")!, range: NSRange(location:4,length:1))
        titleString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor(named: "greenDoots")!, range: NSRange(location:5,length:1))
        titleString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor(named: "white")!, range: NSRange(location:6,length:1))
        
        return titleString
        
    }
    
    
    public static func sortPlayers(players: [Players]) -> [Players] {
    
        let sortedPlayers = players.sorted { (firstValue, secondValue) in return firstValue.score < secondValue.score }
        return sortedPlayers
        
    }
    
    
    static func showLoadingDialog(viewController : BaseViewController, message : String) -> LoadingViewController {
        
        let loadingDialog = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loadingViewControllerId") as! LoadingViewController
        viewController.addChildViewController(loadingDialog)
        loadingDialog.view.frame = viewController.view.frame
        viewController.view.addSubview(loadingDialog.view)
        loadingDialog.didMove(toParentViewController: viewController)
        loadingDialog.setLabelText(text: message)
        
        return loadingDialog
        
    }
    
    
    static func showAlertDialog(viewController : BaseViewController, message : String) -> AlertViewController {
        
        let alertDialog = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "alertViewControllerId") as! AlertViewController
        viewController.addChildViewController(alertDialog)
        alertDialog.view.frame = viewController.view.frame
        viewController.view.addSubview(alertDialog.view)
        alertDialog.didMove(toParentViewController: viewController)
        alertDialog.setLabelText(text: message)
        
        return alertDialog
        
    }
    
    
}
