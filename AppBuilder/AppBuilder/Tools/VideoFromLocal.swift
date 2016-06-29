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
        if videoName != nil && videoExt != nil && !showed {
            showed = true
            
            if let path = NSBundle.mainBundle().pathForResource(videoName, ofType: videoExt) {
                let url = NSURL(fileURLWithPath: path)
                let avPlayer = AVPlayer(URL: url)
                let avPlayerViewController = AVPlayerViewController()
                avPlayerViewController.player = avPlayer
            
                let currentController = self.getCurrentViewController()
            
                currentController?.presentViewController(avPlayerViewController, animated: true){ () -> Void in
                    avPlayerViewController.player?.play()
                }
            }
            else {
                print("Oops, something wrong when playing video")
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

enum AppError : ErrorType {
    case InvalidResource(String, String)
}
