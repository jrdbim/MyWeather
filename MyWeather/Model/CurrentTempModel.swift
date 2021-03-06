//
//  CurrentTempModel.swift
//  MyWeather
//
//  Created by Jiradet Amornpimonkul on 3/20/22.
//

import Foundation

struct CurrentTempModel: Codable {
    
    var location: LocationModel?
    var current: CurrentModel?
    var forecast: ForecastModel?
    
}

struct LocationModel: Codable {
    
    var name: String?
    
}

struct CurrentModel: Codable {
        
    private var temp_c: Double?
    private var temp_f: Double?
    private var feelslike_c: Double?
    private var feelslike_f: Double?
    var condition: CurrentConditionModel?
    
    var string_temp_c: String {
        return " \(String(format: "%.0f", temp_c ?? 0))°"
    }
    var string_temp_f: String {
        return " \(String(format: "%.0f", temp_f ?? 0))°"
    }
    var string_feelslike_c: String {
        return "Feels Like \(String(format: "%.0f", feelslike_c ?? 0))°"
    }
    var string_feelslike_f: String {
        return "Feels Like  \(String(format: "%.0f", feelslike_f ?? 0))°"
    }
    
}

struct CurrentConditionModel: Codable {
    
    var text: String?
    var icon: String?
    var code: Double?
    
}

struct ForecastModel: Codable {
    
    var forecastday: [ForecastdayModel]?
    
}

struct ForecastdayModel: Codable {
    
    var date: String = ""
    var day: DayModel?
    var hour: [HourModel]?
    
}

struct DayModel: Codable {
    
    var maxtemp_c: Double = 0
    private var maxtemp_f: Double?
    var mintemp_c: Double = 0
    private var mintemp_f: Double?
    var condition: HourCoditionModel?
    
    var string_maxtemp_c: String {
        return "\(String(format: "%.0f", maxtemp_c))°"
    }
    var string_maxtemp_f: String {
        return "\(String(format: "%.0f", maxtemp_f ?? 0))°"
    }
    var string_mintemp_c: String {
        return "\(String(format: "%.0f", mintemp_c))°"
    }
    var string_mintemp_f: String {
        return "\(String(format: "%.0f", mintemp_f ?? 0))°"
    }
    
}

struct HourModel: Codable {
    
    private var time: String?
    var condition: HourCoditionModel?
    private var temp_c: Double?
    
    var string_temp_c: String {
        return " \(String(format: "%.0f", temp_c ?? 0))°"
    }
    
    var hour: String {
        if let hourComponent = time?.components(separatedBy: " ") {
            return hourComponent[1].components(separatedBy: ":")[0]
        } else {
            return ""
        }
    }
    
}

struct HourCoditionModel: Codable {
    
    var icon: String = ""
    
}
