//
//  Utils.swift
//  ActivitityIndicator
//
//  Created by chang on 2018/02/14.
//  Copyright © 2018年 zhang jieshuo. All rights reserved.
//

import Foundation
import UIKit

class Utils: NSObject {
    
    func okButtonAlertView(title: String, controller: UIViewController, block: (() -> Void)?) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) in
            if (block != nil) {
                block!()
            }
        })
        alert.addAction(ok)
        controller.present(alert, animated: true, completion: nil)
    }
    
    func startActivityIndicator() {
        let root = UIApplication.shared.delegate as! AppDelegate
        let backFrame = (root.window?.frame)!
        
        let backView = UIView(frame: backFrame)
        backView.backgroundColor = UIColor(red: 0 / 255.0, green: 0 / 255.0, blue: 0 / 255.0, alpha: 0.5)
        backView.isUserInteractionEnabled = true
        backView.tag = 19880407
        
        let showWidth: CGFloat = 120
        let showHeight = showWidth
        let showX = (backView.frame.width - showWidth) / 2
        let showY = (backView.frame.height - showHeight) / 2
        let showView = UIView(frame: CGRect(x: showX, y: showY, width: showWidth, height: showHeight))
        showView.backgroundColor = UIColor.white
        showView.layer.cornerRadius = 10
        showView.layer.masksToBounds = true
        backView.addSubview(showView)
        
        let indicatorWidth: CGFloat = 20
        let indicatorHeight = indicatorWidth
        let indicatorX = (showWidth - indicatorWidth) / 2
        let indicatorY = showHeight/2 - indicatorHeight
        let indicator = UIActivityIndicatorView(frame: CGRect(x: indicatorX, y: indicatorY, width: indicatorWidth, height: indicatorHeight))
        indicator.startAnimating()
        indicator.color = UIColor.black
        showView.addSubview(indicator)
        
        let labelWidth = showWidth
        let labelHeight = showHeight / 2
        let labelX: CGFloat = 0
        let labelY = showHeight / 2
        let labelView = UILabel(frame: CGRect(x: labelX, y: labelY, width: labelWidth, height: labelHeight))
        labelView.backgroundColor = UIColor.clear
        labelView.textColor = UIColor.black
        labelView.textAlignment = NSTextAlignment.center
        labelView.text = "linking"
        showView.addSubview(labelView)
        
        root.window?.addSubview(backView)
    }
    
    func stopActivityIndicator() {
        let root = UIApplication.shared.delegate as! AppDelegate
        for subview in (root.window?.subviews)! {
            if subview.tag == 19880407 {
                subview.removeFromSuperview()
            }
        }
    }
}
