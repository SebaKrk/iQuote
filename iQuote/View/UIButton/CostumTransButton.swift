//
//  CostumTransButton.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 25/11/2021.
//

import Foundation
import UIKit

class CostumTransButton : UIButton {
    
    var buttonIsOn = false
    var offButton = UIImage()
    var onButton = UIImage()
    let buttonSize: CGFloat = 50
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    convenience init(imageOne : String, imageTwo: String) {
        self.init(frame: .zero)
        offButton = UIImage(named: imageOne)!
        onButton = UIImage(named: imageTwo)!
        setImage(offButton, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
   
        layer.masksToBounds = true
//        widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
//        heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        animate()
    }
    public func  flipLikeState() {
        buttonIsOn = !buttonIsOn
        animate()
    }
    private func animate() {
        UIView.animate(withDuration: 0.1, animations: {
            let newImg = self.buttonIsOn ? self.onButton : self.offButton
            self.scaleAnimation()
            self.setImage(newImg, for: .normal)
        }, completion: { _ in
            UIView.animate(withDuration: 0.3, animations: {
                self.transform = CGAffineTransform.identity
            })
        })
    }
    private func scaleAnimation() {
        transform = CGAffineTransform(scaleX: 2, y: 2)
    }
}
