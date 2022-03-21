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
    }
    
}
