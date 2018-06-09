//
//  QueriedCityTableViewCell.swift
//  WeatherAppChallange
//
//  Created by Erkut Baş on 6/9/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

class QueriedCityTableViewCell: UITableViewCell {

    @IBOutlet var cityName: UILabel!
    var city = City()
    var referanceView = QueriedCityViewController()
    var ref = TimeBasedViewController()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func refreshPreviousCityData(_ sender: Any) {
        
        referanceView.performSegue(withIdentifier: Constants.Segue.gotoRefresh, sender: nil)
        
    }
    
    @IBAction func gotoTimeFilter(_ sender: Any) {
        
        if let destinationViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TimeBasedViewController") as? TimeBasedViewController {
            
            destinationViewController.present(destinationViewController, animated: true, completion: nil)
            
        }
    }
}
