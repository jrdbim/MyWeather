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
    
    var day: DayModel?
    
}

struct DayModel: Codable {
    
    private var maxtemp_c: Double?
    private var maxtemp_f: Double?
    private var mintemp_c: Double?
    private var mintemp_f: Double?
    
    var string_maxtemp_c: String {
        return "\(String(format: "%.0f", maxtemp_c ?? 0))°"
    }
    var string_maxtemp_f: String {
        return "\(String(format: "%.0f", maxtemp_f ?? 0))°"
    }
    var string_mintemp_c: String {
        return "\(String(format: "%.0f", mintemp_c ?? 0))°"
    }
    var string_mintemp_f: String {
        return "\(String(format: "%.0f", mintemp_f ?? 0))°"
    }
    
}
