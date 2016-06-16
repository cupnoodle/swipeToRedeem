//
//  UIView+Rounded.swift
//  swipeToRedeem
//
//  Created by Axel Kee on 16/06/2016.
//  Copyright © 2016 Sweatshop. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat){
        let bounds : CGRect = self.bounds
        let maskPath : UIBezierPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSizeMake(radius, radius))
        
        let maskLayer : CAShapeLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.CGPath
        
        self.layer.mask = maskLayer
        
        /*
        let frameLayer : CAShapeLayer = CAShapeLayer()
        frameLayer.frame = bounds
        frameLayer.path = maskPath.CGPath
        frameLayer.strokeColor = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1.0).CGColor
        frameLayer.fillColor = nil
        
        self.layer.addSublayer(frameLayer)
         */
    }
    
    func roundTopCorners(radius: CGFloat){
        self.roundCorners([UIRectCorner.TopLeft, UIRectCorner.TopRight] , radius: radius)
    }
    
    func roundBottomCorners(radius: CGFloat){
        /*
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 5.0
        self.layer.shadowOffset = CGSizeMake(0.0, 3.0)
         */
        
        self.roundCorners([UIRectCorner.BottomLeft, UIRectCorner.BottomRight] , radius: radius)
        
        
    }
    
    
}