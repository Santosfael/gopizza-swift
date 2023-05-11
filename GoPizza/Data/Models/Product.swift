//
//  Product.swift
//  GoPizza
//
//  Created by Rafael Rocha on 17/04/23.
//

import Foundation

struct Product: Codable {
    var id: String
    var photo_url: String
    var name: String
    var description: String
    var price: Price

    init(id: String, photo_url: String, name: String, description: String, price: Price) {
        self.id = id
        self.photo_url = photo_url
        self.name = name
        self.description = description
        self.price = price
    }
}

struct Price: Codable {
    var small: Double
    var medium: Double
    var big: Double
}
