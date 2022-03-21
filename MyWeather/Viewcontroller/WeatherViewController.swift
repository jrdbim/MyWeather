//
//  ViewController.swift
//  MyWeather
//
//  Created by Jiradet Amornpimonkul on 3/20/22.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
    }
    
}

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: CurrentTempCell.identifier, bundle: nil), forCellReuseIdentifier: CurrentTempCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CurrentTempCell.identifier, for: indexPath) as! CurrentTempCell
        return cell
    }
    
}

