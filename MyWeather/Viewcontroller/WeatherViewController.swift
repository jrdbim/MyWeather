//
//  ViewController.swift
//  MyWeather
//
//  Created by Jiradet Amornpimonkul on 3/20/22.
//

import UIKit
import Combine

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var observer: AnyCancellable?
    let service = CurrentTempViewModel()
    var currentTemp: CurrentTempModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        
        observer = service.requestCurrentTemp()
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] currentTemp in
                self?.currentTemp = currentTemp
                self?.tableView.reloadData()
            })
    }
    
}

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: CurrentTempCell.identifier, bundle: nil), forCellReuseIdentifier: CurrentTempCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { // current weather
            return 1
        } else if section == 1 { // hour forecast
            return 1
        } else if section == 2 { // day forecast
            return 1
        } else {
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 { // current weather
            let cell = tableView.dequeueReusableCell(withIdentifier: CurrentTempCell.identifier, for: indexPath) as! CurrentTempCell
            cell.configure(data: self.currentTemp)
            return cell
        } else if indexPath.section == 1 { // hour forecast
            let cell = tableView.dequeueReusableCell(withIdentifier: CurrentTempCell.identifier, for: indexPath) as! CurrentTempCell
            cell.configure(data: self.currentTemp)
            return cell
        } else if indexPath.section == 2 { // day forecast
            return UITableViewCell()
        } else {
            return UITableViewCell()
        }
    }
    
}

