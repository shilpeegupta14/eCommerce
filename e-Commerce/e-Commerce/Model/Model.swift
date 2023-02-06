//
//  Model.swift
//  e-Commerce
//
//  Created by Shilpee Gupta on 01/02/23.
//

import Foundation
import UIKit

enum Category: String{
    case Mens
    case Womens
    case Kids
    case Electronics
}
struct CustomData {
    var title: String
    var image: UIImage
}


enum Price {
    case hundredTo999
    case thousandTo9999
    case TenThousandTo99999
}

enum item: String {
    case shirts = "shirts"
    case trousers = "trousers"
    case skirts = "skirts"
    case sneakers = "sneakers"
}

enum Rating: String {
    case one = "⭐️"
    case two = "⭐️⭐️"
    case three = "⭐️⭐️⭐️"
    case four = "⭐️⭐️⭐️⭐️"
    case five = "⭐️⭐️⭐️⭐️⭐️"
}



class Product {
    var name: String
    var category: Category
    var availability: Bool
    var rating: Rating
    var Price: Price
    
    init(name: String, category: Category, availability: Bool, rating: Rating, Price: Price) {
        self.category = category
        self.availability = availability
        self.rating = rating
        self.Price = Price
        self.name = name
    }
}

enum items {
    case all
    case category
    case price
    case availability
    case deliveryDate
}

