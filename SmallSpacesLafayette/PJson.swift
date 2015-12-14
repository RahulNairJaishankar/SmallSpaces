//
//  PJson.swift
//  SmallSpacesLafayette
//
//  Created by Rahul Nair Jaishakar on 12/9/15.
//  Copyright © 2015 ENGL108. All rights reserved.
//

import UIKit
import MapKit
class PJson
{
    var image = UIImage()
    var lat:CLLocationDegrees
    var long: CLLocationDegrees
    var location: CLLocationCoordinate2D
    var annotation = MKPointAnnotation()
    var artistName: String
    var Description: String
    //var rightButton: UIButton
    
    init(lat: CLLocationDegrees, long: CLLocationDegrees, artistName: String, artImage: UIImage, description: String)
    {
        self.lat = lat
        self.long = long
        location = CLLocationCoordinate2DMake(lat, long)
        annotation.coordinate = location
        self.artistName = artistName
        self.image = artImage
        self.Description = description
        //annotation.title = self.artistName
        //rightButton = UIButton(type: .DetailDisclosure)
        //UIButton.buttonWithType(UIButtonType.DetailDisclosure) as UIButton
        //annotation.subtitle = "Finally made this work"
    }
}

