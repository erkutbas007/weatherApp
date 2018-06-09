//
//  ViewController.swift
//  WeatherAppChallange
//
//  Created by Erkut Baş on 6/8/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var weatherSearchByCity: WeatherSearchByCity!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //City.shared.initializeParseProcess()
        prepareViewLoadProcess()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func searchBycity(_ sender: Any) {
        
        addSubViewIntoSafeArea()
        
    }
    
    @IBAction func gotoPreviousSearches(_ sender: Any) {
        
        performSegue(withIdentifier: Constants.Segue.gotoPreviousCityPage, sender: self)
        
    }
    @IBAction func gotoTimeFilter(_ sender: Any) {
        
        performSegue(withIdentifier: Constants.Segue.gotoFilter, sender: self)
        
    }
    
}

