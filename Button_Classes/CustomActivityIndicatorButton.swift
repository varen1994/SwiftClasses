//
//  CustomButtonClass.swift
//  KVO
//
//  Created by Varender Singh on 25/05/19.
//  Copyright © 2019 Varender Singh. All rights reserved.
//

import UIKit


class CustomActivityIndicatorButton: UIButton {

    let activityIndicator = UIActivityIndicatorView()
    
    //MARK:- Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK:- Actions
    func startAnimating() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true;
        self.addSubview(activityIndicator)
        centerActivityIndicatorInButton()
        self.setTitle("", for: .normal);
        self.activityIndicator.startAnimating()
    }
    
    func endAnimating() {
        self.setTitle(titleOfButton, for: .normal);
        self.activityIndicator.stopAnimating()
    }
    
    //MARK:- Interface Builder Elements
    @IBInspectable var titleOfButton:String = "" { // will set this title after indicator animation stops
        didSet {
            self.setTitle(titleOfButton, for: .normal);
        }
    }
    
    @IBInspectable var colorOfIndicator: UIColor = UIColor.gray {
        didSet {
            activityIndicator.color = colorOfIndicator
        }
    }
    
    @IBInspectable var borderWidth:CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth;
        }
    }
    
    @IBInspectable var cornerRadius:CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius;
        }
    }
    
    @IBInspectable var borderColor:UIColor = UIColor.blue {
        didSet {
            self.layer.borderColor = borderColor.cgColor;
        }
    }
   
    private func centerActivityIndicatorInButton() {
        let xCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: activityIndicator, attribute: .centerX, multiplier: 1, constant: 0)
        self.addConstraint(xCenterConstraint)
        
        let yCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: activityIndicator, attribute: .centerY, multiplier: 1, constant: 0)
        self.addConstraint(yCenterConstraint)
    }
}
