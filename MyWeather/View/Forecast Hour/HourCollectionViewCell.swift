//
//  HourCollectionViewCell.swift
//  MyWeather
//
//  Created by Jiradet Amornpimonkul on 3/23/22.
//

import UIKit

class HourCollectionViewCell: UICollectionViewCell {
    
    static var identifier = "HourCollectionViewCell"
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        timeLabel.text = ""
        tempLabel.text = ""
        
        timeLabel.font = UIFont(name: "Helvetica Neue", size: 18)
        tempLabel.font = UIFont(name: "Helvetica Neue", size: 20)
    }
    
    func configure(forecastHour: HourModel?) {
        guard let forecastHour = forecastHour, let condition = forecastHour.condition else { return }
        timeLabel.text = forecastHour.hour
        tempLabel.text = forecastHour.string_temp_c
        conditionImageView.downloaded(from: "https:\(condition.icon)")
    }

}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
