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
    let colorArray = Constants.colorArray
    
    let container = UIView()
    var textAligmentStack = UIStackView()
    var bottomStackView = UIStackView()
    
    let textLeft = CostumTransButton(imageOne: "alignLeft1", imageTwo: "alignLeft1")
    let textCenter = CostumTransButton(imageOne: "alignCenter1", imageTwo: "alignCenter1")
    let textRight = CostumTransButton(imageOne: "alignRight1", imageTwo: "alignRight1")
    
    let fontSizeSlider = UISlider()
    let fontSizeLabel = CostumTitleLabel(textAligment: .center, fontSize: 14)
    let fontAndColorPiker = UIPickerView()
    
    let cancleButton = CostumeActionButton(name: "CANCEL")
    let doneButton = CostumeActionButton(name: "DONE")
    
    private let swipeLine = SwipeLine()
    private let bottomLine = BottomLine()
    
//    MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupStackView()
        setupBottomStackView()
        configureContainer()
        configureSwipeLinie()
        configureTextAligmentStack()
        configureFontAndColorPiker()
        configureFontSizeSlider()
        configureFontSizeLabel()
        configureBottomStackView()
        configureBottomLinie()
    }
    override func viewDidLayoutSubviews() {
        cardOriginYext = container.frame.origin.y
        panGestureRecognizerToHandleDragAndDissmisView(inCardView: container, cardOriginY: cardOriginYext)
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.0)
        configureButtons()
        tapGestureRecognizerToDissmisView()
        swipeDownGestureRecognizerToDissmisView(container: container)
    }
    //    MARK: - OBJC
    
    @objc func handleFontSizeSlider(sender: UISlider){
        let roundedStepValue = CGFloat(Int(sender.value))
        fontSizeLabel.text = "\(roundedStepValue)"
        NotificationCenter.default.post(name: .sizeFontObserver, object: nil, userInfo: ["size" : roundedStepValue])
    }
    @objc func handleTextLeft() {
        textLeft.flipLikeState()
        let left = NSTextAlignment(rawValue: 0)
        NotificationCenter.default.post(name: .textAlignmentObserver, object: nil, userInfo: ["quoteTextAligment" : left!])
    }
    @objc func handleTextCenter() {
        textCenter.flipLikeState()
        let center = NSTextAlignment(rawValue: 1)
        NotificationCenter.default.post(name: .textAlignmentObserver, object: nil, userInfo: ["quoteTextAligment" : center!])
    }
    @objc func handleTextRight() {
        textRight.flipLikeState()
        let right = NSTextAlignment(rawValue: 2)
        NotificationCenter.default.post(name: .textAlignmentObserver, object: nil, userInfo: ["quoteTextAligment" : right!])
    }
    @objc func handleCancleButton() {
        print("handleCancleButton")
    }
    @objc func handleDoneButton() {
        print("handleDoneButton")
    }
//    MARK: - StackViews
    
    private func setupStackView() {
        textAligmentStack = UIStackView(arrangedSubviews: [textLeft,textCenter,textRight])
        textAligmentStack.axis = .horizontal
        textAligmentStack.distribution = .fillEqually
    }
    
    private func setupBottomStackView() {
        bottomStackView = UIStackView(arrangedSubviews: [cancleButton,doneButton])
        bottomStackView.axis = .horizontal
        bottomStackView.distribution = .fillEqually
    }
//    MARK: ConfigureButtons
    
    private func configureButtons() {
        textLeft.addTarget(self, action: #selector(handleTextLeft), for: .touchUpInside)
        textCenter.addTarget(self, action: #selector(handleTextCenter), for: .touchUpInside)
        textRight.addTarget(self, action: #selector(handleTextRight), for: .touchUpInside)
        cancleButton.addTarget(self, action: #selector(handleCancleButton), for: .touchUpInside)
        doneButton.addTarget(self, action: #selector(handleDoneButton), for: .touchUpInside)
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
            container.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
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
    private func configureTextAligmentStack() {
        container.addSubview(textAligmentStack)
        textAligmentStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textAligmentStack.topAnchor.constraint(equalTo: swipeLine.bottomAnchor,constant: 20),
            textAligmentStack.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            textAligmentStack.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.5),
            textAligmentStack.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func configureFontAndColorPiker() {
        container.addSubview(fontAndColorPiker)
        fontAndColorPiker.translatesAutoresizingMaskIntoConstraints = false
        fontAndColorPiker.delegate = self
        fontAndColorPiker.dataSource = self
        
        fontAndColorPiker.overrideUserInterfaceStyle = .dark
        
        NSLayoutConstraint.activate([
            fontAndColorPiker.topAnchor.constraint(equalTo: textAligmentStack.bottomAnchor),
            fontAndColorPiker.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            fontAndColorPiker.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.8),
            fontAndColorPiker.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.5)
            //fontAndColorPiker.heightAnchor.constraint(equalToConstant: 150)
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
            fontSizeSlider.topAnchor.constraint(equalTo: fontAndColorPiker.bottomAnchor,constant: -25),
            fontSizeSlider.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            fontSizeSlider.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.7),
            fontSizeSlider.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureFontSizeLabel() {
        container.addSubview(fontSizeLabel)
        fontSizeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        fontSizeLabel.text = "30.0"
        fontSizeLabel.textColor = .darkGray
        
        NSLayoutConstraint.activate([
            fontSizeLabel.centerYAnchor.constraint(equalTo: fontSizeSlider.centerYAnchor),
            fontSizeLabel.leadingAnchor.constraint(equalTo: fontSizeSlider.trailingAnchor),
            fontSizeLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor)
        ])
    }

    private func configureBottomStackView() {
        container.addSubview(bottomStackView)
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: container.safeAreaLayoutGuide.bottomAnchor),
            bottomStackView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            bottomStackView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            bottomStackView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    private func configureBottomLinie() {
        container.addSubview(bottomLine)
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomLine.bottomAnchor.constraint(equalTo: bottomStackView.topAnchor),
            bottomLine.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            bottomLine.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.9)
        ])
    }
}
// MARK: - UIPickerViewDelegate, UIPickerViewDataSource

extension TextConfigurationVC : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    
        return component == 0 ? fontArray.count : colorArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return component == 0 ? fontArray[row] : colorArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        component == 0 ? postFont(fontName: fontArray[row]) : postFontColor(fontColor: colorArray[row])
    }
    private func postFont(fontName : String) {
        NotificationCenter.default.post(name: .fontQuote, object: nil, userInfo: ["font" : fontName])
    }
    private func postFontColor(fontColor : String) {
        NotificationCenter.default.post(name: .fontColor, object: nil, userInfo: ["color" : fontColor])
    }
}
