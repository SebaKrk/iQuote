//
//  InstagramManager.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 30/12/2021.
//

import Foundation
import UIKit

class InstagramManager {
    
    static let shered = InstagramManager()
    func shareToInstagram(image: UIImage) {
        if let urlScheme = URL(string: "instagram-stories://share") {
            if UIApplication.shared.canOpenURL(urlScheme) {
                
                let imageData: Data = image.pngData()!
                
                let items = [[
                    "com.instagram.sharedSticker.backgroundImage": imageData,
                    //"com.instagram.sharedSticker.backgroundTopColor": "#EA2F3F",
                    //"com.instagram.sharedSticker.backgroundBottomColor": "#8845B9",
                ]]
                let pasteboardOptions = [UIPasteboard.OptionsKey.expirationDate: Date().addingTimeInterval(60*5)]
                UIPasteboard.general.setItems(items, options: pasteboardOptions)
                UIApplication.shared.open(urlScheme, options: [:], completionHandler: nil)
            } else {
                //self.presentAlertOnMainThred(title: "Upsss", message: "You dont have instagram app on your device")
            }
        }
    }
        
        func shareToInstagramStories(image: UIImage) {
            guard let instagramUrl = URL(string: "instagram-stories://share") else {
                return
            }

            if UIApplication.shared.canOpenURL(instagramUrl) {
                let pasterboardItems = [["com.instagram.sharedSticker.backgroundImage": image as Any]]
                UIPasteboard.general.setItems(pasterboardItems)
                UIApplication.shared.open(instagramUrl)
            } else {
                //self.presentAlertOnMainThred(title: "Upsss", message: "You dont have instagram app on your device")
            }
        }
        
    func shareToInstagramFeed(image: UIImage) {
        guard let instagramUrl = URL(string: "instagram://app") else {
            return
        }
        if UIApplication.shared.canOpenURL(instagramUrl) {
            guard let imageData = image.jpegData(compressionQuality: 100) else {
                return
            }
            let path = (NSTemporaryDirectory() as NSString).appendingPathComponent("instagram.ig")
            let fileUrl = URL(fileURLWithPath: path)
            do {
                try imageData.write(to: fileUrl, options: .atomic)
            } catch {
                // could not write image data
                print("could not write image data")
                return
            }
            print("cos")
//            // instantiate a new document interaction controller
//            // you need to instantiate one document interaction controller per file
//            let documentController = UIDocumentInteractionController(url: fileUrl)
//            documentController.delegate = self
//            // the UTI is given by Instagram
//            documentController.uti = "com.instagram.photo"
//
//            // open the document interaction view to share to Instagram feed
//            documentController.presentOpenInMenu(from: self.view.frame, in: self.view, animated: true)
        } else {
           // self.presentAlertOnMainThred(title: "Upsss", message: "You dont have instagram app on your device")
        }
    }
}

//    Data for an image asset in a supported format (JPG, PNG). Minimum dimensions 720x1280. Recommended image ratios 9:16 or 9:18.
//    com.instagram.photo

//    NSURL *instagramURL = [NSURL URLWithString:@"instagram://location?id=1"];
//    if ([[UIApplication sharedApplication] canOpenURL:instagramURL]) {
//        [[UIApplication sharedApplication] openURL:instagramURL];
//    }
