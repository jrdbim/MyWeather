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
        
        tableView.register(UINib(nibName: CurrentTempCell.identifier, bundle: nil), forCellReuseIdentifier: CurrentTempCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { // current weather
            return 1
        } else if section == 1 { // hour forecast
            return 0
        } else if section == 2 { // day forecast
            return 0
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

