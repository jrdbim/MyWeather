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
    @IBOutlet weak var currentFeellikeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        setupUI()
    }
    
    override func prepareForReuse() {
        currentLocationLabel.text = ""
        currentTempLabel.text = ""
    }
    
    private func setupUI() {
        currentLocationLabel.font = UIFont(name: "Helvetica Neue", size: 24)
        currentTempLabel.font = UIFont(name: "Helvetica Neue", size: 62)
        currentConditionLabel.font = UIFont(name: "Helvetica Neue", size: 18)
        currentFeellikeLabel.font = UIFont(name: "Helvetica Neue", size: 18)
    }
    
    func configure(data: CurrentTempModel?) {
        guard let data = data else { return }
        
        currentLocationLabel.text = data.location?.name
        currentTempLabel.text = data.current?.string_temp_c
        currentConditionLabel.text = data.current?.condition?.text
        currentFeellikeLabel.text = data.current?.string_feelslike_c
    }
    
}
