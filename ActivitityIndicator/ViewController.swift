//
//  ViewController.swift
//  ActivitityIndicator
//
//  Created by chang on 2018/02/14.
//  Copyright © 2018年 zhang jieshuo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startActivityIndicator(_ sender: Any) {
        Utils().startActivityIndicator()
        
        let time:TimeInterval = 3.0
        DispatchQueue.main.asyncAfter(deadline:DispatchTime.now() + time) { [weak self] in
            guard let `self` = self else { return }
            
            Utils().stopActivityIndicator()
            
            Utils().okButtonAlertView(title: "network successed", controller: self, block: nil)
        }
    }

}

