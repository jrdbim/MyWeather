//
//  ViewController.swift
//  MyWeather
//
//  Created by Jiradet Amornpimonkul on 3/20/22.
//

import UIKit
import Combine
import CoreLocation

class WeatherViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var observer: AnyCancellable?
    let service = CurrentTempViewModel()
    let locationManager = CLLocationManager()
    var currentTemp: CurrentTempModel?
    var lat: String = ""
    var lon: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.systemGray6
        requestLocation()
        setTableView()
    }
    
    private func requestLocation() {
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()

        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    internal func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        self.lat = "\(locValue.latitude)"
        self.lon = "\(locValue.longitude)"
        locationManager.stopUpdatingLocation()
        requestCurrentTemp()
    }
    
    private func requestCurrentTemp() {
        observer = service.requestCurrentTemp(lat: self.lat, lon: self.lon)
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
        
        tableView.backgroundColor = .clear
        tableView.register(UINib(nibName: CurrentTempCell.identifier, bundle: nil), forCellReuseIdentifier: CurrentTempCell.identifier)
        tableView.register(UINib(nibName: ForecastHourCell.identifier, bundle: nil), forCellReuseIdentifier: ForecastHourCell.identifier)
        tableView.register(UINib(nibName: ForecastDayCell.identifier, bundle: nil), forCellReuseIdentifier: ForecastDayCell.identifier)
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
            let cell = tableView.dequeueReusableCell(withIdentifier: ForecastHourCell.identifier, for: indexPath) as! ForecastHourCell
            cell.configure(forecastHour: self.currentTemp?.forecast?.forecastday?.first?.hour)
            return cell
        } else if indexPath.section == 2 { // day forecast
            let cell = tableView.dequeueReusableCell(withIdentifier: ForecastDayCell.identifier, for: indexPath) as! ForecastDayCell
            guard let currentTemp = self.currentTemp, let forcast = currentTemp.forecast else { return UITableViewCell() }
            cell.configure(forecastModel: forcast.forecastday)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
}

