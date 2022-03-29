//
//  CurrentTempCell.swift
//  MyWeather
//
//  Created by Jiradet Amornpimonkul on 3/20/22.
//

import UIKit

class CurrentTempCell: UITableViewCell {
    
    static let identifier = "CurrentTempCell"
    
    @IBOutlet weak var currentLocationLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var currentConditionLabel: UILabel!
    @IBOutlet weak var currentMinMaxLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        currentLocationLabel.text = ""
        currentTempLabel.text = ""
        currentConditionLabel.text = ""
        currentMinMaxLabel.text = ""
    }
    
    private func setupUI() {
        currentLocationLabel.text = ""
        currentTempLabel.text = ""
        currentConditionLabel.text = ""
        currentMinMaxLabel.text = ""
        currentLocationLabel.font = UIFont(name: "Helvetica Neue", size: 24)
        currentTempLabel.font = UIFont(name: "Helvetica Neue", size: 62)
        currentConditionLabel.font = UIFont(name: "Helvetica Neue", size: 18)
        currentMinMaxLabel.font = UIFont(name: "Helvetica Neue", size: 18)
    }
    
    func configure(data: CurrentTempModel?) {
        guard let data = data, let forecastday = data.forecast?.forecastday, let day = forecastday.first?.day else { return }
        
        currentLocationLabel.text = data.location?.name
        currentTempLabel.text = data.current?.string_temp_c
        currentConditionLabel.text = data.current?.condition?.text
        currentMinMaxLabel.text = " H:\(day.string_maxtemp_c) L:\(day.string_mintemp_c)"
    }
    
}
