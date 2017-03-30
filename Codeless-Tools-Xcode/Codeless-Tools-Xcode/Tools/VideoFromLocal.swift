//
//  VideoFromURL.swift
//  AppBuilder
//
//  Created by Pablo Guardiola on 23/04/16.
//  Copyright © 2016 Pablo Guardiola. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoFromLocal: UIImageView {
    
    @IBInspectable var videoName: String!
    @IBInspectable var videoExt: String!
    
    @IBInspectable var autoPlay: Bool = true
    @IBInspectable var playOnTap: Bool = true
    
    fileprivate var showed: Bool = false
    fileprivate var tappedAdded: Bool = false
    
    override func didMoveToWindow() {
        if self.autoPlay {
            playVideo()
        }
        
        if !tappedAdded {
            tappedAdded = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
            self.isUserInteractionEnabled = true
            self.addGestureRecognizer(tap)
        }
    }
    
    func viewTapped() {
        showed = false
        playVideo()
    }
    
    func playVideo() {
        if videoName != nil && videoExt != nil && !showed {
            showed = true
            
            if let path = Bundle.main.path(forResource: videoName, ofType: videoExt) {
                let url = URL(fileURLWithPath: path)
                let avPlayer = AVPlayer(url: url)
                let avPlayerViewController = AVPlayerViewController()
                avPlayerViewController.player = avPlayer
            
                let currentController = self.getCurrentViewController()
            
                currentController?.present(avPlayerViewController, animated: true){ () -> Void in
                    avPlayerViewController.player?.play()
                }
            }
            else {
                print("Oops, something wrong when playing video")
            }
        }
    }
    
    func getCurrentViewController() -> UIViewController? {
        
        if let rootController = UIApplication.shared.windows.first?.rootViewController {
            var currentController = rootController
            while( currentController.presentedViewController != nil ) {
                currentController = currentController.presentedViewController!
            }
            return currentController
        }
        return nil
    }
}

enum AppError : Error {
    case invalidResource(String, String)
}
