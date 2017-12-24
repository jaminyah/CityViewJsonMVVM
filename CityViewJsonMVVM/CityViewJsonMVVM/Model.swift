//
//  Model.swift
//  CityViewJsonMVVM
//
//  Created by macbook on 12/24/17.
//  Copyright © 2017 Jaminya. All rights reserved.
//

import Foundation

struct City {
    let flagUrl: String?
    let slug:String?
    let team: Teams?
    let name: String?
    let region: Region
    let coordinate: Coordinates?
}

struct Coordinates {
    let latitude: Double?
    let longitude: Double?
}

struct Region {
    let state: String?
    let region: String?
}

struct Teams {
    let sports_team: String?
}
