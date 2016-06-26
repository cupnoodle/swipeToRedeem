//
//  ViewController.swift
//  swipeToRedeem
//
//  Created by Axel Kee on 16/06/2016.
//  Copyright © 2016 Sweatshop. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var couponTopView : UIView = UIView()
    var couponTopPerforationView : UIImageView = UIImageView()
    var couponContentView : UIView = UIView()
    var swipeContainerView : UIView = UIView()
    var swipePerforationView : UIImageView = UIImageView()
    var swipeContentView: UIView = UIView()
    
    var swipeAreaView : UIView = UIView()
    
    var swipeCursorView : UIView = UIView()
    var swipeContainerShadowView : UIView = UIView()
    
    var couponRedemptionDateView : UIView = UIView()
    var couponRedemptionLabel : UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initializeCouponView()
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        // Set the background image tile on main view
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        
    }
    
    override func viewDidLayoutSubviews() {
        
        
        // Round top corner of couponTopView
        self.couponTopView.roundTopCorners(10.0)
        
        // Round bottom corner of swipe container
        self.swipeContainerView.roundBottomCorners(10.0)
        
        self.swipeContainerShadowView.frame =  CGRectMake(self.swipeContainerView.frame.origin.x + 6, self.swipeContainerView.frame.origin.y + 30.0, self.swipeContainerView.frame.size.width - 6 , self.swipeContainerView.frame.size.height - 33.0)
        
        self.swipeContainerShadowView.translatesAutoresizingMaskIntoConstraints = false
        self.swipeContainerShadowView.layer.backgroundColor = UIColor.whiteColor().CGColor
        self.swipeContainerShadowView.layer.cornerRadius = 10.0
        self.swipeContainerShadowView.layer.shadowColor = UIColor.blackColor().CGColor
        self.swipeContainerShadowView.layer.shadowOffset = CGSizeMake(-3,5)
        self.swipeContainerShadowView.layer.shadowOpacity = 0.3
        self.swipeContainerShadowView.layer.shadowRadius = 2
        
        self.view.insertSubview(self.swipeContainerShadowView, belowSubview: self.swipeContainerView)
        
        self.swipeAreaView.layer.cornerRadius = 28.0
        
        self.swipeCursorView.layer.cornerRadius = 23.0
        
        swipeCursorView.frame = CGRectMake(0.0, 0.0, 45.0, 45.0)
        swipeCursorView.center = CGPointMake(swipeAreaView.frame.origin.x + 18.0 , swipeAreaView.center.y - 10.0)
        
        print("swipe cursor view origin x \(swipeCursorView.frame.origin.x)")
        
        /*
        self.couponRedemptionDateView.frame = CGRectMake(self.swipeContainerView.frame.origin.x + 4.0, self.swipeContainerView.frame.origin.y + 4.0, self.swipeContainerView.frame.size.width - 8.0, self.swipeContainerView.frame.size.height - 8.0)
        */
        
        
        self.swipeCursorView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(ViewController.handleDrag(_:)) ))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - View Initialization
    func initializeCouponView() {
        
        
        couponTopView.translatesAutoresizingMaskIntoConstraints = false
        couponTopView.backgroundColor = UIColor.clearColor()

        couponTopView.clipsToBounds = true
        
        couponContentView.translatesAutoresizingMaskIntoConstraints = false
        couponContentView.backgroundColor = UIColor.whiteColor()
        
        couponTopPerforationView = UIImageView(image: UIImage(named: "PerforationUp"))
        couponTopPerforationView.contentMode = .ScaleAspectFill
        couponTopPerforationView.translatesAutoresizingMaskIntoConstraints = false
        
        swipeContainerView.translatesAutoresizingMaskIntoConstraints = false
        swipeContainerView.backgroundColor = UIColor.clearColor()
        swipeContainerView.clipsToBounds = true
        
        swipePerforationView = UIImageView(image: UIImage(named: "PerforationDown"))
        swipePerforationView.contentMode = .ScaleAspectFill
        swipePerforationView.translatesAutoresizingMaskIntoConstraints = false
        
        swipeContentView.translatesAutoresizingMaskIntoConstraints = false
        swipeContentView.backgroundColor = UIColor.whiteColor()
        
        swipeAreaView.translatesAutoresizingMaskIntoConstraints = false
        swipeAreaView.backgroundColor  = UIColor(red: 0.855, green: 0.032, blue: 0.303, alpha: 1.0)
        
        swipeCursorView.translatesAutoresizingMaskIntoConstraints = false
        swipeCursorView.backgroundColor = UIColor.whiteColor()
        
        self.view.addSubview(self.couponTopView)

        self.couponTopView.addSubview(self.couponContentView)
        self.couponTopView.addSubview(self.couponTopPerforationView)
        
        self.view.addSubview(self.swipeContainerView)
        
        self.swipeContainerView.addSubview(swipePerforationView)
        self.swipeContainerView.addSubview(swipeContentView)
        self.swipeContentView.addSubview(swipeAreaView)
        self.swipeAreaView.addSubview(swipeCursorView)
        
        
        couponRedemptionDateView.translatesAutoresizingMaskIntoConstraints = false
        couponRedemptionDateView.backgroundColor = UIColor.clearColor()
        couponRedemptionDateView.layer.borderColor = UIColor.whiteColor().CGColor
        couponRedemptionDateView.layer.borderWidth = 2.0
        couponRedemptionDateView.layer.cornerRadius = 5.0
        couponRedemptionDateView.alpha = 0.0
        
        couponRedemptionLabel.translatesAutoresizingMaskIntoConstraints = false
        couponRedemptionLabel.numberOfLines = 2
        couponRedemptionLabel.textColor = UIColor.whiteColor()
        couponRedemptionLabel.font = UIFont.systemFontOfSize(14.0)
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd MMM yyy, hh:mm a"
        
        // Preset the uilabel text with value to let the autolayout adjust its size
        let constantString = NSMutableAttributedString(string: "Redeemed on\n", attributes: [NSFontAttributeName : UIFont.systemFontOfSize(14.0), NSForegroundColorAttributeName : UIColor.whiteColor()])
        
        let dateString = NSMutableAttributedString(string: dateFormatter.stringFromDate(NSDate()), attributes: [NSFontAttributeName : UIFont.boldSystemFontOfSize(16.0), NSForegroundColorAttributeName : UIColor.whiteColor()])
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6
        paragraphStyle.alignment = .Center
        
        constantString.appendAttributedString(dateString)
        constantString.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, constantString.length))
        
        self.couponRedemptionLabel.attributedText = constantString
        
        
        self.couponRedemptionDateView.addSubview(couponRedemptionLabel)
        self.view.insertSubview(self.couponRedemptionDateView, belowSubview: self.swipeContainerView)
        
        let topPerforationWidth : CGFloat = UIImage(named: "PerforationUp")!.size.width
        let topPerforationHeight : CGFloat = UIImage(named: "PerforationUp")!.size.height
        let bottomPerforationWidth : CGFloat = UIImage(named: "PerforationDown")!.size.width
        let bottomPerforationHeight : CGFloat = UIImage(named: "PerforationDown")!.size.height
        
        let views = ["super" : self.view,
                     "couponTopView" : self.couponTopView,
                     "couponTopPerforationView" : self.couponTopPerforationView,
                     "couponContentView" : self.couponContentView,
                     "swipeContainerView" : self.swipeContainerView,
                     "swipePerforationView" : self.swipePerforationView,
                     "swipeContentView" : self.swipeContentView,
                     "swipeAreaView" : self.swipeAreaView,
                     "swipeCursorView" : self.swipeCursorView,
                     "couponRedemptionDateView" : self.couponRedemptionDateView,
                     "couponRedemptionLabel" : self.couponRedemptionLabel]
        let metrics = ["couponTopViewHeight" : 200.0,
                       "swipeContainerViewHeight" : 100.0,
                       "leftRightMarginToSuper" : 20.0,
                       "couponRedemptionDateHeight" : 70.0,
                       "couponRedemptionDateLeftRightMarginToSuper" : 35]
        var constraints = []
        var constraint : NSLayoutConstraint = NSLayoutConstraint()
        var format = ""
        
        format = "V:|-60-[couponTopView(couponTopViewHeight)]-0-[swipeContainerView(swipeContainerViewHeight)]"
        constraints = NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
        self.view.addConstraints(constraints as! [NSLayoutConstraint])
        
        format = "|-(leftRightMarginToSuper)-[swipeContainerView]-(leftRightMarginToSuper)-|"
        constraints = NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
        self.view.addConstraints(constraints as! [NSLayoutConstraint])
        
        format = "|-(leftRightMarginToSuper)-[couponTopView]-(leftRightMarginToSuper)-|"
        constraints = NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
        self.view.addConstraints(constraints as! [NSLayoutConstraint])
        
        format = "|-0-[couponContentView]-0-|"
        constraints = NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
        self.couponTopView.addConstraints(constraints as! [NSLayoutConstraint])
        
        format = "|-0-[couponTopPerforationView]-0-|"
        constraints = NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
        self.couponTopView.addConstraints(constraints as! [NSLayoutConstraint])
        
        constraint = NSLayoutConstraint(item: couponTopPerforationView, attribute: .Height, relatedBy: .Equal, toItem: couponTopPerforationView, attribute: .Width, multiplier: (topPerforationHeight/topPerforationWidth), constant: 0)
        self.couponTopView.addConstraint(constraint)
        
        format = "V:|-0-[couponContentView]-0-[couponTopPerforationView]-0-|"
        constraints = NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
        self.couponTopView.addConstraints(constraints as! [NSLayoutConstraint])
        
        
        format = "|-0-[swipePerforationView]-0-|"
        constraints = NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
        self.swipeContainerView.addConstraints(constraints as! [NSLayoutConstraint])
        
        format = "|-0-[swipeContentView]-0-|"
        constraints = NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
        self.swipeContainerView.addConstraints(constraints as! [NSLayoutConstraint])
        
        constraint = NSLayoutConstraint(item: swipePerforationView, attribute: .Height, relatedBy: .Equal, toItem: swipePerforationView, attribute: .Width, multiplier: (bottomPerforationHeight/bottomPerforationWidth), constant: 0)
        self.swipeContainerView.addConstraint(constraint)
        
        format = "V:|-0-[swipePerforationView]-0-[swipeContentView]-0-|"
        constraints = NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
        self.swipeContainerView.addConstraints(constraints as! [NSLayoutConstraint])
        
        format = "|-12-[swipeAreaView]-12-|"
        constraints = NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
        self.swipeContentView.addConstraints(constraints as! [NSLayoutConstraint])
        
        format = "V:|-10-[swipeAreaView]-18-|"
        constraints = NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
        self.swipeContentView.addConstraints(constraints as! [NSLayoutConstraint])
        
        
        format = "V:[couponTopView]-20-[couponRedemptionDateView(couponRedemptionDateHeight)]"
        constraints = NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
        self.view.addConstraints(constraints as! [NSLayoutConstraint])
 
        
        /*
        constraint = NSLayoutConstraint(item: couponRedemptionDateView, attribute: .Top , relatedBy: .Equal, toItem: couponTopView, attribute: .Top, multiplier: 1.0, constant: 20.0)
        self.view.addConstraint(constraint)
        */
        
        
        format = "|-(couponRedemptionDateLeftRightMarginToSuper)-[couponRedemptionDateView]-(couponRedemptionDateLeftRightMarginToSuper)-|"
        constraints = NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
        self.view.addConstraints(constraints as! [NSLayoutConstraint])
        
        
        format = "|-8-[couponRedemptionLabel]-8-|"
        constraints = NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
        self.couponRedemptionDateView.addConstraints(constraints as! [NSLayoutConstraint])
        
        constraint = NSLayoutConstraint(item: couponRedemptionLabel, attribute: .CenterY , relatedBy: .Equal, toItem: couponRedemptionDateView, attribute: .CenterY, multiplier: 1.0, constant: 0)
        self.couponRedemptionDateView.addConstraint(constraint)
        /*
        format = "V:|-6-[swipeCursorView]-6-|"
        constraints = NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
        self.swipeAreaView.addConstraints(constraints as! [NSLayoutConstraint])
        
        constraint = NSLayoutConstraint(item: swipeCursorView, attribute: .Width, relatedBy: .Equal, toItem: swipeCursorView, attribute: .Height, multiplier: 1.0, constant: 0.0)
        self.swipeAreaView.addConstraint(constraint)
        
        
        format = "|-6-[swipeCursorView]"
        let swipeCursorOriginXconstraints = NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
        self.swipeAreaView.addConstraints(swipeCursorOriginXconstraints as! [NSLayoutConstraint])
 
        
        self.swipeAreaView.removeConstraints(swipeCursorOriginXconstraints)
        
        */
        

        
    }
    
    // MARK: - handle for action
    func handleDrag(panGesture: UIPanGestureRecognizer){
        
        
        let xTranslation = panGesture.translationInView(swipeAreaView).x
        let translation = panGesture.translationInView(self.view)
        let minX : CGFloat = 30.0
        let maxX : CGFloat = self.swipeAreaView.frame.maxX - self.swipeCursorView.frame.size.width + 4.0
        
        print("x in area is \(xTranslation)")
        
        //swipeCursorView.frame = CGRectOffset(swipeCursorView.frame, xTranslation/swipeCursorView.frame.size.width, 0)
        if (panGesture.state == .Ended)
        {
            if let view = panGesture.view {
                
                if(view.center.x + translation.x >= maxX - 5.0) {
                    // successfully finish swipe
                    // disable pangesture
                    self.swipeCursorView.gestureRecognizers?.forEach(self.swipeCursorView.removeGestureRecognizer)
                
                    
                    self.showRedeemedMessage()
                    self.animateTearCoupon()
                    
                } else {
                    
                    // swipe stopped halfway
                    // return cursor to start position
                    UIView.animateWithDuration(0.5, animations: {
                        self.swipeCursorView.center = CGPoint(x: 30.0, y: self.swipeCursorView.center.y)
                    })
                }
            }
            return
        }
        
        
        
        
        
        // the view that contain pan gesture, i.e swipe cursor view
        print("current cursor center x is \(panGesture.view!.center.x + translation.x)")
        
        if let view = panGesture.view {
            if(view.center.x + translation.x >= minX && view.center.x + translation.x <= maxX)
            {
                view.center = CGPoint(x:view.center.x + translation.x,
                                      y:view.center.y)
            }
        }
        panGesture.setTranslation(CGPointZero, inView: self.view)

        
    }
    
    func animateTearCoupon() {
        let spinDegree = -30.0
        let yTranslateDistance = self.view.frame.size.height - self.swipeContainerView.center.y + self.swipeContainerView.frame.size.height + 50
        
        let tearCouponDuration = 1.0
        let rotateCouponDuration = 0.7
        let fadeOutCouponDuration = 1.0
        
        UIView.beginAnimations("tearCouponShadow", context: nil)
        UIView.setAnimationDuration(tearCouponDuration)
        UIView.setAnimationCurve(.EaseOut)
        UIView.setAnimationTransition(.None, forView: self.view, cache: false)
        UIView.setAnimationDelegate(self)
        //self.swipeContainerView.center.y += 100
        self.swipeContainerShadowView.center.y += yTranslateDistance
        
        UIView.commitAnimations()
        
        //---------
        UIView.beginAnimations("tearCoupon", context: nil)
        UIView.setAnimationDuration(tearCouponDuration)
        UIView.setAnimationCurve(.EaseOut)
        UIView.setAnimationTransition(.None, forView: self.view, cache: false)
        UIView.setAnimationDelegate(self)
        self.swipeContainerView.center.y += yTranslateDistance
        
        UIView.commitAnimations()
        
        //---------
        UIView.beginAnimations("rotateCouponShadow", context: nil)
        UIView.setAnimationDuration(rotateCouponDuration)
        UIView.setAnimationCurve(.EaseOut)
        UIView.setAnimationTransition(.None, forView: self.view, cache: false)
        UIView.setAnimationDelegate(self)
        self.swipeContainerShadowView.transform = CGAffineTransformMakeRotation(degreesToRadians(spinDegree))
        
        UIView.commitAnimations()
        
        //---------
        UIView.beginAnimations("rotateCoupon", context: nil)
        UIView.setAnimationDuration(rotateCouponDuration)
        UIView.setAnimationCurve(.EaseOut)
        UIView.setAnimationTransition(.None, forView: self.view, cache: false)
        UIView.setAnimationDelegate(self)
        self.swipeContainerView.transform = CGAffineTransformMakeRotation(degreesToRadians(spinDegree))
        
        UIView.commitAnimations()
        
        /*
        //---------
        UIView.beginAnimations("fadeOutCouponShadow", context: nil)
        UIView.setAnimationDuration(fadeOutCouponDuration)
        UIView.setAnimationCurve(.EaseOut)
        UIView.setAnimationTransition(.None, forView: self.view, cache: false)
        UIView.setAnimationDelegate(self)
        self.swipeContainerShadowView.alpha = 0.0
        
        UIView.commitAnimations()
        
        //---------
        UIView.beginAnimations("fadeOutCoupon", context: nil)
        UIView.setAnimationDuration(fadeOutCouponDuration)
        UIView.setAnimationCurve(.EaseOut)
        UIView.setAnimationTransition(.None, forView: self.view, cache: false)
        UIView.setAnimationDelegate(self)
        self.swipeContainerView.alpha = 0.0
        
        UIView.commitAnimations()
        */
    }
    
    func showRedeemedMessage() {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd MMM yyy, hh:mm a"
        
        let constantString = NSMutableAttributedString(string: "Redeemed on\n", attributes: [NSFontAttributeName : UIFont.systemFontOfSize(14.0), NSForegroundColorAttributeName : UIColor.whiteColor()])
        
        let dateString = NSMutableAttributedString(string: dateFormatter.stringFromDate(NSDate()) , attributes: [NSFontAttributeName : UIFont.boldSystemFontOfSize(16.0), NSForegroundColorAttributeName : UIColor.whiteColor()])
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6
        paragraphStyle.alignment = .Center
        
        constantString.appendAttributedString(dateString)
        constantString.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, constantString.length))
        
        self.couponRedemptionLabel.attributedText = constantString
        self.couponRedemptionLabel.adjustsFontSizeToFitWidth = true
        
        //---------
        UIView.beginAnimations("fadeInMessage", context: nil)
        UIView.setAnimationDuration(1.5)
        UIView.setAnimationCurve(.EaseOut)
        UIView.setAnimationTransition(.None, forView: self.view, cache: false)
        UIView.setAnimationDelegate(self)
        self.couponRedemptionDateView.alpha = 1.0
        
        UIView.commitAnimations()
    }
}

