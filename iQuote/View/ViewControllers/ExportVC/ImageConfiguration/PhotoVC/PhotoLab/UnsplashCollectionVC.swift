//
//  UnsplashCollectionVC.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 05/12/2021.
//

import Foundation
import UIKit

protocol UnsplashIsEmptyDelegate {
    func arrayIsEmpty()
}

class UnsplashCollectionVC : UIViewController {
    
    var delegate : UnsplashIsEmptyDelegate?
    
    var unsplashCollection : UICollectionView!
    let collectionReuseIdentifier = "collectionReuseIdentifier"
    
    let dissmisButton = UIButton()
    
    var collectionImageArray : [Results] = []
    var category = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        configureCollectionView()
        configureDissmisButton()
        getJSON()
    }
    
    //    MARK: - JSON
    
    private func getJSON() {
        showLoadingView()
        NetworkManager.shered.getUnsplashImages(category: category) { result in
            self.dissmisLoadingView()
            switch result {
            case .success( let dataImage):
                if dataImage.isEmpty {
                    self.delegate?.arrayIsEmpty()
                }
                DispatchQueue.main.async {
                    self.collectionImageArray.append(contentsOf: dataImage)
                    self.unsplashCollection.reloadData()
                }
            case .failure( let error):
                self.presentAlertOnMainThred(title: "Upsss...", message: error.rawValue)
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
        
    }
    //    MARK: - OBJC Func
    
    @objc func handleDissmisButtton() {
        dismiss(animated: true, completion: nil)
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
    
    private func configureDissmisButton() {
        view.addSubview(dissmisButton)
        dissmisButton.translatesAutoresizingMaskIntoConstraints = false
        
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        dissmisButton.tintColor = .primaryOrange()
        dissmisButton.setImage(UIImage(systemName: "x.circle.fill")?.withConfiguration(configuration), for: .normal)
        dissmisButton.addTarget(self, action: #selector(handleDissmisButtton), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            dissmisButton.bottomAnchor.constraint(equalTo: unsplashCollection.topAnchor,constant: -20),
            dissmisButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            dissmisButton.heightAnchor.constraint(equalToConstant: 50),
            dissmisButton.widthAnchor.constraint(equalToConstant: 50)
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
        
        NotificationCenter.default.post(name: .imgObserver, object: nil, userInfo: ["imgURL" : imgURL])
        NotificationCenter.default.post(name: .chooseImgObserver, object: nil)
    }
}
