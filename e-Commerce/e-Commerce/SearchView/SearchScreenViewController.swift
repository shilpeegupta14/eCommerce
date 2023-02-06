//
//  SearchScreen.swift
//  e-Commerce
//
//  Created by Shilpee Gupta on 01/02/23.
//

import Foundation
import UIKit


class SearchScreenViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {
    
    //    var products: [Int] = []
    //    var filteredItems: [Int] = []
    
    var products: [Product] = [Product]()
    var filteredProducts: [Product] = [Product]()
    let searchController = UISearchController()
    
    let viewModel = SearchViewModel()
    
    func initSearchController() {
        view.addSubview(tableView)
        tableView.delegate = self
        
        searchController.searchBar.delegate = self
        tableView.dataSource = self
        
        
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        
        let searchBar = searchController.searchBar
        searchBar.enablesReturnKeyAutomatically = false
        searchBar.placeholder = "Search by category, availability, rating and price."
        searchBar.returnKeyType = UIReturnKeyType.search
        searchBar.tintColor = UIColor.systemMint
        definesPresentationContext = true
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.scopeButtonTitles = ["All", "Mens", "Womens", "Kids", "Electronics"]
        
    }
    
    func listView(){
        NetworkService.shared.mockData { [weak self] product in
            self?.products = product
            self?.tableView.reloadData()
        }
    }
    
    //let tableView = UITableView()
    
    override func viewDidLoad(){
        self.viewDidLoad()
        //view.addSubview(tableView)
        initSearchController()
        listView()
        
        //initList()
        
//        tableView.tableHeaderView = searchController.searchBar
//        searchController.searchResultsUpdater = self
//        searchController.obscuresBackgroundDuringPresentation = false
//
//        searchController.searchBar.placeholder = "Search by category, availability, rating and price."
//        searchController.hidesNavigationBarDuringPresentation = false
//        searchController.searchBar.tintColor = UIColor.systemMint
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func setupBinders() {
        //viewModel.error.bind([weak self] <#T##(T) -> Void#>)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return filteredProducts.count
        }else{
            return products.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = products[indexPath.row]
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TableViewCell
        var currProd: Product!
        
        if(searchController.isActive){
            currProd = filteredProducts[indexPath.row]
//            filteredProducts[indexPath.]
        }else {
            currProd = products[indexPath.row]
        }
        
        cell.setup(prodName: "\(product.name)", category: "\(product.category.rawValue)", availability: "\(product.availability)", rating: "\(product.rating)", price: "\(product.Price)")
        
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scopeButton = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        let searchText = searchBar.text!
        
        filterSearchContent(searchText, scopeButton)
        //tableView.reloadData()

    }
    
    func filterSearchContent(_ searchText: String, _ scopeButton: String = "All" ) {
        filteredProducts=products.filter({ prod in
            let scopeMatch = (scopeButton == "All" || prod.category.rawValue.lowercased() == scopeButton)
            if(searchController.searchBar.text != ""){
                let searchTextMatch = prod.category.rawValue.lowercased().contains(searchText.lowercased())
                return scopeMatch && searchTextMatch
            }else {
                return scopeMatch
            }
        })
        tableView.reloadData()
    }
    
}
extension SearchScreenViewController {
    
}
