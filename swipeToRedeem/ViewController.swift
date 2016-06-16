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
        
        let shadowView = UIView(frame: CGRectMake(self.swipeContainerView.frame.origin.x + 6, self.swipeContainerView.frame.origin.y + 30.0, self.swipeContainerView.frame.size.width - 6 , self.swipeContainerView.frame.size.height - 33.0) )
        
        shadowView.layer.backgroundColor = UIColor.whiteColor().CGColor
        shadowView.layer.cornerRadius = 10.0
        shadowView.layer.shadowColor = UIColor.blackColor().CGColor
        shadowView.layer.shadowOffset = CGSizeMake(-3,5)
        shadowView.layer.shadowOpacity = 0.3
        shadowView.layer.shadowRadius = 2
        
        self.view.insertSubview(shadowView, belowSubview: self.swipeContainerView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Initialize coupon view
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
        
        
        self.view.addSubview(self.couponTopView)

        self.couponTopView.addSubview(self.couponContentView)
        self.couponTopView.addSubview(self.couponTopPerforationView)
        
        self.view.addSubview(self.swipeContainerView)
        
        self.swipeContainerView.addSubview(swipePerforationView)
        self.swipeContainerView.addSubview(swipeContentView)
        
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
                     "swipeContentView" : self.swipeContentView]
        let metrics = ["couponTopViewHeight" : 200.0,
                       "swipeContainerViewHeight" : 80.0 ]
        var constraints = []
        var constraint : NSLayoutConstraint = NSLayoutConstraint()
        var format = ""
        
        
        format = "|-30-[couponTopView]-30-|"
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
        
        
        
        
        format = "|-30-[swipeContainerView]-30-|"
        constraints = NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
        self.view.addConstraints(constraints as! [NSLayoutConstraint])
        
        format = "V:|-60-[couponTopView(couponTopViewHeight)]-0-[swipeContainerView(swipeContainerViewHeight)]"
        constraints = NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views)
        self.view.addConstraints(constraints as! [NSLayoutConstraint])
        
        
        
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
        
        
        
        
    }
}

