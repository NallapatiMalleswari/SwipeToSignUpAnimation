//
//  ViewController.swift
//  SwipeTosignUpAnimation
//
//  Created by Malleswari on 12/07/18.
//  Copyright © 2018 Malleswari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var arrowImage: UIImageView!
    @IBOutlet weak var swipeIndicationTextLabel: UILabel!
    @IBOutlet weak var swipeTextBackgroundView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        addGradientMaskToView(view: swipeTextBackgroundView,titleLabel: "Swipe to signup",arrowimage: #imageLiteral(resourceName: "arrow"))
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController{
    fileprivate func addGradientMaskToView(view:UIView, titleLabel: String, arrowimage: UIImage) {
        
        arrowImage.image = arrowimage
        swipeIndicationTextLabel.text = titleLabel
        let gradientMask = CAGradientLayer()
        gradientMask.frame = view.bounds
        let gradientSize = view.height/view.width
        let gradientColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5)//UIColor(white: 1, alpha: 0.5)
        let startLocations = [0, gradientSize/2, gradientSize]
        let endLocations = [(1 - gradientSize), (1 - gradientSize/2), 1]
        let animation = CABasicAnimation(keyPath: "locations")
        
        gradientMask.colors = [gradientColor.cgColor, UIColor.black.cgColor, gradientColor.cgColor]
        gradientMask.locations = startLocations as [NSNumber]?
        gradientMask.startPoint = CGPoint(x:0 - (gradientSize * 2), y: 0.5)
        gradientMask.endPoint = CGPoint(x:1 + gradientSize, y: 0.5)
        
        view.layer.mask = gradientMask
        
        animation.fromValue = endLocations
        animation.toValue = startLocations
        animation.repeatCount = HUGE
        animation.duration = 2
        
        gradientMask.add(animation, forKey: nil)
    }
    
}

