//
//  FavoritesListViewController.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 01/12/2021.
//

import Foundation
import UIKit

class FavoritesListViewController : UIViewController {
    
    private let tableViewContainer = UIView()
    private let tableView = UITableView()
    private let swipeLine = SwipeLine()
    
    var favoritesItems : [Quote] = []
    
    let padding : CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
        swipeUpGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavorities()
        tableViewContainer.layer.cornerRadius = 15
    }
    
    //    MARK: - SetupView & TableView
    
    private func setupView() {
        view.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.7)
        configureContainer()
        configureSwipeLinie()
        configureTabeleView()
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
                self.favoritesItems = favorite
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.view.bringSubviewToFront(self.tableView)
                }
            case .failure(let error):
                self.presentAlertOnMainThred(title: "Error", message: error.rawValue)
            }
        }
    }
    //    MARK: SwipeGesture
    @objc func handleSwipeUpGesture() {
        dismiss(animated: true, completion: nil)
    }
    
    private func swipeUpGesture() {
        let swipeUP = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeUpGesture))
        swipeUP.direction = .up
        view.addGestureRecognizer(swipeUP)
    }
    
    
    
    //     MARK: - Constraints
    
    private func configureContainer() {
        view.addSubview(tableViewContainer)
        tableViewContainer.translatesAutoresizingMaskIntoConstraints = false
        tableViewContainer.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            tableViewContainer.topAnchor.constraint(equalTo: view.topAnchor),
            tableViewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tableViewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            tableViewContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7)
        ])
        
    }
    private func configureSwipeLinie() {
        tableViewContainer.addSubview(swipeLine)
        swipeLine.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            swipeLine.bottomAnchor.constraint(equalTo: tableViewContainer.bottomAnchor, constant: -15),
            swipeLine.centerXAnchor.constraint(equalTo: tableViewContainer.centerXAnchor),
            swipeLine.widthAnchor.constraint(equalTo: tableViewContainer.widthAnchor, multiplier: 0.4)
        ])
    }
    
    private func configureTabeleView() {
        tableViewContainer.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: tableViewContainer.safeAreaLayoutGuide.topAnchor,constant: 20),
            tableView.leadingAnchor.constraint(equalTo: tableViewContainer.leadingAnchor,constant: 10),
            tableView.trailingAnchor.constraint(equalTo: tableViewContainer.trailingAnchor,constant: -10),
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
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deletedItem = UIContextualAction(style: .destructive, title: "Del") {  (contextualAction, view, boolValue) in
            let favorite = self.favoritesItems[indexPath.row]
            self.favoritesItems.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            PersistenceManager.uppdateWith(favorite: favorite, actionType: .remove) {  error in
                guard let error = error  else {return}
                self.presentAlertOnMainThred(title: "Unable to remove", message: error.rawValue)
            }
        }
        deletedItem.backgroundColor = .white
        deletedItem.image = UIImage(named: Icons.cellDeleted)
        
        
        let shareItem = UIContextualAction(style: .normal, title: "Share") { contextualAction, view, boolValue in
            let desVC = ExportViewController()
            desVC.modalPresentationStyle = .overFullScreen
            desVC.modalTransitionStyle = .coverVertical
            
            quoteTextToShare = self.favoritesItems[indexPath.row].q
            
            NotificationCenter.default.post(name:.quoteToShare , object: nil, userInfo: ["text": quoteTextToShare!])
            
            self.present(desVC, animated: true, completion: nil)
        }
        
        shareItem.backgroundColor = .white
        shareItem.image = UIImage(named: Icons.cellExport)
        
        let swipeActions = UISwipeActionsConfiguration(actions: [deletedItem, shareItem])
        
        return swipeActions
    }
}
