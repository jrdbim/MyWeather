//
//  ForecastHourCell.swift
//  MyWeather
//
//  Created by Jiradet Amornpimonkul on 3/23/22.
//

import UIKit

class ForecastHourCell: UITableViewCell {
    
    static var identifier = "ForecastHourCell"
    
    @IBOutlet weak var forecastHourCollectionView: UICollectionView!
    
    var forecastHour: [HourModel]?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        forecastHourCollectionView.delegate = self
        forecastHourCollectionView.dataSource = self
        forecastHourCollectionView.layer.cornerRadius = 10
        forecastHourCollectionView.backgroundColor = UIColor.systemGray4
        forecastHourCollectionView.register(UINib(nibName: HourCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: HourCollectionViewCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(forecastHour: [HourModel]?) {
        guard let forecastHour = forecastHour else { return }
        self.forecastHour = forecastHour
        self.forecastHourCollectionView.reloadData()
    }
    
}

extension ForecastHourCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forecastHour?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = forecastHourCollectionView.dequeueReusableCell(withReuseIdentifier: HourCollectionViewCell.identifier, for: indexPath) as! HourCollectionViewCell
        cell.configure(forecastHour: forecastHour?[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 120.0)
    }
    
}
