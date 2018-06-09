//
//  ExtensionRefreshController.swift
//  WeatherAppChallange
//
//  Created by Erkut Baş on 6/9/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

extension RefreshedViewController {
    
    func initiateRefreshProcess() {
        
        getRefreshedData(inputCityName: City.shared.cityName) { (result) in
            if result {
                
                print("Success")
            }
        }
        
    }
    
    func getRefreshedData(inputCityName : String, completion: @escaping (_ result: Bool) -> Void) {
        
        if !inputCityName.isEmpty {
            
            let textWithoutSpaces = inputCityName.replacingOccurrences(of: Constants.Characters.SPACE_CHARACTER, with: Constants.Characters.replaceCharactersAscii)
            
            let url = URL(string: Constants.URLConstants.weatherUrlQueryPart + textWithoutSpaces + Constants.URLConstants.weatherUrlApiKey)
            
            guard let urlUnwrapped = url else {
                
                AlertViewManager.shared.createAlert_2(title: "Error", message: "Weather can not be read", preferredStyle: .alert, actionTitle: "OK", actionStyle: .default, selfDismiss: true, seconds: 3, completionHandler: nil)
                
                return
            }
            
            let task = URLSession.shared.dataTask(with: urlUnwrapped) { (data, urlResponse, error) in
                
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
                        
                        print("jsonResult : \(jsonResult!["weather"])")
                        if let weatherData = jsonResult!["weather"] as! [[String : AnyObject]]? {
                            
                            self.setAndSyncDataUIweather(inputData: weatherData)
                            
                        }
                        
                        completion(true)
                        
                    }
                    
                }
                
            }
            
            task.resume()
            
        }
        
    }
    
    func setAndSyncDataUIweather(inputData : [[String : AnyObject]]) {
        
        Weather.shared.parseWeather(inputData: inputData)
        
        DispatchQueue.main.sync(execute: {
            
            self.explanation.text = Weather.shared.main + " - " + Weather.shared.description
            
        })
        
    }
    
    func setAndSyncDataUI(inputData : NSDictionary) {
        
        Weather.shared.parseMain(inputData: inputData)
        
        DispatchQueue.main.sync(execute: {
            
            self.temp.text = String(format: "%.3f", Double(Weather.shared.temp))
            self.minTemp.text = String(format: "%.3f", Double(Weather.shared.minTemp))
            self.maxTemp.text = String(format: "%.3f", Double(Weather.shared.maxTemp))
            self.humadity.text = String(format: "%.3f", Double(Weather.shared.humidity))
            self.pressure.text = String(format: "%.3f", Double(Weather.shared.pressure))
            
        })
        
    }
}
