//
//  CityViewModel.swift
//  CityViewJsonMVVM
//
//  Created by macbook on 12/24/17.
//  Copyright © 2017 Jaminya. All rights reserved.
//

import UIKit

class CityViewModel: NSObject {

    private var city: City
    
    var cityName: String? {
        return city.name
    }
    
    var flagURL: NSURL? {
        guard let url = city.flagUrl else {
            return nil
        }
        return NSURL(string: url)
    }
    
    init(city: City) {
        self.city = city
    }
}

