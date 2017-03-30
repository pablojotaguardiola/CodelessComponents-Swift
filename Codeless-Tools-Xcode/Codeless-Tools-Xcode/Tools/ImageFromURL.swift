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
            self.downloadedFrom(link: url!, contentMode: .scaleToFill)
        }
    }

}

extension UIImageView {
    func downloadedFrom(link:String, contentMode mode: UIViewContentMode) {
        guard
            let url = URL(string: link)
            else {return}
        contentMode = mode
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async { () -> Void in
                self.image = image
            }
        }).resume()
    }
}
