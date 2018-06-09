//
//  City.swift
//  WeatherAppChallange
//
//  Created by Erkut Baş on 6/8/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class City {
    
    public static let shared = City()
    
    private var _latitude : CGFloat!
    private var _longitude : CGFloat!
    private var _country : String!
    private var _cityID : String!
    private var _cityName : String!
    
    private var _cityDictionary : Dictionary<String, City>
    
    private var _queriedCityArray : Array<City>

    init() {
        _cityDictionary = Dictionary<String, City>()
        _queriedCityArray = Array<City>()
    }
    
    var latitude: CGFloat {
        get {
            return _latitude
        }
        set {
            _latitude = newValue
        }
    }
    
    var longitude : CGFloat {
        get {
            return _longitude
        }
        set {
            _longitude = newValue
        }
    }
    
    var country: String {
        get {
            return _country
        }
        set {
            _country = newValue
        }
    }
    
    var cityID: String {
        get {
            return _cityID
        }
        set {
            _cityID = newValue
        }
    }
    
    var cityName: String {
        get {
            return _cityName
        }
        set {
            _cityName = newValue
        }
    }
    
    func initializeParseProcess() {
        
        DispatchQueue.main.async(execute: {
            
            self.parseCityData()
            
        })
        
    }
    
    var queriedCityArray: Array<City> {
        get {
            return _queriedCityArray
        }
        set {
            _queriedCityArray = newValue
        }
    }
    
    func insertElementToArray(inputCity : City) {
        
        _queriedCityArray.append(inputCity)
        
    }
    
    func parseCityData() {
        
        let urlBundle = Bundle.main.url(forResource: "city.list", withExtension: "json")
        
        do {
            
            if let urlBundleUnwrapped = urlBundle {
                
                let jsonData = try Data(contentsOf: urlBundleUnwrapped)
                let json2 = try JSONSerialization.jsonObject(with: jsonData, options: []) as! Array<NSDictionary>

                for item in json2 {
                    
                    if let dictionaryData = item as NSDictionary? {
                        
                        //print("item name : \(String(describing: dictionaryData["name"]))")
                        
                        let tempCity = City()
                        
                        tempCity.cityID = String(describing: dictionaryData["id"])
                        tempCity.cityName = String(describing: dictionaryData["name"])
                        tempCity.country = String(describing: dictionaryData["country"])
                        
                        if let coord = dictionaryData["coord"] as! NSDictionary? {
                            
                            tempCity.latitude = coord["lat"] as! CGFloat
                            tempCity.longitude = coord["lon"] as! CGFloat
                            
                            
                        }
                        
                        _cityDictionary[tempCity.cityID] = tempCity
                        
                    }
                }
            }
            
            
        } catch {
            
            print("error handled")
            
        }
        
        for item in _cityDictionary {
            
            print("item key : \(item.key)")
            print("item val : \(item.value.cityName)")
            
        }
        
        
    }
    
}

