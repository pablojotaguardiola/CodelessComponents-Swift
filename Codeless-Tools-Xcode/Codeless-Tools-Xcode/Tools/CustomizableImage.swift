//
//  CustomizableImage.swift
//  Codeless-Tools-Xcode
//
//  Created by Pablo Guardiola on 02/07/16.
//  Copyright © 2016 Pablo Guardiola. All rights reserved.
//

import UIKit

@IBDesignable
class CustomizableImage: UIImageView {
    
    var contentView: UIImageView?
    
    @IBInspectable var mainImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    
    @IBInspectable var cornerRadius: Double = 0 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    @IBInspectable var borderColor: UIColor? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        didSet {
            layer.shadowColor = shadowColor?.cgColor
            updateView()
        }
    }
    @IBInspectable var shadowOffset: CGPoint = CGPoint.zero {
        didSet {
            layer.shadowOffset = CGSize (width: shadowOffset.x, height: shadowOffset.y)
            updateView()
        }
    }
    @IBInspectable var shadowOpacity: CGFloat = 1 {
        didSet {
            layer.shadowOpacity = Float(shadowOpacity)
            updateView()
        }
    }
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = shadowRadius
            updateView()
        }
    }
    
    fileprivate func updateView() {
        // add the border to subview
        if contentView == nil {
            contentView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            addSubview(contentView!)
        }
        
        backgroundColor = UIColor.clear
        
        layer.masksToBounds = false
        clipsToBounds = false
        contentView?.layer.masksToBounds = true
        
        contentView?.image = mainImage
        image = nil
        
        contentView?.layer.cornerRadius = CGFloat(cornerRadius)
        contentView?.layer.borderWidth = borderWidth
        contentView?.layer.borderColor = borderColor?.cgColor
        
        
    }
}
