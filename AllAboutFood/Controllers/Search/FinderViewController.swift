//
//  FinderViewController.swift
//  AllAboutFood
//
//  Created by Apiux on 24-09-23.
//

import UIKit

class FinderViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var infoButton: UIButton!
    
    let searchController = UISearchController(searchResultsController: nil)

    let network = Network()
    var items: [Food] = []
    let loader = Loader()
    var foodSelected: Food?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FoodTableViewCell.nib, forCellReuseIdentifier: FoodTableViewCell.identifier)
        setNavBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getList()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        foodSelected = nil
    }

    func setNavBar() {
        title = "Food List"
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Buscar"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    func getList() {
        loader.play(on: self)
        let manager = NetworkFoodApiManager(network: network)
        manager.getList(page: 1) { items in
            self.items = items
            DispatchQueue.main.async { [self] in
                loader.stop()
                tableView.reloadData()
            }
        }
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let destination = segue.destination as! DetailViewController
            destination.network = network
            destination.food = foodSelected
        }
    }
}

// MARK: - Table View Data Source
extension FinderViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FoodTableViewCell.identifier, for: indexPath) as? FoodTableViewCell else {
            return UITableViewCell()
        }
        cell.network = network
        let food = items[indexPath.row]
        cell.food = FoodLight(
            id: food.fdcId,
            name: food.description,
            dataType: DataType(food.dataType),
            brandName: food.brandOwner ?? ""
            )
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        foodSelected = items[indexPath.row]
        self.performSegue(withIdentifier: "showDetail", sender: self)
    }
}

extension FinderViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            let manager = NetworkFoodApiManager(network: network)
            manager.search(this: searchText, page: 1) { items in
                self.items = items
                DispatchQueue.main.async { [self] in
                    tableView.reloadData()
                }
            }
        }
    }
}
