//
//  CurrentTempViewModel.swift
//  MyWeather
//
//  Created by Jiradet Amornpimonkul on 3/20/22.
//

import Foundation
import Combine

class CurrentTempViewModel {
    
    func requestCurrentTemp(lat: String, lon: String) -> AnyPublisher<CurrentTempModel, Never> {
        guard let url = URL(string: "http://api.weatherapi.com/v1/forecast.json?key=bea34cbe5cf84dc2b6910026222103&q=\(lat),\(lon)&days=1&aqi=no&alerts=no") else {
            return Just(CurrentTempModel()).eraseToAnyPublisher()
        }
        
        let publisher = URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .decode(type: CurrentTempModel.self, decoder: JSONDecoder())
            .catch({ _ in
                Just(CurrentTempModel())
            })
            .eraseToAnyPublisher()
                    
        return publisher
    }
    
}
