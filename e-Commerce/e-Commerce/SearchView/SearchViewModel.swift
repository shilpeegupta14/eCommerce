//
//  SearchViewModel.swift
//  e-Commerce
//
//  Created by Shilpee Gupta on 04/02/23.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    var prodName: UILabel = UILabel(frame: CGRect(x: 20, y: 20, width: 40, height: 60))
    var category: UILabel = UILabel(frame: CGRect(x: 40, y: 40, width: 20, height: 40))
    var availability: UITextView = UITextView(frame: CGRect(x: 50, y: 50, width: 20, height: 40))
    var rating: UILabel = UILabel(frame: CGRect(x: 60, y: 60, width: 20, height: 40))
    var price: UILabel = UILabel(frame: CGRect(x: 70, y: 70, width: 20, height: 40))
    
    func setup(prodName: String, category: String, availability: String, rating: String, price: String){
        self.prodName.text = prodName
        self.category.text = category
        self.availability.text = availability
        self.rating.text = rating
        self.price.text = price
    }
    
}
class TableViewDetail: UIViewController {
    
}

final class SearchViewModel {
    
    var products: [Product] = []
    
    var error: ObservableObject<String?> = ObservableObject(nil)
    
    func sendMockData() {
        NetworkService.shared.mockData { [weak self] product in
            self?.products = product
        }
    }
}
