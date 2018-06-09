//
//  ExtensionViewController.swift
//  WeatherAppChallange
//
//  Created by Erkut Baş on 6/9/18.
//  Copyright © 2018 Erkut Baş. All rights reserved.
//

import UIKit

extension ViewController : UITextFieldDelegate {
    
    func prepareViewLoadProcess() {
        
        weatherSearchByCity.cityNameText.delegate = self
        weatherSearchByCity.referenceMasterView = self
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        navigationController?.isNavigationBarHidden = false
        
    }
    
    func addSubViewIntoSafeArea() {
        
        weatherSearchByCity.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(weatherSearchByCity)
        weatherSearchByCity.initializeView()
        
        weatherSearchByCity.heightAnchor.constraint(equalToConstant: 734).isActive = true
        
        let safeGuide = self.view.safeAreaLayoutGuide
        weatherSearchByCity.topAnchor.constraint(equalTo: safeGuide.topAnchor).isActive = true
        weatherSearchByCity.centerXAnchor.constraint(equalTo: safeGuide.centerXAnchor).isActive = true
        weatherSearchByCity.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor).isActive = true
        weatherSearchByCity.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor ).isActive = true
        
    }
    
    // to close keyboard when touches somewhere else but keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    // to close keyboard when press return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
        
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        
        UIView.transition(with: weatherSearchByCity.mainStackView, duration: 0.3, options: .transitionCrossDissolve, animations: {
            
            self.weatherSearchByCity.mainStackView.alpha = 0.0
            
        })
        
        return true
    }
    
}
