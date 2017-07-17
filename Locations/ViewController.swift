//
//  ViewController.swift
//  Locations
//
//  Created by hamed akhlaghi on 4/25/1396 AP.
//  Copyright © 1396 nuesoft. All rights reserved.
//

import UIKit
import GoogleMaps
import MapKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {
    var mapasasView: MKMapView?
    var locationManager:CLLocationManager!
    var didFindMyLocation = true
    private var currentLocation: CLLocation?


    @IBOutlet weak var mapView: GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = CLLocationDistance.init(exactly: 0.5)!
        
        self.locationManager.startUpdatingLocation()
        self.mapView.isMyLocationEnabled = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {


    }
    @IBAction func act(_ sender: Any) {
//        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
//        self.mapView.camera = camera
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
//        marker.title = "Sydney"
//        marker.snippet = "Australia"
//        marker.map = mapView

            if let userLocation = locationManager.location {
                let camera = GMSCameraPosition.camera(withLatitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude, zoom: 20.0)
                let alert = UIAlertController(title: "OPS!", message: "Location Changed", preferredStyle: .alert)
                let action = UIAlertAction(title: "change", style:  .default){action -> Void in
                    self.mapView?.animate(to: camera)
                }
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                self.locationManager.startUpdatingLocation()
            }
       

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        defer { currentLocation = locations.last }
        if currentLocation == nil {
            if let userLocation = locations.last {
                let camera = GMSCameraPosition.camera(withLatitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude, zoom: 20.0)
                let alert = UIAlertController(title: "OPS!", message: "Location Changed", preferredStyle: .alert)
                let action = UIAlertAction(title: "change", style:  .default){action -> Void in
                    self.mapView?.animate(to: camera)
                }
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
                self.locationManager.startUpdatingLocation()
            }
        }
    }

}

