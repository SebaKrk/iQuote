//
//  Constants.swift
//  iQuote
//
//  Created by Sebastian Sciuba on 20/11/2021.
//

import Foundation

enum Constants {
    
    static let exampleQute = "The people who are crazy enough to think they can change the world are the ones who do"
    static let exampleAuthor = "Steve Jobs"
    static let backgroundIMG = "BGImg001"
    static let halfQuoteIMG = "halfQuote"
    
    static let fontTuples: [(name: String, fontName: String)] =
    [("Bayon","Bayon-Regular"),
     ("BethEllen","BethEllen-Regular"),
     ("BlackOpsOne","BlackOpsOne-Regular"),
     ("Calistoga","Calistoga-Regular"),
     ("Baskerville","Baskerville"),
     ("B-Bold","Baskerville-Bold"),
     ("B-BoldItalic","Baskerville-BoldItalic"),
     ("B-Italic","Baskerville-Italic"),
     ("B-SemiBold","Baskerville-SemiBold"),
     ("B-SemiBoldItalic","Baskerville-SemiBoldItalic"),
     ("Roboto", "Roboto-Black"),
     ("R-BlackItalic","Roboto-BlackItalic"),
     ("R-Bold","Roboto-Bold"),
     ("R-BoldItalic","Roboto-BoldItalic"),
     ("R-Italic","Roboto-Italic"),
     ("R-Light","Roboto-Light"),
     ("R-LightItalic","Roboto-LightItalic"),
     ("R-Medium","Roboto-Medium"),
     ("R-MediumItalic","Roboto-MediumItalic"),
     ("R-Regular","Roboto-Regular"),
     ("R-Thin","Roboto-Thin"),
     ("R-ThinItalic","Roboto-ThinItalic")]
    
    static let colorArray: [(name: String, colorName: String)] =
    [("white","white"),
     ("black","black"),
     ("red","red"),
     ("blue","blue"),
     ("green","green"),
     ("orange","orange")]
}
enum fontText {
    
    static let mainQuote = "Roboto-Bold"
    static let mainAuthorQuote = "Roboto-Medium"
    static let popupTitle = "Roboto-Bold"
    static let popupMessage = "Roboto-Regular"
    static let favConTitle = "Roboto"
    static let listTitle  = "Roboto-Bold" // Roboto-Medium
    static let listAuthor = "Roboto-Medium"
    static let listQuote = "Baskerville"
    static let cancleButton = "Roboto-Light"
    static let doneButton = "Roboto-Medium"
    static let fontLabel = "Roboto-Regular"
}

enum Icons {
    // Main Logo
    static let iQuoteMainButton = "iQuoteLogo"
    static let iQuoteMainButtonWhite = "iQuoteLogoWhite"
    
    //Logo
    static let LogoForBackground = "LogoForBackground"
    static let LogoForBackgroundWhite = "LogoForBackgroundWhite"
    static let LogoButton1 = "LogoButton1"
    static let LogoButton2 = "LogoButton2"
    static let LogoButton3 = "LogoButton3"
    
    // Expand Buttons
    static let nextButtonMain = "NewNextButton"
    static let nextButtonMain2 = "NewNextButton2"
    static let shareButtonMain = "NewShareButton"
    static let shareButtonMain2 = "NewShareButton2"
    static let heartButton = "newHeartButton"
    static let heartButton2 = "newHeartButton2"
    static let listButtonMain = "newListButton"
    static let listButtonMain2 = "newListButton2"
    
    
    // Photo Options Buttons
    static let dragTextButton = "NewDragTextButton1"
    static let dragTextButton2 = "NewDragTextButton2"
    static let gradientButton = "NewGradientButton1"
    static let gradientButton2 = "NewGradientButton2"
    static let photoButton = "NewPhotoButton1"
    static let photoButton2 = "NewPhotoButton2"
    static let quoteIconButton = "NewQuoteIconButton1"
    static let quoteIconButton2 = "NewQuoteIconButton2"
    static let textButton = "NewTextButton1"
    static let textButton2 = "NewTextButton2"
    
    //Galery Unsplash
    static let unsplashIcon = "UnsplashImage1"
    static let unsplashIcon2 = "UnsplashImage2"
    static let galleryButton = "GalleryButton1"
    static let galleryButton2 = "GalleryButton2"
    
    //Share Option Buttons
    static let iMessageButton = "newiMasageIcon1"
    static let iMessageButton2 = "newiMasageIcon2"
    static let shareButton = "NewExportButton"
    static let shareButton2 = "NewExportButton2"
    static let copyTextButton = "newCopyTextIcon1"
    static let copyTextButton2 = "newCopyTextIcon2"
    
    //Cell
    static let cellCheck = "cellCheck"
    static let cellDeleted = "cellDeleted"
    static let cellExport = "cellExport2"
    
    //Aligment
    static let textLeft = "alignLeft1"
    static let textLeft2 = "alignLeft2"
    static let textCenter = "alignCenter1"
    static let textCenter2 = "alignCenter2"
    static let textRight = "alignRight1"
    static let textRight2 = "alignRight2"
}






