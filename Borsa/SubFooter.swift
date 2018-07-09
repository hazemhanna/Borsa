//
//  SubFooter.swift
//  Borsa
//
//  Created by hazem on 6/23/18.
//  Copyright © 2018 hazem. All rights reserved.
//

import UIKit
class SubFooter: BaseCell {
    
    var controller1 :CompanyPranches?

    
    override func setupViews() {
        backgroundColor = UIColor.rgb(18, green: 179, blue: 251)
        layer.cornerRadius = 3
        frame.size.width = 500
        
        
        
        addSubview(backLabel)
        backLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -60).isActive = true
        backLabel.topAnchor.constraint(equalTo: topAnchor,constant : 10).isActive = true
        
        
        addSubview(backImage)
        backImage.rightAnchor.constraint(equalTo: backLabel.leftAnchor, constant: -5).isActive = true
        backImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        backImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.07).isActive = true
        backImage.heightAnchor.constraint(equalTo: backImage.widthAnchor).isActive = true
        
        
        addSubview(homeLabel)
        homeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 100).isActive = true
        homeLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(homeImage)
        homeImage.rightAnchor.constraint(equalTo: homeLabel.leftAnchor, constant: -5).isActive = true
        homeImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        homeImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1).isActive = true
        homeImage.heightAnchor.constraint(equalTo: homeImage.widthAnchor).isActive = true
        
        
        
        backImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(SwitchToStockDetails1)))
        backImage.isUserInteractionEnabled = true
        
        homeImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(SwitchToStockDetails2)))
        homeImage.isUserInteractionEnabled = true
        
        
    }
    
    func SwitchToStockDetails1(tapGestureRecognizer: UITapGestureRecognizer)
    {
        
        controller1?.SwtichToCompanyControler( )
        
    }
    ////////////
    
    func SwitchToStockDetails2(tapGestureRecognizer: UITapGestureRecognizer)
    {
        
        controller1?.SwtichToHomePage()
        
    }
    
    let backImage:UIImageView = {
        let ci = UIImageView(image:#imageLiteral(resourceName: "back"))
        ci.translatesAutoresizingMaskIntoConstraints = false
        return ci
        
    }()
    
    let homeImage:UIImageView = {
        let ci = UIImageView(image:#imageLiteral(resourceName: "home22"))
        ci.translatesAutoresizingMaskIntoConstraints = false
        return ci
        
    }()
    
    let backLabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.white
        var font = UIFont(name: "JFFlat-Regular", size: 20)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        
        pl.text = NSLocalizedString(" رجوع", comment: "this is name")
        
        pl.font = UIFont.boldSystemFont(ofSize: 20)
        
        return pl
        
    }()
    
    let homeLabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.white
        var font = UIFont(name: "JFFlat-Regular", size: 20)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString(" الرئيسية ", comment: "this is name")
        return pl
        
    }()

}
