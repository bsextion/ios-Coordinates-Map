//
//  MapViewController.swift
//  Take-Home_Lab2_Team2
//  Copyright © 2017 uhd. All rights reserved.
//// CS 4340 - Dr. Shastri, Lab2
// Group 2: Brooke Sextion, Kiyunna Flourius
// Description: This app will allow user to input the destination, destination description, latitude, longtitude and will display the coordinates on a map along with the destination and description. //


import UIKit
import MapKit

class MapViewController: UIViewController {
   @IBOutlet var mapView: MKMapView!
    
    
    // Variables
    var locationName = String()
    var locationDescription = String()
    var latitude = Double()
    var longitude = Double()
    
    override func loadView() {
        // Create a map view
        mapView = MKMapView()
        
        // Set it as *the* view of this view controller
        view = mapView
    
        
        // Segmented Control and displays 3 different map views
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor,
                                                                  constant: 8)
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), for: .valueChanged)
        
        
    }
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl){
        switch segControl.selectedSegmentIndex {
        case 0: mapView.mapType = .standard
        case 1: mapView.mapType = .hybrid
        case 2: mapView.mapType = .satellite
        default: break
        }
    }
    
    override func viewDidLoad() {
        // Add Pins with annotations
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.1, 0.1)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
       
      
        //Annotation details
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "\(locationName)"
        annotation.subtitle = "\(locationDescription)"
        
        
        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(annotation)

        
        super.viewDidLoad()
        
        print("MapViewController loaded its view")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print ("MapViewController view will appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print ("MapViewController view will disappear")
    }
}
