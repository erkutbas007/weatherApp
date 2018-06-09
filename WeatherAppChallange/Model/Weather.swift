//
//  Weather.swift
//  WeatherAppChallange
//
//  Created by Erkut Baş on 6/9/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class Weather {
    
    public static var shared = Weather()
    
    private var _temp : CGFloat
    private var _minTemp : CGFloat
    private var _maxTemp : CGFloat
    private var _humidity : CGFloat
    private var _pressure : CGFloat
    
    private var _main : String
    private var _description : String
    
    init() {
        
        _temp = 0
        _minTemp = 0
        _maxTemp = 0
        _humidity = 0
        _pressure = 0
        _main = Constants.Characters.SPACE_CHARACTER
        _description = Constants.Characters.SPACE_CHARACTER
        
    }
    
    func parseWeather(inputData : [[String : Any]]) {
        
        for item in inputData {
            
            _main = inputData[0]["main"] as! String
            _description = inputData[0]["description"] as! String
        }
    }
    
    func parseMain(inputData : NSDictionary) {
        
        _temp = inputData["temp"] as! CGFloat
        _minTemp = inputData["temp_min"] as! CGFloat
        _maxTemp = inputData["temp_max"] as! CGFloat
        _humidity = inputData["humidity"] as! CGFloat
        _pressure = inputData["pressure"] as! CGFloat
        
    }
    
    var temp: CGFloat {
        get {
            return _temp
        }
        set {
            _temp = newValue
        }
    }
    
    var minTemp: CGFloat {
        get {
            return _minTemp
        }
        set {
            _minTemp = newValue
        }
    }
    
    var maxTemp: CGFloat {
        get {
            return _maxTemp
        }
        set {
            _maxTemp = newValue
        }
    }
    
    var humidity: CGFloat {
        get {
            return _humidity
        }
        set {
            _humidity = newValue
        }
    }
    
    var pressure: CGFloat {
        get {
            return _pressure
        }
        set {
            _pressure = newValue
        }
    }
    
    var main: String {
        get {
            return _main
        }
        set {
            _main = newValue
        }
    }
    
    var description: String {
        get {
            return _description
        }
        set {
            _description = newValue
        }
    }
    
    
}
