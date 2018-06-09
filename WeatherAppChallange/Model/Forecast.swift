//
//  Forecast.swift
//  WeatherAppChallange
//
//  Created by Erkut Baş on 6/9/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class Forecast {
    
    public static let shared = Forecast()
    
    private var _from : String
    private var _to : String
    private var _value : String
    private var _min : String
    private var _max : String
    
    private var _resultData : Dictionary<String, Forecast>
    private var _resultArray : Array<Forecast>
    
    init() {
        
        _from = ""
        _to = ""
        _value = ""
        _min = ""
        _max = ""
        _resultData = Dictionary<String, Forecast>()
        _resultArray = Array<Forecast>()
    }
    
    var from: String {
        get {
            return _from
        }
        set {
            _from = newValue
        }
    }
    
    var to: String {
        get {
            return _to
        }
        set {
            _to = newValue
        }
    }
    
    var value: String {
        get {
            return _value
        }
        set {
            _value = newValue
        }
    }
    
    var min: String {
        get {
            return _min
        }
        set {
            _min = newValue
        }
    }
    
    var max: String {
        get {
            return _max
        }
        set {
            _max = newValue
        }
    }
    
    var resultData: Dictionary<String, Forecast> {
        get {
            return _resultData
        }
        set {
            _resultData = newValue
        }
    }
    
    var resultArray: Array<Forecast> {
        get {
            return _resultArray
        }
        set {
            _resultArray = newValue
        }
    }
    
    func createList(inputString : String, forecast : Forecast) {
        
        _resultData[inputString] = forecast
        _resultArray.append(forecast)
        
    }
    
}
