//
//  ShowMapViewController.swift
//  SmallSpacesLafayette
//
//  Created by Rahul Nair Jaishakar on 12/13/15.
//  Copyright © 2015 ENGL108. All rights reserved.
//

import UIKit
import MapKit

class ShowMapViewController: UIViewController
{
    @IBOutlet var map: MKMapView!
    var annotation = MKPointAnnotation()
    var location = CLLocationCoordinate2D()
    
    override func viewDidLoad() {
        var latitude: CLLocationDegrees = 40.420038 // default view of map
        var longitude: CLLocationDegrees = -86.891996
        var latDelta:CLLocationDegrees = 0.007
        var lonDelta:CLLocationDegrees = 0.007
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        //var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        //map.setRegion(region, animated: true)
        
        map.addAnnotation(annotation)
        map.setRegion(MKCoordinateRegionMake(location, span), animated: true)
        
        
        
    }
    
}
