//
//  SecondViewController.swift
//  SmallSpacesLafayette
//
//  Created by Rahul Nair Jaishakar on 12/8/15.
//  Copyright © 2015 ENGL108. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{

    @IBOutlet var CollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ParsedJson.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CollectionViewCell
        
        cell.ImageView.image = ParsedJson[indexPath.row].image
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showImage", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showImage"
        {
            let indexPaths = self.CollectionView!.indexPathsForSelectedItems()!
            let indexPath = indexPaths[0] as NSIndexPath
            
            let vc = segue.destinationViewController as! ShowViewController
            
            vc.Image = ParsedJson[indexPath.row].image
            vc.desc = ParsedJson[indexPath.row].Description
            vc.Name = ParsedJson[indexPath.row].artistName
            vc.annotation = ParsedJson[indexPath.row].annotation
            vc.location = ParsedJson[indexPath.row].location
            
            }
    
    }


}

