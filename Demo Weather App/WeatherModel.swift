//
//  WeatherModel.swift
//  Demo Weather App
//
//  Created by Steve Plavetzky on 11/10/21.
//

import Foundation

struct WeatherModel: Identifiable{
    var id = UUID()
    var dayOfWeek: String
    var imageName: String
    var temp: Int
}

