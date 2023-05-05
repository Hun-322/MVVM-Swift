//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by KSH on 2023/05/04.
//


import UIKit

class WeatherListTableViewController: UITableViewController, AddWeatehrDelegate {
    
    private var weatherListViewModel = WeatherListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        weatherListViewModel.addWeatherViewModel(vm)
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWeatherCityViewController" {
            prepareSegueForAddWeatherCityVC(segue: segue)
        }
    }
    
    func prepareSegueForAddWeatherCityVC(segue: UIStoryboardSegue) {
        guard let navi = segue.destination as? UINavigationController else {
            fatalError("네비게이션 컨트롤러를 찾을 수 없습니다.")
        }
        
        guard let addWeatherCityVC = navi.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("AddWeatherCityViewController를 찾을 수 없습니다.")
        }
        
        addWeatherCityVC.delegate = self
    }
}

extension WeatherListTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.numberOfRows(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        
        let weatherVM = weatherListViewModel.modelAt(indexPath.row)
        cell.configure(weatherVM)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
