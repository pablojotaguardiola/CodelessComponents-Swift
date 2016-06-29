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

class VideoFromURL: UIImageView {
    
    @IBInspectable var videoUrl: String!
    
    @IBInspectable var autoPlay: Bool = true
    @IBInspectable var playOnTap: Bool = true
    
    private var showed: Bool = false
    private var tappedAdded: Bool = false
    
    override func didMoveToWindow() {
        if self.autoPlay {
            playVideo()
        }
        
        if !tappedAdded {
            tappedAdded = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
            self.userInteractionEnabled = true
            self.addGestureRecognizer(tap)
        }
    }
    
    func viewTapped() {
        showed = false
        playVideo()
    }
    
    func playVideo() {
        if videoUrl != nil && !showed {
            showed = true
            let avPlayer = AVPlayer(URL: NSURL(string: videoUrl)!)
            let avPlayerViewController = AVPlayerViewController()
            avPlayerViewController.player = avPlayer
            
            let currentController = self.getCurrentViewController()
            
            currentController?.presentViewController(avPlayerViewController, animated: true){ () -> Void in
                avPlayerViewController.player?.play()
            }
        }
    }
    
    func getCurrentViewController() -> UIViewController? {
        
        if let rootController = UIApplication.sharedApplication().windows.first?.rootViewController {
            var currentController = rootController
            while( currentController.presentedViewController != nil ) {
                currentController = currentController.presentedViewController!
            }
            return currentController
        }
        return nil
    }
}
