//
//  Toast.swift
//  Toast
//
//  Created by James Hart on 9/28/18.
//  Copyright © 2018 James Hart. All rights reserved.
//

import Foundation
import UIKit

class Toast {
    
    var label = UILabel()
    
    func Show(message:String, textColor:UIColor, backgroundColor:UIColor, view:UIView) {
        print("T O A S T")
        let screenSize: CGRect = UIScreen.main.bounds
        
        label.alpha = 0
        label.textColor = textColor
        label.backgroundColor = backgroundColor
        label.text = "   " + message + "   "
        label.font = UIFont(name: "menlo", size: 16)
        label.textAlignment = .center
        
        //Sizing
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        
        //Round edges
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 8.0
        
        //positioning
        label.frame = CGRect(x: 50, y: screenSize.height - 100, width: screenSize.width - 100, height: 75)
        view.addSubview(label)
    
        //Anim8
        UIView.animate(withDuration: 2.5, animations: {
            self.label.alpha = 1
        }) { _ in
            var timer: Timer! = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(self.removeToast), userInfo: nil, repeats: false)
        }
    }
    
    @objc func removeToast() {
        UIView.animate(withDuration: 2.0, animations: {
            self.label.alpha = 0
        })
    
    }
    
    
}
