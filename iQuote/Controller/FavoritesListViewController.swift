//
//  FavoritesListViewController.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 01/12/2021.
//

import Foundation
import UIKit

class FavoritesListViewController : UIViewController {
    
    
    private let container = UIView()
    private let tableView = UITableView()
    private let swipeLine = SwipeLine()
    
    var favoritesItems : [Quote] = []
    
    let padding : CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureContainer()
        setupTableView()
        configureSwipeLinie()
        configureTabeleView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavorities()
        container.layer.cornerRadius = 15
    }
    //    MARK: - SetupView & TableView
    
    private func setupView() {
        view.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.7)
    }
    
    private func setupTableView() {
        tableView.reloadData()
        tableView.register(FavoritesTableViewCell.self, forCellReuseIdentifier: FavoritesTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 75
    }
    
    func getFavorities() {
        PersistenceManager.retrieveFavorites { result in
            switch result {
            case .success(let favorite):
                
                if favorite.isEmpty {
//                    let massage = "No favorites?\nAdd one on the quote screean"
//                    handle Emoty table view
                } else {
                    self.favoritesItems = favorite
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.view.bringSubviewToFront(self.tableView)
                    }
                }
            case .failure(let error):
                self.presentAlertOnMainThred(title: "Error", message: error.rawValue)
            }
        }
    }
    
    //     MARK: - Constraints
    private func configureContainer() {
        view.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: view.topAnchor),
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            container.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7)
        ])
        
    }
    private func configureSwipeLinie() {
        container.addSubview(swipeLine)
        swipeLine.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            swipeLine.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -15),
            swipeLine.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            swipeLine.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.4)
        ])
    }
    
    private func configureTabeleView() {
        container.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: container.safeAreaLayoutGuide.topAnchor,constant: 20),
            tableView.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: 10),
            tableView.trailingAnchor.constraint(equalTo: container.trailingAnchor,constant: -10),
            tableView.bottomAnchor.constraint(equalTo: swipeLine.topAnchor, constant: -40)
        ])
    }
}
// MARK: - UITableViewDelegate, UITableViewDataSource

extension FavoritesListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritesItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesTableViewCell.identifier) as! FavoritesTableViewCell
        let quoteData = favoritesItems[indexPath.row]
        cell.setData(quoteData: quoteData)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
