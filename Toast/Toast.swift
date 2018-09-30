//
//  Toast.swift
//  Toast
//
//  Created by James Hart on 9/28/18.
//  Copyright © 2018 James Hart. All rights reserved.
//

import Foundation
import UIKit

class Toast
{
    enum ToastPosition
    {
        case top, bottom, center, custom
    }
    
    var label = UILabel()
    
    func Show(message: String, toastSettings: ToastSettings = .defaultToastSettings, view: UIView)
    {
        print("T O A S T")
        let screenSize: CGRect = UIScreen.main.bounds
        
        label.alpha = 0
        label.textColor = toastSettings.textColor
        label.backgroundColor = toastSettings.backgroundColor
        label.text = "   " + message + "   "
        label.font = toastSettings.font
        label.textAlignment = toastSettings.textAlignment
        
        //Sizing
        label.numberOfLines = toastSettings.numberOfLines
        label.lineBreakMode = toastSettings.wordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        
        //Round edges
        label.layer.masksToBounds = true
        label.layer.cornerRadius = toastSettings.cornerRadius
        
        //positioning
        label.frame = CGRect(x: 50, y: screenSize.height - 100, width: screenSize.width - 100, height: 75)
        view.addSubview(label)
    
        self.setToastConstraints(with: view, toastPosition: toastSettings.position, andHeight: toastSettings.toastHeight)
        
        //Anim8
        UIView.animate(withDuration: 2.5, animations: {
            self.label.alpha = 1
        }) { _ in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + toastSettings.toastDuration, execute: {
                self.removeToast()
            })
        }
    }
    
    private func setToastConstraints(with parentView: UIView, toastPosition: ToastPosition, andHeight height: CGFloat)
    {
        DispatchQueue.main.async
        {
            self.label.removeConstraints(self.label.constraints)
            switch toastPosition
            {
                case .top:
                    parentView.topAnchor.constraint(equalTo: self.label.topAnchor, constant: -20).isActive = true
                    parentView.leadingAnchor.constraint(equalTo: self.label.leadingAnchor, constant: -10).isActive = true
                    parentView.trailingAnchor.constraint(equalTo: self.label.trailingAnchor, constant: 10).isActive = true
                case .center:
                    parentView.leadingAnchor.constraint(equalTo: self.label.leadingAnchor, constant: -10).isActive = true
                    parentView.trailingAnchor.constraint(equalTo: self.label.trailingAnchor, constant: 10).isActive = true
                    parentView.centerXAnchor.constraint(equalTo: self.label.centerXAnchor, constant: 0).isActive = true
                    parentView.centerYAnchor.constraint(equalTo: self.label.centerYAnchor, constant: 0).isActive = true
                case .bottom:
                    parentView.bottomAnchor.constraint(equalTo: self.label.bottomAnchor, constant: 10).isActive = true
                    parentView.leadingAnchor.constraint(equalTo: self.label.leadingAnchor, constant: -10).isActive = true
                    parentView.trailingAnchor.constraint(equalTo: self.label.trailingAnchor, constant: 10).isActive = true
                default:
                    // if user wants to set their own constraints
                    return
            }
            self.label.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    @objc func removeToast() {
        UIView.animate(withDuration: 2.0, animations: {
            self.label.alpha = 0
        })
    }
    
    struct ToastSettings
    {
        static let defaultToastSettings = ToastSettings(position: .center, toastHeight: 100.0, toastDuration: 4.0, cornerRadius: 8.0, font: UIFont.systemFont(ofSize: 16), textColor: UIColor.white, backgroundColor: UIColor.black, textAlignment: .center, numberOfLines: 0, wordWrapping: .byWordWrapping)
        
        let position: ToastPosition
        let toastHeight: CGFloat
        let toastDuration: TimeInterval
        let cornerRadius: CGFloat
        let font: UIFont
        let textColor: UIColor
        let backgroundColor: UIColor
        let textAlignment: NSTextAlignment
        let numberOfLines: Int
        let wordWrapping: NSLineBreakMode
    }
}
