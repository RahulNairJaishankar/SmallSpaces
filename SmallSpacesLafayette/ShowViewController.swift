//
//  ShowViewController.swift
//  SmallSpacesLafayette
//
//  Created by Rahul Nair Jaishakar on 12/13/15.
//  Copyright © 2015 ENGL108. All rights reserved.
//

import UIKit
import MapKit

class ShowViewController: UIViewController
{
    @IBOutlet var ImageView: UIImageView!
    @IBOutlet var DescriptionVIew: UITextView!
    @IBOutlet var AuthorVIew: UILabel!
    @IBAction func showOnMapButton(sender: UIButton) {
        
        performSegueWithIdentifier("showOnMap", sender: self)
        
    }
    
    var Image = UIImage()
    var Name: String!
    var desc: String!
    var annotation = MKPointAnnotation()
    var location = CLLocationCoordinate2D()
    
    override func viewDidLoad() {
        ImageView.image = Image
        DescriptionVIew.text = desc
        AuthorVIew.text = "Artist: \(Name)"
        
        DescriptionVIew.font = UIFont(name: "Helvetica", size: 18)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showOnMap"
        {
            let vc = segue.destinationViewController as! ShowMapViewController
            vc.location = location
            vc.annotation = annotation
        }
        
        if(segue.identifier == "showLargerImage") //for showing the larger image.
        {
            let vc = segue.destinationViewController as! ShowLargerImageViewController
            
            vc.image = Image
        }
        
        
    }
    
    
    
}
