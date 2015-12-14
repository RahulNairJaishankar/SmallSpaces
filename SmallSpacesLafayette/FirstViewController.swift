//
//  FirstViewController.swift
//  SmallSpacesLafayette
//
//  Created by Rahul Nair Jaishakar on 12/8/15.
//  Copyright © 2015 ENGL108. All rights reserved.
//

import UIKit
import SwiftyJSON
import MapKit
import CoreLocation

var ParsedJson = [PJson]() //creating a usable data for the ap
//decalared as global variable.

class FirstViewController: UIViewController, MKMapViewDelegate,CLLocationManagerDelegate{

    @IBOutlet var map: MKMapView!
    var locationmanager = CLLocationManager()
    var selectedAnnotation = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //requesting for location
        locationmanager.delegate = self //delegating to this view.
        locationmanager.desiredAccuracy = kCLLocationAccuracyBest //Best accuraccy, use of GPS
        locationmanager.requestWhenInUseAuthorization() //requesting location rights when in use
        locationmanager.startUpdatingLocation() //location updating
        
        //setting default map view
        var latitude: CLLocationDegrees = 40.420038 // default view of map
        var longitude: CLLocationDegrees = -86.891996
        var latDelta:CLLocationDegrees = 0.007
        var lonDelta:CLLocationDegrees = 0.007
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        map.setRegion(region, animated: true)
        
        parseJson()
        
        for(var i = 0; i < 20; i++)//adding all annotations to the View.
        {
            map.addAnnotation(ParsedJson[i].annotation)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func parseJson()
    {
        let path: String = NSBundle.mainBundle().pathForResource("JSON", ofType: "json") as String!
        
        let jsonData = NSData(contentsOfFile: path) as NSData!
        
        let readableJson = JSON(data: jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil)
        
        //var test = readableJson["collection"]["person1"]["text"]
        //var test2 = readableJson["collection"]["person2"]["text"]
        //print("\(test)")
        //print("\(test2)")
        
        for(var i = 1; i < 21; i++)
            {
            var artistName = readableJson["collection"]["art\(i)"]["artistName"] //parsing data
            var description = readableJson["collection"]["art\(i)"]["description"]
            var artImage = readableJson["collection"]["art\(i)"]["image"]
            var lat = readableJson["collection"]["art\(i)"]["lat"]
            var long = readableJson["collection"]["art\(i)"]["long"]
            
            ParsedJson.append(PJson(lat: Double("\(lat)")!, long: Double("\(long)")!, artistName: "\(artistName)", artImage: UIImage(named: ("\(artImage)"))!, description: ("\(description)")))
            }
        
        }
    
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        
        if self.map.selectedAnnotations.count > 0 {
            
            let ann = self.map.selectedAnnotations[0] as! MKPointAnnotation
            
                let c = ann.coordinate
            
            for(var i = 0; i < ParsedJson.count; i++)
            {
                if(ParsedJson[i].lat == c.latitude)
                {
                    selectedAnnotation = i
                    self.performSegueWithIdentifier("AfterAnnotationClick", sender: self)
                }
            }

            }
        }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AfterAnnotationClick"
        {
            let vc = segue.destinationViewController as! ShowViewController
            
            vc.Image = ParsedJson[selectedAnnotation].image
            vc.desc = ParsedJson[selectedAnnotation].Description
            vc.Name = ParsedJson[selectedAnnotation].artistName
            vc.annotation = ParsedJson[selectedAnnotation].annotation
            vc.location = ParsedJson[selectedAnnotation].location
        }
    }


}

