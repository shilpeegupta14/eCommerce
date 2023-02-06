//
//  HomeViewModel.swift
//  e-Commerce
//
//  Created by Shilpee Gupta on 04/02/23.
//

import Foundation
import UIKit

class HomeViewModel {
    
//    func setNavigationBar(_ searchBar: UISearchController?, _ view: UIView) {
//        let screenSize: CGRect = UIScreen.main.bounds
//        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 120))
//        let navItem = UINavigationItem()
//        navBar.backgroundColor = .systemMint
//        navItem.searchController = searchBar
//        
//        navBar.setItems([navItem], animated: false)
//        view.addSubview(navBar)
//    }
    
    func setLabel(view: UIView) -> UIView {
        let label = UILabel(frame: CGRect(x: 18, y: 34, width: 390, height: 120))
        label.text = "Welcome!🎉"
        label.font = UIFont.boldSystemFont(ofSize: 36.0)
        label.textAlignment = .left
        view.addSubview(label)
        return view
    }
    
    func addConstraint(bg: UIImageView, contentView: UIView){
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    func addConstraintToCollectionView(_ collectionView: UICollectionView, _ view: UIView) {
        //constraint from top
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 140).isActive = true
        
        //constraint from bottom
        //here constant will be negative
        //collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        
        //constraint from left as we call it leading
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        //constraint from right as we call it trailing
        //here constant will be negative
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 0.3).isActive = true
            
        
    }
    
    
    
}
