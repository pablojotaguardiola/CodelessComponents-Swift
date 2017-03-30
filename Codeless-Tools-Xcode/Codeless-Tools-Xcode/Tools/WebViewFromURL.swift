//
//  WebViewFromURL.swift
//  Codeless-Tools-Xcode
//
//  Created by Pablo Guardiola on 02/07/16.
//  Copyright © 2016 Pablo Guardiola. All rights reserved.
//

import UIKit

class WebViewFromURL: UIWebView {
    
    @IBInspectable var url: String!
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        if url != nil && !url.isEmpty {
            self.loadRequest(URLRequest(url: URL(string: url)!))
        }
    }
}
