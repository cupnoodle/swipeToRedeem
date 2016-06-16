//
//  ViewController.swift
//  swipeToRedeem
//
//  Created by Axel Kee on 16/06/2016.
//  Copyright © 2016 Sweatshop. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var couponTopView: UIView!
    @IBOutlet weak var couponPerforationUpView: UIImageView!
    @IBOutlet weak var couponBottomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        // Set the background image tile on main view
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
    }
    
    override func viewDidLayoutSubviews() {
        // Customize coupon top view
        self.couponTopView.roundTopCorners(10.0)
        
        self.couponBottomView.frame = CGRectMake(self.couponTopView.frame.origin.x, couponPerforationUpView.frame.maxY - 1.0, self.couponTopView.frame.size.width, 200)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

