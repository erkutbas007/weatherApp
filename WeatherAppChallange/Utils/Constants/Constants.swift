//
//  Constants.swift
//  WeatherAppChallange
//
//  Created by Erkut Baş on 6/9/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

struct Constants {
    
    struct URLConstants {
        
        public static let weatherUrlQueryPart : String = "http://api.openweathermap.org/data/2.5/weather?q="
        public static let weatherUrlQueryPartTimeBased : String = "http://api.openweathermap.org/data/2.5/forecast?q="
        public static let weatherUrlApiKey : String = "&units=metric&APPID=8827fbf408dc7e1418f3c1e84596334c"
        public static let weatherUrlApiKeyTimeBased : String = ",us&mode=xml&appid=8827fbf408dc7e1418f3c1e84596334c"
        public static let weatherUnitMetric : String = "&units=metric&APPID=8827fbf408dc7e1418f3c1e84596334c"
    }
    
    struct Characters {
        
        public static let SPACE_CHARACTER : String = " "
        public static let replaceCharactersAscii : String = "%20"
        
    }
    
    struct UserDefaultsKey {
        
        public static let queriedCityKey : String = "queriedCity"
        
    }
    
    struct TableViewProperties {
        
        public static let queriedCityCell : String = "cell"
        public static let timeFilterCell : String = "timeFilterCell"
        
    }
    
    struct StoryBoardIdentifier {
        
        public static let QueriedCityViewController : String = "QueriedCityViewController"
        
    }
    
    struct Segue {
        
        public static let gotoPreviousCityPage : String = "gotoPreviousCityPage"
        public static let gotoRefresh : String = "gotoRefresh"
        public static let gotoFilter : String = "gotoFilter"
        
    }
    
}
