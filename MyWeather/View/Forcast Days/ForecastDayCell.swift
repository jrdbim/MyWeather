//
//  ForecastDayCell.swift
//  MyWeather
//
//  Created by Jiradet Amornpimonkul on 3/24/22.
//

import UIKit

class ForecastDayCell: UITableViewCell {
    
    static let identifier = "ForecastDayCell"
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var stackView: UIStackView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        bgView.layer.cornerRadius = 10
        bgView.backgroundColor = UIColor.systemGray4
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configure(forecastModel: [ForecastdayModel]?) {
        stackView.arrangedSubviews.forEach( { $0.removeFromSuperview() })
        guard let forecastModel = forecastModel else { return }
        
        if var maxtemp = forecastModel.first?.day?.maxtemp_c, var lowtemp = forecastModel.first?.day?.mintemp_c {
            forecastModel.forEach { forecast in
                if let day = forecast.day {
                    maxtemp = day.maxtemp_c > maxtemp ? day.maxtemp_c : maxtemp
                    lowtemp = day.mintemp_c < lowtemp ? day.mintemp_c : lowtemp
                }
            }
            
            forecastModel.enumerated().forEach({ index, forecast in
                let dayView = ForecastDayView()
                dayView.configure(forecastdayModel: forecast,
                                  isFirst: index == 0 ? true : false,
                                  isLast: index == forecastModel.count - 1 ? true : false,
                                  maxGaugeTemp: maxtemp,
                                  lowGuageTemp: lowtemp)
                stackView.addArrangedSubview(dayView)
            })
            
            forecastModel.enumerated().forEach({ index, forecast in
                let dayView = ForecastDayView()
                dayView.configure(forecastdayModel: forecast,
                                  isFirst: index == 0 ? true : false,
                                  isLast: index == forecastModel.count - 1 ? true : false,
                                  maxGaugeTemp: maxtemp,
                                  lowGuageTemp: lowtemp)
                stackView.addArrangedSubview(dayView)
            })
            
            forecastModel.enumerated().forEach({ index, forecast in
                let dayView = ForecastDayView()
                dayView.configure(forecastdayModel: forecast,
                                  isFirst: index == 0 ? true : false,
                                  isLast: index == forecastModel.count - 1 ? true : false,
                                  maxGaugeTemp: maxtemp,
                                  lowGuageTemp: lowtemp)
                stackView.addArrangedSubview(dayView)
            })
        }
    }
    
}
