//
//  WeatherSearchByCity.swift
//  WeatherAppChallange
//
//  Created by Erkut Baş on 6/9/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class WeatherSearchByCity : UIView {
    
    var referenceMasterView : ViewController!
    let userDefaults = UserDefaults.standard
    
    @IBOutlet var cityNameText: UITextField!
    @IBOutlet var mainStackView: UIStackView!
    @IBOutlet var temp: UILabel!
    @IBOutlet var minTemp: UILabel!
    @IBOutlet var maxTemp: UILabel!
    @IBOutlet var Pressure: UILabel!
    @IBOutlet var Humidity: UILabel!
    
    func initializeView() {
        
        // to do....
        
        mainStackView.alpha = 0.0
    }
    
    func dismissKeyboard() {
        
        self.cityNameText.resignFirstResponder()
        
    }
    
    @IBAction func getWeatherInfo(_ sender: Any) {
        
        dismissKeyboard()
        
        City.shared.cityName = cityNameText.text!

        if let city = cityNameText.text {
            
            if !city.isEmpty {
                
                let textWithoutSpaces = city.replacingOccurrences(of: Constants.Characters.SPACE_CHARACTER, with: Constants.Characters.replaceCharactersAscii)
                
                let url = URL(string: Constants.URLConstants.weatherUrlQueryPart + textWithoutSpaces + Constants.URLConstants.weatherUrlApiKey)
                
                guard let urlUnwrapped = url else {
                    
                    AlertViewManager.shared.createAlert_2(title: "Error", message: "Weather can not be read", preferredStyle: .alert, actionTitle: "OK", actionStyle: .default, selfDismiss: true, seconds: 3, completionHandler: nil)
                    
                    return
                }
                
                getApiData(url: urlUnwrapped)
                
            }
            
        }
        
    }
    
    func getApiData(url : URL) {
        
        let task = URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            
            if error != nil {
                
                if let errorCode = error as NSError? {
                    
                    print("errorCode : \(errorCode.code)")
                    print("errorCodeExp : \(errorCode.localizedDescription)")
                    
                    AlertViewManager.shared.createAlert_2(title: "Error", message: errorCode.localizedDescription, preferredStyle: .alert, actionTitle: "OK", actionStyle: .default, selfDismiss: true, seconds: 3, completionHandler: nil)
                    
                }
                
            } else {
                
                if let urlContentData = data {
                    
                    let jsonResult = try? JSONSerialization.jsonObject(with: urlContentData, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                    
                    print("jsonResult : \(jsonResult!["main"])")
                    
                    if let mainData = jsonResult!["main"] as! NSDictionary? {
                        
                        self.setAndSyncDataUI(inputData: mainData)
                        
                    }
                    
                }
                
            }
            
        }
        
        task.resume()
        
    }
    
    func setAndSyncDataUI(inputData : NSDictionary) {
        
        Weather.shared.temp = inputData["temp"] as! CGFloat
        Weather.shared.minTemp = inputData["temp_min"] as! CGFloat
        Weather.shared.maxTemp = inputData["temp_max"] as! CGFloat
        Weather.shared.humidity = inputData["humidity"] as! CGFloat
        Weather.shared.pressure = inputData["pressure"] as! CGFloat
        
        DispatchQueue.main.sync(execute: {
            
            self.temp.text = String(format: "%.3f", Double(Weather.shared.temp))
            self.minTemp.text = String(format: "%.3f", Double(Weather.shared.minTemp))
            self.maxTemp.text = String(format: "%.3f", Double(Weather.shared.maxTemp))
            self.Humidity.text = String(format: "%.3f", Double(Weather.shared.humidity))
            self.Pressure.text = String(format: "%.3f", Double(Weather.shared.pressure))
            
            saveQueriedCities()
            
            UIView.transition(with: self.mainStackView, duration: 0.3, options: .transitionCrossDissolve, animations: {
                
                self.mainStackView.alpha = 1.0
                
            })
            
        })
        
    }
    
    func saveQueriedCities() {
        
        let cityObj = City()
        
        cityObj.cityName = cityNameText.text!
        
        City.shared.insertElementToArray(inputCity: cityObj)
        
    }
    
    @IBAction func dismissView(_ sender: Any) {
        
//        referenceMasterView.dismiss(animated: true) {
//
//            print("dismiss ok")
//
//        }

        self.removeFromSuperview()
        
    }
    
}
