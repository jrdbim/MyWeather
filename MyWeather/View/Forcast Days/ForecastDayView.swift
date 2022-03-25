//
//  ForecastDayView.swift
//  MyWeather
//
//  Created by Jiradet Amornpimonkul on 3/24/22.
//

import UIKit

class ForecastDayView: UIView {

    let nibName = "ForecastDayView"
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var separateDay: UIView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var lowTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var gaugeView: GaugeView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        
        separateDay.backgroundColor = .systemGray6
    }
    
    func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil)[0] as? UIView
    }
    
    func configure(forecastdayModel: ForecastdayModel?, isFirst: Bool = false, isLast: Bool = false, maxGaugeTemp: Double, lowGuageTemp: Double) {
        guard let forecastdayModel = forecastdayModel, let day = forecastdayModel.day, let dayCondition = day.condition else { return }
        separateDay.isHidden = isLast
        maxTempLabel.text = day.string_maxtemp_c
        lowTempLabel.text = day.string_mintemp_c
        conditionImageView.downloaded(from: "https:\(dayCondition.icon)")
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "E"
        
        if let date = dateFormatterGet.date(from: forecastdayModel.date) {
            dayLabel.text = isFirst ? "Today" : dateFormatterPrint.string(from: date)
        }
        
        gaugeView.setGauge(gaugeWidth: gaugeView.frame.size.width,
                           maxGaugeTemp: maxGaugeTemp,
                           lowGaugeTemp: lowGuageTemp,
                           lowTargetTemp: day.mintemp_c,
                           maxTargetTemp: day.maxtemp_c)
        
        
    }

}
