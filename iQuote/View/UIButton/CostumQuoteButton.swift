//
//  CostumQuoteButton.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 21/11/2021.
//

import Foundation
import UIKit

class CostumeQuoteButton  : UIButton {
    
    var buttonIsOn = false
    var offButton = UIImage(named: "QuoteButton")
    var onButton = UIImage(named: "QuoteButton2")
    let buttonSize: CGFloat = 80
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        setImage(offButton, for: .normal)
        layer.masksToBounds = true
        widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
        heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
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
