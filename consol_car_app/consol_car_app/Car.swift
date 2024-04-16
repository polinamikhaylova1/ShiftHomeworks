//
//  Car.swift
//  consol_car_app
//
//  Created by Полина Михайлова on 16.04.2024.
//

import Foundation

struct Car {
    var manufacture: String
    var model: String
    var body: BodyType
    var yearOfIssue: Int
    var carNumber:String
    
    init(manufacture: String, model: String, body: BodyType, yearOfIssue:Int, carNumber:String) {
        self.manufacture = manufacture
        self.model = model
        self.body = body
        self.yearOfIssue = yearOfIssue
        self.carNumber = carNumber
    }
}
