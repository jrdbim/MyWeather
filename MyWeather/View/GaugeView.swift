//
//  GaugeView.swift
//  MyWeather
//
//  Created by Jiradet Amornpimonkul on 3/24/22.
//

import UIKit

class GaugeView: UIView {
    
    let nibName = "GaugeView"
    
    @IBOutlet weak var gaugeTempView: UIView!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil)[0] as? UIView
    }
    
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func setGauge(gaugeWidth: Double = 0, maxGaugeTemp: Double = 0, lowGaugeTemp: Double = 0, lowTargetTemp: Double = 0, maxTargetTemp: Double = 0) {
        gaugeTempView.backgroundColor = .systemGray6
        gaugeTempView.layer.cornerRadius = 3
        let start = (gaugeWidth / (maxGaugeTemp - lowGaugeTemp)) * (lowTargetTemp - lowGaugeTemp)
        let max = (gaugeWidth / (maxGaugeTemp - lowGaugeTemp)) * (maxTargetTemp - maxGaugeTemp)
        let targetWidth = gaugeWidth + max - start
        
        let targetView = UIView(frame: CGRect(x: start, y: 0, width: targetWidth, height: 6))
        targetView.backgroundColor = .lightGray
        targetView.layer.cornerRadius = 3
        gaugeTempView.addSubview(targetView)
    }

}
