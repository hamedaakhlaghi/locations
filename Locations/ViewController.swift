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
    var locationManager = CLLocationManager()
    
    var didFindMyLocation = true

    @IBOutlet weak var mapView: GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        initializeTheLocationManager()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {

            self.mapView.isMyLocationEnabled = true

    }
    @IBAction func act(_ sender: Any) {
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        self.mapView.camera = camera
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView

    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.authorizedWhenInUse {
            self.mapView.isMyLocationEnabled = true
        }
    }
//    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutableRawPointer) {
//        if !didFindMyLocation {
//            let myLocation: CLLocation = change[NSKeyValueChangeNewKey] as CLLocation
//            viewMap.camera = GMSCameraPosition.cameraWithTarget(myLocation.coordinate, zoom: 10.0)
//            viewMap.settings.myLocationButton = true
//            
//            didFindMyLocation = true
//        }
//    }
    
    func initializeTheLocationManager()
    {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        let location = locationManager.location
        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 2.9)
        
        self.mapView?.animate(to: camera)

    }
    
    
    



}

