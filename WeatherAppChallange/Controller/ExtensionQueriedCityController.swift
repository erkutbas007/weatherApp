//
//  ExtensionQueriedCityController.swift
//  WeatherAppChallange
//
//  Created by Erkut Baş on 6/9/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

extension QueriedCityViewController : UITableViewDelegate, UITableViewDataSource {
    
    func getCityList() {
        
        let userDefaultsData = UserDefaults.standard
        let cityArray : Array<City> = userDefaultsData.array(forKey: Constants.UserDefaultsKey.queriedCityKey) as! Array<City>
        
        City.shared.queriedCityArray = cityArray
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return City.shared.queriedCityArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewProperties.queriedCityCell, for: indexPath) as? QueriedCityTableViewCell else {
            
            return UITableViewCell()
            
        }
        
        cell.city = City.shared.queriedCityArray[indexPath.row]
        cell.cityName.text = cell.city.cityName
        cell.referanceView = self
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            City.shared.queriedCityArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
        
    }
    
    
}
