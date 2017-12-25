//
//  CityViewController.swift
//  CityViewJsonMVVM
//
//  Created by macbook on 12/24/17.
//  Copyright © 2017 Jaminya. All rights reserved.
//

import UIKit

// Global constants
struct Constants {
    static let kNumberOfSections = 1
}

class CityViewController: UIViewController {
    
    
    @IBOutlet weak var cityTableView: UITableView!
 
    let cellIdentifier = "CityCell"
    
    //let cities = (UIApplication.shared.delegate as! AppDelegate).cities
    
    var downloadMgr = DownloadManager()
    var cities = [CityViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.downloadMgr.downloadJson(completion: reloadTable)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Mark: - Completion handler
    
    func reloadTable() -> () {
        DispatchQueue.main.async {
            self.cities = self.downloadMgr.cityViewModels
            self.cityTableView.reloadData()
            print("Reload complete")
        }
    }
    
}


extension CityViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return Constants.kNumberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // Before download function returns city count is nil so set to 16 rows
        if self.cities.count > 0 {
            return self.cities.count
        } else {
            return 16
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if (cell == nil) {
            cell = UITableViewCell(
                style: UITableViewCellStyle.default,
                reuseIdentifier: cellIdentifier
            )
        }

        if self.cities.count > 0 {
            let cityViewModel = self.cities[indexPath.row]
            cell?.textLabel?.text = cityViewModel.cityName
        } else {
            cell?.textLabel?.text = "city_text"
        }
        
        return cell!
    }
}
