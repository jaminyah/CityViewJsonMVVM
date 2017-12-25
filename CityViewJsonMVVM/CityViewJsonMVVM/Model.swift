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
    let coordinates: Coordinates?
}

struct Coordinates {
    var latitude: Double?
    var longitude: Double?
}

struct Region {
    var state: String?
    var region: String?
}

struct Teams {
    var sports_team: String?
}
