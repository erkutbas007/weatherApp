//
//  ExtensionTimeBasedController.swift
//  WeatherAppChallange
//
//  Created by Erkut Baş on 6/9/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

extension TimeBasedViewController: UITableViewDelegate, UITableViewDataSource, XMLParserDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Forecast.shared.resultData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewProperties.timeFilterCell, for: indexPath) as? TimeBasedTableViewCell else {
            
            return UITableViewCell()
            
        }
        
        cell.timeLabel.text = Forecast.shared.resultArray[indexPath.row].from
        
        return cell
    }
    
    func getTimeBasedWeatherData(inputCityName : String) {
        
        if !inputCityName.isEmpty {
            
            let textWithoutSpaces = inputCityName.replacingOccurrences(of: Constants.Characters.SPACE_CHARACTER, with: Constants.Characters.replaceCharactersAscii)
            
            let url = URL(string: Constants.URLConstants.weatherUrlQueryPartTimeBased + textWithoutSpaces + Constants.URLConstants.weatherUrlApiKeyTimeBased)
            
            guard let urlUnwrapped = url else {
                
                AlertViewManager.shared.createAlert_2(title: "Error", message: "Weather can not be read", preferredStyle: .alert, actionTitle: "OK", actionStyle: .default, selfDismiss: true, seconds: 3, completionHandler: nil)
                
                return
            }
            
            print("urlUnwrapped : \(urlUnwrapped)")
            
            guard let parser = XMLParser(contentsOf: urlUnwrapped) else {
                print("Cannot Read Data")
                return
            }
            
            parser.delegate = self
            
            let success:Bool = parser.parse()
            if success {
                print("success")
            } else {
                print("parse failure!")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableview.cellForRow(at: indexPath) as! TimeBasedTableViewCell
        
        for item in Forecast.shared.resultData {
            
            print("item key : \(item.key)")
            
            let tempF = item.value as Forecast
            
            print("item value :\(tempF.max)")
            
        }
        
        let tempForecast = Forecast.shared.resultData[cell.timeLabel.text!] as! Forecast

        let message = "Max : " + tempForecast.max + " " + "Min : " + tempForecast.min + " " + "Value : " + tempForecast.value
        
        AlertViewManager.shared.createAlert(title: "Info", message: message, preferredStyle: .alert, actionTitle: "OK", actionStyle: .default, completionHandler: nil)
        
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        print("elementName :\(elementName)")
        
        if elementName == "time" || elementName == "temperature" {
            
            print("attributeDict : \(attributeDict)")
            for string in attributeDict {
                
                print("string.key : \(string.key)")
                
                switch string.key {
                case "to":
                    tempForecat.to = string.value
                case "from":
                    tempForecat.from = string.value
                case "min":
                    tempForecat.min = string.value
                case "max":
                    tempForecat.max = string.value
                case "value":
                    tempForecat.value = string.value
                default:
                    continue
                }
                
            }
            
            print("tempForecat.from : \(tempForecat.from)")
            print("tempForecat.to : \(tempForecat.to)")
            print("tempForecat.min : \(tempForecat.min)")
            print("tempForecat.value : \(tempForecat.value)")
            print("tempForecat.max : \(tempForecat.max)")
            
            if !tempForecat.from.isEmpty && !tempForecat.to.isEmpty && !tempForecat.min.isEmpty && !tempForecat.max.isEmpty && !tempForecat.value.isEmpty {
                
                Forecast.shared.createList(inputString: tempForecat.from, forecast: tempForecat)
                
                tempForecat = Forecast()
                
            }
            
        }
        
        tableview.reloadData()
        
    }
    
}
