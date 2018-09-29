//
//  ViewController.swift
//  Toast
//
//  Created by James Hart on 9/28/18.
//  Copyright © 2018 James Hart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // toast
        var toast = Toast()
        toast.Show(message: "🚨🚨🚨 🍞 First Toast 🍞  🚨🚨🚨 ... posting this to github", textColor: .white, backgroundColor: .blue, view: self.view)
    }


}

