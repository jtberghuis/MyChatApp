//
//  WeatherViewController.swift
//  MyChatApp
//
//  Created by Jordan Berghuis on 8/12/18.
//  Copyright © 2018 Jordan Berghuis. All rights reserved.
//

import UIKit
import Firebase

class WeatherViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var btnSunny: UIButton!
    @IBOutlet weak var btnFoggy: UIButton!
    
    @IBAction func btnSunny_TouchUpInside(_ sender: Any) {
        weatherNodeRef.setValue("Sunny")
    }
    
    @IBAction func btnFoggy_TouchUpInside(_ sender: Any) {
        weatherNodeRef.setValue("Foggy")
    }
    
    let weatherNodeRef = FIRDatabase.database().reference().child("weatherCondition")
    
    override func viewDidAppear(_ animated: Bool) {
        weatherNodeRef.observe(.value, with: { (snapshot: FIRDataSnapshot) in
            self.lblWelcome.text = (snapshot.value as AnyObject).debugDescription
            
        })
    }
    
}
