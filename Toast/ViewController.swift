//
//  ViewController.swift
//  Toast
//
//  Created by James Hart on 9/28/18.
//  Copyright © 2018 James Hart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let toast = Toast()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showToast()
    }
    
    func showToast()
    {
        // toast
        toast.Show(message: "🚨🚨🚨 🍞 First Toast 🍞  🚨🚨🚨 ... posting this to github", view: self.view)
    }

    @IBAction func testToast(_ sender: UIButton)
    {
        self.showToast()
    }
    
}

