//
//  MenuView .swift
//  Borsa
//
//  Created by hazem on 6/28/18.
//  Copyright © 2018 hazem. All rights reserved.
//


import UIKit

class MenuView: BaseCell {
    
    override func setupViews() {
        
        
        addSubview(menuView)
        menuView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        menuView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        menuView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        menuView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        
        /////////////
        menuView.addSubview(menuImage)
        menuImage.rightAnchor.constraint(equalTo: menuView.rightAnchor, constant: -20).isActive = true
        menuImage.centerYAnchor.constraint(equalTo: menuView.centerYAnchor).isActive = true
        menuImage.widthAnchor.constraint(equalTo: menuView.widthAnchor, multiplier: 0.06).isActive = true
        menuImage.heightAnchor.constraint(equalTo:  menuView.heightAnchor, multiplier: 0.4).isActive = true
        
        
        menuView.addSubview(menuLabe)
        menuLabe.rightAnchor.constraint(equalTo: menuImage.leftAnchor, constant: -10).isActive = true
        menuLabe.centerYAnchor.constraint(equalTo: menuView.centerYAnchor).isActive = true
        
   
    
        menuView.addSubview(LeftArrow)
        LeftArrow.leftAnchor.constraint(equalTo: menuView.leftAnchor, constant : 10).isActive = true
        LeftArrow.centerYAnchor.constraint(equalTo: menuView.centerYAnchor).isActive = true
        LeftArrow.widthAnchor.constraint(equalTo: menuView.widthAnchor, multiplier: 0.02).isActive = true
        LeftArrow.heightAnchor.constraint(equalTo:  LeftArrow.widthAnchor).isActive = true
    
    
    
    }
    
    ////////
    let menuView :UIView = {
        let uv = UIView()
        uv.backgroundColor = .white
        uv.layer.cornerRadius = 3
        uv.translatesAutoresizingMaskIntoConstraints = false
//        uv.layer.shadowColor = UIColor.black.cgColor
//        uv.layer.shadowOffset = CGSize(width: -2, height: 3)
//        uv.layer.shadowOpacity = 0.1
//        uv.layer.shadowRadius = 10
//        uv.layer.masksToBounds = false
//        uv.clipsToBounds = false
        return uv
    }()
    
    /////// person imae
    let menuImage:UIImageView = {
        let ci = UIImageView(image:#imageLiteral(resourceName: "refresh_grey_192x192"))
        ci.translatesAutoresizingMaskIntoConstraints = false
        return ci
    }()

    
    
    /////// person imae
    let LeftArrow:UIImageView = {
        let ci = UIImageView(image : #imageLiteral(resourceName: "32378507_10213306448834559_8626691862717005824_n"))
        ci.translatesAutoresizingMaskIntoConstraints = false
        return ci
    }()
    
    
    //////// person name label
    let menuLabe :UILabel = {
        let NL = UILabel()
        NL.textColor = UIColor.rgb(155, green: 155, blue: 155)
        var font = UIFont(name: "JFFlat-Regular", size: 15)
        NL.font = font
        NL.translatesAutoresizingMaskIntoConstraints = false
        NL.text = NSLocalizedString("who ", comment: "this is name")
        return NL
    }()


}
