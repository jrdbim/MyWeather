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

    override func awakeFromNib() {
        super.awakeFromNib()
        
        forecastHourCollectionView.delegate = self
        forecastHourCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension ForecastHourCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
}
