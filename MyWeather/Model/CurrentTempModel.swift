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
