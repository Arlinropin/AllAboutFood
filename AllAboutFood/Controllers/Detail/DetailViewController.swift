//
//  DetailViewController.swift
//  AllAboutFood
//
//  Created by Apiux on 23-09-23.
//

import UIKit

class DetailViewController: UIViewController {
    
    let cellReuseIdentifier = "ImageCollectionViewCell"
    let numberOfItemsInRow = 3
    let numberOfImages = 3
    let loader = Loader()
    let placeholderImage = UIImage(named: "icon")
    var imageURLs: [URL] = []
    var food: Food?
    var network: Network?
    var foodNutrients: [FoodNutrient] = []
    
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var heightCollection: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ImageCollectionViewCell.nib, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        heightCollection.constant = UIScreen.main.bounds.width / 3 
        foodNameLabel.text = food?.description
        
        foodNutrients = food?.foodNutrients?.compactMap({$0.amount}) as? [FoodNutrient] ?? []
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NutrientsTableViewCell.nib, forCellReuseIdentifier: NutrientsTableViewCell.identifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getImages()
    }
    
    private func getImages() {
        loader.play(on: self)
        guard let network = network else { return }
        let networkManager = NetworkGoogleManager(network: network)
        networkManager.getImageURL(this: numberOfImages, from: food?.description) { [self] urls in
            imageURLs = urls
            loader.stop()
            DispatchQueue.main.async { [self] in
                collectionView.reloadData()
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func getHeader(with title: String)  -> UIView {
        let headerView = HeaderDetailTable()
        headerView.title = title
        return headerView
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // Crea una vista para la sección
        getHeader(with: "Nutrients")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        food?.foodNutrients?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        food?.foodNutrients?[indexPath.row].cell(tableView, cellForRowAt: indexPath) ?? UITableViewCell()
    }
}

// MARK: - UICollectionViewDataSource
extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return numberOfImages
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! ImageCollectionViewCell
        cell.heightImage.constant = UIScreen.main.bounds.width / CGFloat(numberOfItemsInRow)
        if imageURLs.count > indexPath.row {
            cell.imageView.loadImage(url: imageURLs[indexPath.row], placeholder: placeholderImage)
        } else {
            cell.imageView.image = placeholderImage
        }
        return cell
    }
}
