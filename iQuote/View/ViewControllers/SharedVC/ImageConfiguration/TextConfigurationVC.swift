//
//  TextConfigurationVC.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 09/12/2021.
//

import Foundation
import UIKit

class TextConfigurationVC : UIViewController {
    
    let fontArray = Constants.fontArray

    let container = UIView()
    let fontSizeSlider = UISlider()
    let fontPiker = UIPickerView()
    
    private let swipeLine = SwipeLine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureContainer()
        configureSwipeLinie()
        configureFontSizeSlider()
        configureFontPiker()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.0)
        swpieDownGestureRecognizer()
    }
    //    MARK: - OBJC
    
    @objc func handleFontSizeSlider(sender: UISlider){
        let roundedStepValue = CGFloat(Int(sender.value))
        NotificationCenter.default.post(name: .sizeFontObserver, object: nil, userInfo: ["size" : roundedStepValue])
    }
    
    //    MARK: - GestureRecognizer
    
    @objc func handleSwipeDown() {
        dismiss(animated: true, completion: nil)
    }
    
    private func swpieDownGestureRecognizer() {
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeDown))
        swipeDown.direction = .down
        container.addGestureRecognizer(swipeDown)
    }
    
    //    MARK: - Constraints
    private func configureContainer() {
        view.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .black
        container.layer.cornerRadius = 25
        
        NSLayoutConstraint.activate([
            container.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            container.leftAnchor.constraint(equalTo: view.leftAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            container.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
        ])
    }
    private func configureSwipeLinie() {
        container.addSubview(swipeLine)
        swipeLine.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            swipeLine.topAnchor.constraint(equalTo: container.topAnchor, constant: 15),
            swipeLine.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            swipeLine.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.2)
        ])
    }
    
    private func configureFontSizeSlider() {
        container.addSubview(fontSizeSlider)
        fontSizeSlider.translatesAutoresizingMaskIntoConstraints = false
        fontSizeSlider.addTarget(self, action: #selector(handleFontSizeSlider(sender:)), for: .touchUpInside)
        
        fontSizeSlider.tintColor = .white

        fontSizeSlider.minimumValue = 12
        fontSizeSlider.maximumValue = 48
        fontSizeSlider.value = 30
        fontSizeSlider.thumbTintColor = .primaryOrange()
        
        NSLayoutConstraint.activate([
            fontSizeSlider.topAnchor.constraint(equalTo: container.topAnchor,constant: 50),
            fontSizeSlider.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            fontSizeSlider.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.7),
            fontSizeSlider.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureFontPiker() {
        view.addSubview(fontPiker)
        fontPiker.translatesAutoresizingMaskIntoConstraints = false
        fontPiker.delegate = self
        fontPiker.dataSource = self
        
        fontPiker.overrideUserInterfaceStyle = .dark
        
        NSLayoutConstraint.activate([
            fontPiker.topAnchor.constraint(equalTo: fontSizeSlider.bottomAnchor),
            fontPiker.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            fontPiker.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.8),
            fontPiker.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}
// MARK: - UIPickerViewDelegate, UIPickerViewDataSource

extension TextConfigurationVC : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fontArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fontArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let fontName = fontArray[row]
        NotificationCenter.default.post(name: .fontQuote, object: nil, userInfo: ["font" : fontName])
    }
}



