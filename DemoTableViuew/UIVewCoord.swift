//
//  UIVewCoord.swift
//  DMSmart
//
//  Created by IronMac on 4/4/19.
//  Copyright © 2019 IronTran. All rights reserved.
//

import Foundation
import UIKit

var spinner: UIView! = UIView()
extension UIView {
    
    var left: CGFloat
    {
        set(x)
        {
            var frame:CGRect=self.frame
            frame.origin.x=round(x)
            self.frame=frame
        }
        get
        {
            return self.frame.origin.x
        }
    }
    
    
    var top: CGFloat
    {
        set(y)
        {
            var frame:CGRect=self.frame
            frame.origin.y=round(y)
            self.frame=frame
        }
        get
        {
            return self.frame.origin.y
        }
    }
    
    
    var width:CGFloat
    {
        set(width)
        {
            var frame:CGRect=self.frame
            frame.size.width = round(width)
            self.frame = frame
        }
        get
        {
            return self.frame.size.width
        }
    }
    
    var height:CGFloat
    {
        set(height)
        {
            var frame:CGRect=self.frame
            frame.size.height = round(height)
            self.frame = frame
        }
        get
        {
            return self.frame.size.height
        }
    }
    
    var right:CGFloat
    {
        set(right)
        {
            var frame:CGRect=self.frame
            frame.origin.x = round(right-self.width)
            self.frame = frame
        }
        get
        {
            return self.frame.origin.x + self.frame.size.width
        }
    }
    
    
    var bottom:CGFloat
    {
        set(bottom)
        {
            var frame:CGRect=self.frame
            frame.origin.y = round(bottom-self.height)
            self.frame = frame
        }
        get
        {
            return self.frame.origin.y + self.frame.size.height
        }
    }
    
    func dropShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowRadius = 1
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        
    }
    
    func bottomShadow(weight:Float) {
        let rect = CGRect(x: self.bounds.origin.x + CGFloat(weight/2), y: self.bounds.origin.y + self.bounds.size.height, width: self.bounds.size.width - CGFloat(weight), height: CGFloat(weight))
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = CGFloat(weight)
        self.layer.shadowPath = UIBezierPath(rect: rect).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        
    }
    
    func topShadow(weight:Float) {
        let rect = CGRect(x: self.bounds.origin.x + CGFloat(weight/2), y: self.bounds.origin.y-CGFloat(weight), width: self.bounds.size.width - CGFloat(weight), height: CGFloat(weight))
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = CGFloat(weight)
        self.layer.shadowPath = UIBezierPath(rect: rect).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        
    }
    
    func setCardFrame() -> Void {
        let path = UIBezierPath(roundedRect: self.bounds, cornerRadius: 10)
        self.layer.cornerRadius = 10
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 1
        self.layer.shadowPath = path.cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func setFullShadow(radius:Float, shadowRadius:Float) -> Void {
        let path = UIBezierPath(roundedRect: self.bounds, cornerRadius: CGFloat(radius))
        self.layer.cornerRadius = CGFloat(radius)
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = CGFloat(shadowRadius)
        self.layer.shadowPath = path.cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
    enum ViewSide {
        case left, right, top, bottom
    }
    
    func addBorder(toSide side: ViewSide, withColor color: CGColor, andThickness thickness: CGFloat) {
        
        let border = CALayer()
        border.backgroundColor = color
        
        switch side {
        case .left: border.frame = CGRect(x: frame.minX, y: frame.minY, width: thickness, height: frame.height)
        case .right: border.frame = CGRect(x: frame.maxX, y: frame.minY, width: thickness, height: frame.height)
        case .top: border.frame = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: thickness)
        case .bottom: border.frame = CGRect(x: frame.minX, y: frame.maxY, width: frame.width, height: thickness)
        }
        
        layer.addSublayer(border)
    }
    
    func findViewController() -> UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.findViewController()
        } else {
            return nil
        }
    }
    
    static func delayAction(miliSeconds: Int, action: @escaping () -> Void) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.milliseconds(miliSeconds)) {
            action()
        }

    }
    
    
    func showSpinner(onView: UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.1)
        let ai = UIActivityIndicatorView.init(style: .gray)
        ai.startAnimating()
        ai.center = spinnerView.center
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        spinner = spinnerView
    }
    
    func removeSpinnerView() {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
            spinner = nil
        }
    }
}

extension Bundle {
    func LocalizedString(key:String) -> String {
        return NSLocalizedString(key, comment: "EXTENSION LOCALIZE");
    }
}

extension CGFloat {
    func toRadians() -> CGFloat {
        return self * CGFloat(Double.pi) / 180.0
    }
    
   
}

extension UIView {
    func fixInView(_ container: UIView!) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
}


