//
//  GoogleMapView.swift
//  Savory
//
//  Created by Alumno on 27/11/24.
//

import SwiftUI
import GoogleMaps

struct GoogleMapView: UIViewRepresentable {
    
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
    let zoom: Float
   
    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: zoom)
        let options = GMSMapViewOptions()
        options.camera = camera
        let mapView = GMSMapView(options: options)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        marker.title = "ISIL"
        marker.snippet = "Sede Miraflores"
        marker.map = mapView
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    

}


