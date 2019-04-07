//
//  performerMapViewController.swift
//  streetPerformances
//
//  Created by Bhavesh Shah on 4/7/19.
//  Copyright © 2019 Bhavesh Shah. All rights reserved.
//

import UIKit
import CoreLocation

class performerMapViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    var lat = 15.1515
    var lon = 51.5151
    var coordinate = CLLocationCoordinate2D(latitude: 10, longitude: 5)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Can use both when app is open and when app is in background.
        locationManager.requestAlwaysAuthorization()
        
        // Only use when app is open.
        //locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        // Do any additional setup after loading the view.
    }

    // network request which returns location coordinates
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print(location.coordinate)
            coordinate=location.coordinate
            lat = location.coordinate.latitude
            lon = location.coordinate.longitude
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPlaceMe(_ sender: Any) {
        
    }
    
}
