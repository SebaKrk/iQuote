//
//  UnsplashCollectionVC.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 05/12/2021.
//

import Foundation
import UIKit

class UnsplashCollectionVC : UIViewController {
    
    var unsplashCollection : UICollectionView!
    let collectionReuseIdentifier = "collectionReuseIdentifier"
    
    var collectionImageArray : [Results] = []
    let category = "landscapes"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        configureCollectionView()
        getJSON()
    }
//    MARK: - JSON
    
    private func getJSON() {
        NetworkManager.shered.getUnsplashImages(category: category) { result in
            
            switch result {
                
            case .success( let dataImage):
                DispatchQueue.main.async {
                    self.collectionImageArray.append(contentsOf: dataImage)
                    self.unsplashCollection.reloadData()
                }
            case .failure( let error):
                print("\(error.rawValue)")
            }
        }
    }
    
//    MARK: - collectionViewSetup
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        unsplashCollection = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        unsplashCollection.register(CollectionCell.self, forCellWithReuseIdentifier: collectionReuseIdentifier)
        unsplashCollection.delegate = self
        unsplashCollection.dataSource = self
        unsplashCollection.backgroundColor = .clear
    }
    
//    MARK: - Constraints
    
    private func configureCollectionView() {
        view.addSubview(unsplashCollection)
        unsplashCollection.translatesAutoresizingMaskIntoConstraints = false
        unsplashCollection.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            unsplashCollection.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            unsplashCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            unsplashCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            unsplashCollection.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
}
// MARK: -  UICollectionViewDelegateFlowLayout , UICollectionViewDataSource

extension UnsplashCollectionVC : UICollectionViewDelegateFlowLayout , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionImageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = unsplashCollection.dequeueReusableCell(withReuseIdentifier: collectionReuseIdentifier, for: indexPath) as! CollectionCell
        let data = collectionImageArray[indexPath.row]
        cell.set(data: data)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionImageArray[indexPath.row]
        let imgURL = cell.urls.small
        
        let name = Notification.Name("imgObserver")
        NotificationCenter.default.post(name: name, object: nil, userInfo: ["imgURL" : imgURL])
        dismiss(animated: true, completion: nil)
    }
}



























