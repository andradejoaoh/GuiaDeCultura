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

class MapaViewController: UIViewController {
    @IBOutlet weak var map: MKMapView!
    
    var locManager:CLLocationManager!
    var gerenciador = FileController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        locManager = CLLocationManager()
        
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locManager.requestWhenInUseAuthorization()
        }
        
        map.userTrackingMode = .follow
        map.mapType = MKMapType.standard
        map.isZoomEnabled = true
        map.isRotateEnabled = true
        map.isScrollEnabled = true
        map.showsUserLocation = true
        map.showsCompass = true

        gerenciador.lerArquivoCentros()
        
        for i in 0..<gerenciador.vetorCentros.count{
            let address = gerenciador.vetorCentros[i].location
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(address) { (placemarks, error) in
                guard let placemarks = placemarks, let location = placemarks.first?.location else {
                        return
                }
                let marker = MKPointAnnotation()
                marker.title = self.gerenciador.vetorCentros[i].name
                marker.coordinate = location.coordinate
                self.map.addAnnotation(marker)
            }
            
        }
    }
}
