//
//  ShowLargerImageViewController.swift
//  SmallSpacesLafayette
//
//  Created by Rahul Nair Jaishakar on 12/13/15.
//  Copyright © 2015 ENGL108. All rights reserved.
//

import UIKit

class ShowLargerImageViewController: UIViewController
{
    
    @IBOutlet var ImageView: UIImageView!
    
    var image = UIImage()
    
    override func viewDidLoad() {
        ImageView.image = image
    }
}
