//
//  FirstScreen.swift
//  e-Commerce
//
//  Created by Shilpee Gupta on 30/01/23.
//

import UIKit

class HomeViewController: UIViewController, UISearchResultsUpdating {
    
    let viewModel = HomeViewModel()
    
    let data = [
        CustomData(title: "image", image: UIImage(imageLiteralResourceName: "men")),
        CustomData(title: "image", image: UIImage(imageLiteralResourceName: "Women")),
        CustomData(title: "image", image: UIImage(imageLiteralResourceName: "kids")),
        CustomData(title: "image", image: UIImage(imageLiteralResourceName: "men")),
        CustomData(title: "image", image: UIImage(imageLiteralResourceName: "Women")),
        CustomData(title: "image", image: UIImage(imageLiteralResourceName: "kids")),
    ]
    
//    var data : [CustomData] = [CustomData]()
//    func getMockData(){
//        NetworkService.shared.customMockData { datas in
//            self.data = datas
//        }
//    }
    
    let searchController = UISearchController(searchResultsController: SearchScreenViewController())
    
    fileprivate let collectionView: UICollectionView = {
        //creating a collection layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //marking constraints as false cuz we want to add constraints on our own
        cv.translatesAutoresizingMaskIntoConstraints = false
        //adding cells onto the collection view and naming it
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "Cell")
        return cv
    }()
    
    func setNavigationBar() {
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 120))
        let navItem = UINavigationItem()
        navBar.backgroundColor = .systemMint
        navItem.searchController = searchController
        
        navBar.setItems([navItem], animated: false)
        view.addSubview(navBar)
    }
    func setTopLabel() {
//        searchController.searchBar.addSubvie
        let label = UILabel(frame: CGRect(x: 18, y: 34, width: 390, height: 120))
        label.text = "Welcome!🎉"
        label.font = UIFont.boldSystemFont(ofSize: 36.0)
        label.textAlignment = .left
//        searchController.
        view.addSubview(label)
    }
    
    func setSearchBar() {
        title = "Search"
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Products"

        //searchController.searchBar.addSubview(viewModel.setLabel(view: view))
        
        //navigationItem.searchController = searchController
        //definesPresentationContext = true
        searchController.searchBar.sizeToFit()
        
        //label added onto back of the navigation bar
        //searchController.searchBar.addSubview(viewModel.setLabel(view: view))
        
        //setNavigationBar(searchController)
        //searchController.searchBar.addSubview(viewModel.setLabel(view: view))
        
        //automaticallyAdjustsScrollViewInsets = false
        
    }
    
    func setCollectionView(){
        view.addSubview(collectionView)
        viewModel.addConstraintToCollectionView(collectionView, view)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setNavigationBar()
        setTopLabel()
        setSearchBar()
        setCollectionView()
        
    }

}

//UICollectionViewDataSource will enable us to tell the app about the amount of cells and kind of data those cells have
extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/4, height: collectionView.frame.width/4)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCell
//        cell.backgroundColor = .red
        cell.data = self.data[indexPath.row]
        return cell
    }
}

extension HomeViewController: UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else{
            return
        }
        searchController.searchResultsController as? SearchScreenViewController
        print(text)
    }
}

class CustomCell: UICollectionViewCell {
    
    let viewModel = HomeViewModel()
    
    var data: CustomData? {
        didSet{
            guard let data = data else {return}
            bg.image = data.image
            bg.layer.cornerRadius = self.frame.size.width/2  //make cells circular
        }
    }
    
    fileprivate let bg: UIImageView = {
        let iv = UIImageView()
//        iv.image = UIImage(imageLiteralResourceName: "alex")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleToFill
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(bg)
        viewModel.addConstraint(bg: bg, contentView: contentView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
