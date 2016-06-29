//
//  LoadImage.swift
//  AppBuilder
//
//  Created by Pablo Guardiola on 22/04/16.
//  Copyright © 2016 Pablo Guardiola. All rights reserved.
//

import UIKit

class ImageFromURL: UIImageView {

    @IBInspectable var url: String?
    
    override func awakeFromNib() {        
        if url != nil {
            self.downloadedFrom(link: url!, contentMode: .ScaleToFill)
        }
    }

}

extension UIImageView {
    func downloadedFrom(link link:String, contentMode mode: UIViewContentMode) {
        guard
            let url = NSURL(string: link)
            else {return}
        contentMode = mode
        NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
            guard
                let httpURLResponse = response as? NSHTTPURLResponse where httpURLResponse.statusCode == 200,
                let mimeType = response?.MIMEType where mimeType.hasPrefix("image"),
                let data = data where error == nil,
                let image = UIImage(data: data)
                else { return }
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                self.image = image
            }
        }).resume()
    }
}
