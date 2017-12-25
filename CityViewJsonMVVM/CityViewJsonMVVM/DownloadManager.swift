//
//  DownloadManager.swift
//  CityViewJsonMVVM
//
//  Created by macbook on 12/24/17.
//  Copyright © 2017 Jaminya. All rights reserved.
//
//  Purpose: Downloads remote JSON data and populates an array of viewModels. 
//           ViewModel contains city name and flagUrl data.
//  Public property: var cityViewModels
//


import Foundation

class DownloadManager: NSObject, URLSessionDelegate {
    
    // Create URLSession that uses a delegate
    private lazy var session: URLSession = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
    private let JsonUrl = "http://cdn.jaminya.com/json/cities.json"
    private var cities = [City]()
    
    // Public properties
    var cityViewModels = [CityViewModel]()
        
    // Function downloads JSON data and reload table view with completion handler
    func downloadJson(completion: @escaping ()->()) {
        // Debug
        print("In downloadJson")
        
        // Convert JsonURl string to type URL
        let sessionUrl = URL(string: JsonUrl)!
        
        let task = session.dataTask(with: sessionUrl) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                
                if let data = data {
                    
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                        
                        if let major_cities = json?["major_cities"] as? NSArray {
                            
                            self.buildCitiesFrom(jsonArray: major_cities)
                            self.buildArrayOfViewModels(cityArray: self.cities)
                            
                            // debug
                            print("Debugging self.cities")
                            print(major_cities[0])
                        }
                    } catch let error as NSError {
                        print("Failed to parse: \(error.localizedDescription)")
                    }
                }
            }
            // Run completion handler
            completion()
        }
        task.resume()
    }
    
    // Function creates an array of cities by parsing received json
    private func buildCitiesFrom(jsonArray:NSArray?) {
        self.cities.removeAll()
        var index = 0
        var games: Teams = Teams()
        var location: Coordinates = Coordinates()
        var geography: Region = Region()
        
        if let cityArray = jsonArray {
            while (index < cityArray.count) {
                let city = cityArray[index] as? NSDictionary
                let flagLink = city?["flagUrl"] as? String
                let slugName = city?["slug"] as? String
                let team = city?["sports_team"] as? String
                let cityName = city?["city"] as? String
                let stateName = city?["state"] as? String
                let regionName = city?["region"] as? String
                let lat = city?["latitude"] as? Double
                let long = city?["longitude"] as? Double
                
                games.sports_team = team
                location.latitude = lat
                location.longitude = long
                geography.region = regionName
                geography.state = stateName
                
                // Creates an array of city objects
                self.cities.append(City(flagUrl:flagLink, slug:slugName, team:games,
                                        name:cityName, region:geography,
                                        coordinates:location))
                index = index + 1
            }
        }
    }
    
    // Function creates an array of viewModels initialized with city objects
    private func buildArrayOfViewModels(cityArray: [City]) {
        var index = 0
        while (index < cityArray.count) {
            self.cityViewModels.append(CityViewModel(city: cityArray[index]))
            index = index + 1
        }
    }

} // DownloadManager
