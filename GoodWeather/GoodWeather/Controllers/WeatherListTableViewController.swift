//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by KSH on 2023/05/04.
//


import UIKit

class WeatherListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let resource = Resoucre<WeatherResponse>(url: URL(string: "")!) { data in
            
            return try? JSONDecoder().decode(WeatherResponse.self, from: data)
        }
        
        WebService().laod(resource: resource) { weatherResponse in
            if let weatherResponse = weatherResponse {
                print(weatherResponse)
            }
        }
    }
}

extension WeatherListTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        
        cell.cityNameLabel.text = "Korea"
        cell.temperatureLabel.text = "70°"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
