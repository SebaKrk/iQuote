//
//  SideMenuViewController.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 17/12/2021.
//

import UIKit

class SideMenuViewController : UIViewController {
    
    private let titleLabel = CostumTitleLabel(textAligment: .left, fontSize: 40)
    private var model = configureSettings()
    
    private let tableView = UITableView()
    
    private let padding : CGFloat = 10
    override func viewDidLoad() {
        
        //        MARK: - ViewDidLoad
        
        super.viewDidLoad()
        setupView()
        setupTableView()
        configureTitleLabel()
        configureTableView()
    }
    
    //    MARK: - View&TableView
    
    func setupView() {
        view.backgroundColor = .darkGray
    }
    
    func setupTableView() {
        tableView.reloadData()
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 75
        tableView.backgroundColor = .darkGray
        tableView.alwaysBounceVertical = false
    }
    
    //    MARK: - Configure%Constraints
    
    func configureTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = "Settings"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: padding)
        ])
    }
}
// MARK: - UITableViewDelegate, UITableViewDataSource

extension SideMenuViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = model[section]
        return section.title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  model[section].option.count
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = .darkGray
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = .white
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 10)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = model[indexPath.section].option[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as? SettingsTableViewCell else {
            return UITableViewCell()
        }
        cell.set(with: model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let titile = model[indexPath.section].option[indexPath.row].title
        
        switch titile {
        case SettingsTitle.share:
            let message = SettingsMessage.share.rawValue
            let url = SettingsURL.share.rawValue
            
            let shereSheetVC = UIActivityViewController(activityItems: [message,url], applicationActivities: nil)
            shereSheetVC.excludedActivityTypes = [.addToReadingList,.assignToContact,.copyToPasteboard,.markupAsPDF,.saveToCameraRoll]
            present(shereSheetVC, animated: true, completion: nil)
          
        case SettingsTitle.review:
            print("\(SettingsTitle.review)")
            showSafariService(with: SettingsURL.review.rawValue)
            // handle appstore review website
            
        case SettingsTitle.website:
            print("\(SettingsTitle.website)")
            showSafariService(with: SettingsURL.website.rawValue)
            
        case SettingsTitle.sugest:
            print("\(SettingsTitle.sugest)")
            showMailMassageUI(subject: SettingsTitle.sugest,
                              message: SettingsMessage.sugest.rawValue,
                              url: SettingsURL.safai.rawValue)
            
        case SettingsTitle.bug:
            print("\(SettingsTitle.bug)")
            showMailMassageUI(subject: SettingsTitle.bug,
                              message: SettingsMessage.bug.rawValue,
                              url: SettingsURL.safai.rawValue)
            
        case SettingsTitle.privacyPolicy:
            print("\(SettingsTitle.privacyPolicy)")
            showSafariService(with: SettingsURL.privacyPolicy.rawValue)
            
        case SettingsTitle.appSettings:
            print("\(SettingsTitle.appSettings)")
            guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else {return}
            UIApplication.shared.open(settingsURL)
            
        case SettingsTitle.appVersion:
            print("\(SettingsTitle.appVersion)")
            let vc = AppVersionViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
            
        default:
            break
        }
    }
}
