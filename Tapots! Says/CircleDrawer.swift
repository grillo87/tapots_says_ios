//
//  CircleDrawer.swift
//  Tapots! Says
//
//  Created by José Grillo on 9/7/18.
//  Copyright © 2018 José Grillo. All rights reserved.
//

import UIKit
import GLKit

@IBDesignable
public class CircleDrawer: UIView {
    
    var background : UIColor!
    var startAngle : CGFloat!
    var endAngle : CGFloat!
    var quaterPosition : Int!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func setBackground(background : UIColor) {
        
        self.background = background
        
    }
    
    public func setStartAngle(startAngle : CGFloat) {
        
        self.startAngle = startAngle
        
    }
    
    public func setEndAngle (endAngle : CGFloat) {
        
        self.endAngle = endAngle
        
    }
    
    public func setQuaterPosition (quaterPosition : Int) {
    
        self.quaterPosition = quaterPosition
    
    }
    
    private func drawSlice(center: CGPoint, rect: CGRect, startPercent: CGFloat, endPercent: CGFloat, color: UIColor) {
        
        let radius = 70
        let startAngle = startPercent / 100 * CGFloat(Double.pi) * 2 - CGFloat(Double.pi)
        let endAngle = endPercent / 100 * CGFloat(Double.pi) * 2 - CGFloat(Double.pi)
        let path = UIBezierPath()
        path.move(to: center)
        path.addArc(withCenter: center, radius: CGFloat(radius), startAngle: startAngle, endAngle: endAngle, clockwise: true)
        path.close()
        color.setFill()
        path.fill()
    }
    
    
    override public func draw(_ rect: CGRect) {
        
        var center : CGPoint
        
        switch self.quaterPosition {
            
        case GameConstants.BLUE_VALUE:
            center = CGPoint(x: rect.origin.x + rect.width, y: rect.origin.y + rect.height)
            
        case GameConstants.RED_VALUE:
            center = CGPoint(x: rect.origin.x , y: rect.origin.y + rect.height)
            
        case GameConstants.GREEN_VALUE:
            center = CGPoint(x: rect.origin.x, y: rect.origin.y)
            
        case GameConstants.YELLOW_VALUE:
            center = CGPoint(x: rect.origin.x + rect.width, y: rect.origin.y)
        
        default:
            center = CGPoint(x: rect.origin.x + rect.width / 2, y: rect.origin.y + rect.height / 2)
        }
        
        
        drawSlice(center : center, rect: rect, startPercent: self.startAngle, endPercent: self.endAngle, color: self.background)
        
        
        
    }
    
    
    
}

