//
//  mainFooter.swift
//  Borsa
//
//  Created by hazem on 6/11/18.
//  Copyright © 2018 hazem. All rights reserved.
//




import UIKit
import MarqueeLabel
class MainFooter: BaseCell {
    
    var news : NewsModel?{
        didSet{
        
        
            if news?.NewesBar != nil {
            
                  self.cityLabel.text = self.news!.NewesBar!
                 print(news!.NewesBar!)
               cityLabel.type = .rightLeft
            }
           
           
        }
    }
    
    override func setupViews() {
        backgroundColor = UIColor.rgb(18, green: 179, blue: 251)
        layer.cornerRadius = 3
        
        
        var lengthyLabel = MarqueeLabel.init(frame: self.frame, duration: 8.0, fadeLength: 10.0)

        addSubview(cityLabel)
        cityLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        cityLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        cityLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        cityLabel.heightAnchor.constraint(equalTo: heightAnchor).isActive = true

    }
    
   
   let cityLabel :MarqueeLabel = {
        let pl = MarqueeLabel()
        pl.animationDelay = 0
    pl.type = .right
        pl.speed = .rate(60)
        pl.textColor = UIColor.white
        pl.backgroundColor = .clear
        var font = UIFont(name: "JFFlat-Regular", size: 14)
        pl.font = font
       pl.translatesAutoresizingMaskIntoConstraints = false
    //    pl.text = NSLocalizedString(" بفغداد شارع الرشيد ، تم صرف رواتب التقاعد   ", comment: "this is name")
        return pl
        
    }()
    
    
    
    
}
