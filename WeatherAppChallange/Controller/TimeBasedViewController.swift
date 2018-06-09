//
//  TimeBasedViewController.swift
//  WeatherAppChallange
//
//  Created by Erkut Baş on 6/9/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class TimeBasedViewController: UIViewController {

    @IBOutlet var cityName: UITextField!
    @IBOutlet var tableview: UITableView!
    
    var tempForecat = Forecast()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchButtonClicked(_ sender: Any) {
        
        getTimeBasedWeatherData(inputCityName: cityName.text!)
        
    }
    
}
