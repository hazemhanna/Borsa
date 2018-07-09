//
//  Header.swift
//  Borsa
//
//  Created by hazem on 6/11/18.
//  Copyright © 2018 hazem. All rights reserved.
//


import UIKit


class MainHeadr: BaseCell {
    var controller:MainController?
    
    override func setupViews() {
        backgroundColor = UIColor.rgb(18, green: 179, blue: 251)
        layer.cornerRadius = 3
        frame.size.width = 500
        
        addSubview(ImageView)
        ImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/4).isActive = true
        ImageView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        ImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        
        addSubview(OrdrLabel)
        OrdrLabel.leftAnchor.constraint(equalTo: ImageView.rightAnchor).isActive = true
        OrdrLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        OrdrLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/4).isActive = true
        OrdrLabel.textAlignment = .center
        
        
        addSubview(showLabel)
        showLabel.leftAnchor.constraint(equalTo: OrdrLabel.rightAnchor).isActive = true
        showLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        showLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/4).isActive = true
        showLabel.textAlignment = .center
       
        addSubview(CityLabel)
        CityLabel.leftAnchor.constraint(equalTo: showLabel.rightAnchor).isActive = true
        CityLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        CityLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/4).isActive = true
        CityLabel.textAlignment = .center
    
    
    }
    
    let ImageView  :UIView = {
        let uv = UIView()
        uv.backgroundColor = .clear
        uv.translatesAutoresizingMaskIntoConstraints = false
        return uv
        
    }()
    
    let OrdrLabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.white
        var font = UIFont(name: "NotoKufiArabic-Bold", size: 12)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString(" طلب  ", comment: "this is name")
        return pl
    }()
    
    
    let showLabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.white
        var font = UIFont(name: "NotoKufiArabic-Bold", size: 12)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString(" عرض ", comment: "this is name")
        return pl
    }()
    
    let CityLabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.white
        var font = UIFont(name: "NotoKufiArabic-Bold", size: 12)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString(" البورصة  ", comment: "this is name")
        return pl
    }()
}
