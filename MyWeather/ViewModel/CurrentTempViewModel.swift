//
//  CurrentTempViewModel.swift
//  MyWeather
//
//  Created by Jiradet Amornpimonkul on 3/20/22.
//

import Foundation
import Combine

class CurrentTempViewModel {
    
    func requestCurrentTemp() -> AnyPublisher<CurrentTempModel, Never> {
        guard let url = URL(string: "http://api.weatherapi.com/v1/current.json?key=bea34cbe5cf84dc2b6910026222103&q=New_York&aqi=no") else {
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
