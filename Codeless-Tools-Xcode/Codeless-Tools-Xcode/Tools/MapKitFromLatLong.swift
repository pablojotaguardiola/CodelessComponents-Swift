//
//  MapKitFromLatLong.swift
//  Codeless-Tools-Xcode
//
//  Created by Pablo Guardiola on 02/07/16.
//  Copyright © 2016 Pablo Guardiola. All rights reserved.
//

import UIKit
import MapKit

class MapKitFromLatLong: MKMapView {

    @IBInspectable var latitude: Double = 0
    @IBInspectable var longitude: Double = 0
    
    @IBInspectable var regionRadiusKm: Int = 10
    
    private var initialized: Bool = false
    
    override func didMoveToWindow() {
        if (!initialized && latitude != 0 || longitude != 0) {
            initialized = true
            let initialLocation = CLLocation(latitude: latitude, longitude: longitude)
            
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate, Double(regionRadiusKm) * 2000.0, Double(regionRadiusKm) * 2000.0)
            self.setRegion(coordinateRegion, animated: true)
        }
    }

}
