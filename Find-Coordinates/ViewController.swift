//
//  MapViewController.swift
//  Take-Home_Lab2_Team2
//  Copyright © 2017 uhd. All rights reserved.
//// CS 4340 - Dr. Shastri, Lab2
// Group 2: Brooke Sextion, Kiyunna Flourius
// Description: This app will allow user to input the destination, destination description, latitude, longtitude and will display the coordinates on a map along with the destination and description. //

import UIKit


class ViewController: UIViewController{
    @IBOutlet var destinationName: UITextField!
    @IBOutlet var destinationDescription: UITextField!
    @IBOutlet var destinationLatitude: UITextField!
    @IBOutlet var destinationLongitude: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        print ("GUI View has loaded")
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // If the name is changed, other fields will update
    @IBAction func destinationChanged(_textField: UITextField){
        if let name = destinationName.text, !name.isEmpty{
            destinationDescription.text = nil
            destinationLatitude.text = nil
            destinationLongitude.text = nil
        }
        else {
            destinationDescription.text = ""
            destinationLatitude.text = ""
            destinationLongitude.text = ""
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: AnyObject) {
        destinationName.resignFirstResponder()
        destinationDescription.resignFirstResponder()
        destinationLatitude.resignFirstResponder()
        destinationLongitude.resignFirstResponder()
        
    }
    
    lazy var latitude = (destinationLatitude.text)
    lazy var longtitude = ( destinationLongitude.text)
    
   // When you click the button, the pin should appear
    @IBAction func addLocation(_sender: Any)
    {
        if destinationName.text != nil, destinationDescription.text != nil,
            destinationLatitude.text != nil, destinationLongitude.text != nil
        {
            performSegue(withIdentifier: "segue", sender: self)
        }
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let mapViewController = segue.destination as! MapViewController
        mapViewController.locationName = destinationName.text!
        mapViewController.locationDescription = destinationDescription.text!
        mapViewController.latitude = Double(latitude!)!
        mapViewController.longitude = Double(longtitude!)!
    
    
    
   
}
}
