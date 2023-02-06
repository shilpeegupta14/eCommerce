//
//  NetworkService.swift
//  e-Commerce
//
//  Created by Shilpee Gupta on 04/02/23.
//

import Foundation
import UIKit

final class NetworkService {
    
    static let shared = NetworkService()
    
    private init() { }
    var products = [Product]()
    var customData = [CustomData]()
    
    func mockData(completion: @escaping( [Product] ) -> Void) {
        let shirts = Product(name: "Shirts", category: Category.Mens, availability: true, rating: Rating.four, Price: Price.thousandTo9999)
        let tops = Product(name: "Tops", category: Category.Womens, availability: true, rating: Rating.three, Price: Price.hundredTo999)
        let sneakers = Product(name: "sneakers", category: Category.Womens, availability: false, rating: Rating.five, Price: Price.thousandTo9999)
        let laptops = Product(name: "Macbook", category: Category.Electronics, availability: true, rating: Rating.five, Price: Price.TenThousandTo99999)
        let toys = Product(name: "toys", category: Category.Kids, availability: true, rating: Rating.three, Price: Price.thousandTo9999)
        let jeans = Product(name: "jeans", category: Category.Mens, availability: true, rating: Rating.four, Price: Price.thousandTo9999)
        let Suits = Product(name: "Suits", category: Category.Mens, availability: true, rating: Rating.four, Price: Price.thousandTo9999)
        let dress = Product(name: "dress", category: Category.Womens, availability: true, rating: Rating.three, Price: Price.hundredTo999)
        let boots = Product(name: "boots", category: Category.Womens, availability: true, rating: Rating.three, Price: Price.hundredTo999)
        let perfume = Product(name: "perfume", category: Category.Womens, availability: true, rating: Rating.three, Price: Price.hundredTo999)
        
        
        products.append(contentsOf: [shirts, tops, sneakers, laptops, toys, jeans, Suits, dress, boots, perfume])
        //return products
    }
    
    func customMockData(completion: @escaping( [CustomData] ) -> Void) {
        let data: [CustomData] = [
            CustomData(title: "image", image: UIImage(imageLiteralResourceName: "men")),
            CustomData(title: "image", image: UIImage(imageLiteralResourceName: "Women")),
            CustomData(title: "image", image: UIImage(imageLiteralResourceName: "kids")),
            CustomData(title: "image", image: UIImage(imageLiteralResourceName: "men")),
            CustomData(title: "image", image: UIImage(imageLiteralResourceName: "Women")),
            CustomData(title: "image", image: UIImage(imageLiteralResourceName: "kids")),
        ]
        customData.append(contentsOf: data)
    }
}
