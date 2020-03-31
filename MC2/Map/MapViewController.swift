//
//  MapaViewController.swift
//  MC2
//
//  Created by Eloisa Falcão on 09/05/19.
//  Copyright © 2019 Eloisa Falcão. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    @IBOutlet weak var map: MKMapView!
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        checkLocationServices()
        
        map.userTrackingMode = .follow
        map.mapType = MKMapType.standard
        map.isZoomEnabled = true
        map.isRotateEnabled = true
        map.isScrollEnabled = true
        map.showsUserLocation = true
        map.showsCompass = true

        JSONHandler.shared.lerArquivoCentros()
        
        for i in 0..<JSONHandler.shared.vetorCentros.count{
            let address = JSONHandler.shared.vetorCentros[i].location
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(address) { (placemarks, error) in
                guard let placemarks = placemarks, let location = placemarks.first?.location else {
                        return
                }
                let marker = MKPointAnnotation()
                marker.title = JSONHandler.shared.vetorCentros[i].name
                marker.coordinate = location.coordinate
                self.map.addAnnotation(marker)
            }
            
        }
    }
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            checkLocationAuthorization()
        } else {
            // Show alert letting the user know they have to turn this on.
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            map.showsUserLocation = true
        // For these case, you need to show a pop-up telling users what's up and how to turn on permisneeded if needed
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            map.showsUserLocation = true
        case .restricted:
            break
        case .authorizedAlways:
            break
        @unknown default:
            fatalError()
        }
    }
    
}
