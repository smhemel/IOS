//
//  ViewController.swift
//  My Address Map
//
//  Created by S M HEMEL on 29/12/18.
//  Copyright © 2018 S M HEMEL. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,MKMapViewDelegate {

    @IBOutlet weak var myMap: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //23.7444949,90.3868833
        
        let latitude: CLLocationDegrees = 23.75
        let longtude: CLLocationDegrees = 90.39
        let lanDelta: CLLocationDegrees = 0.05
        let lonDelta: CLLocationDegrees = 0.05
        let span = MKCoordinateSpan(latitudeDelta: lanDelta, longitudeDelta: lonDelta)
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longtude)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        myMap.setRegion(region, animated: true)
        
    }


}

