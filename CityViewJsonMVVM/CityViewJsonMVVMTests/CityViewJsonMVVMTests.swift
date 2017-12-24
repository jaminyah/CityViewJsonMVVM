//
//  CityViewJsonMVVMTests.swift
//  CityViewJsonMVVMTests
//
//  Created by macbook on 12/23/17.
//  Copyright © 2017 Jaminya. All rights reserved.
//

import XCTest
@testable import CityViewJsonMVVM

class CityViewJsonMVVMTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCityViewModel() {
        let abiline = City(flagUrl: "http://abiline.link", slug: "Abiline", team:(Teams(sports_team:"Raptors")),
                           name: "Abiline", region:(Region(state:"TX", region: "South Central")),
                           coordinate:(Coordinates(latitude: 92.120, longitude:32.140)))
        
        let cityViewModel = CityViewModel(city: abiline)
        XCTAssertEqual(cityViewModel.cityName, "Abiline")
        XCTAssertEqual(cityViewModel.flagURL, NSURL(string: abiline.flagUrl!))
    }
    
}
