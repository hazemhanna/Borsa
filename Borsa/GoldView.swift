//
//  GoldView.swift
//  Borsa
//
//  Created by hazem on 6/30/18.
//  Copyright © 2018 hazem. All rights reserved.
//

import UIKit


class GoldView: BaseCell {
    
    
    
    var data : InterNationalModel? {
        
        didSet{
            
            cityLabel.text = data?.HLine
            dateLabel.text = data?.NDate
            newsLabel.text = data?.Details
        }
    }
    
    
    override func setupViews() {
        
        
        addSubview(FView)
        FView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        FView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        FView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        FView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        FView.addSubview(cellView)
        cellView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cellView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        cellView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.98).isActive = true
        cellView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.95).isActive = true
        
        ////////////
        
        cellView.addSubview(cityLabel)
        cityLabel.rightAnchor.constraint(equalTo:rightAnchor, constant: -5).isActive = true
        cityLabel.topAnchor.constraint(equalTo: cellView.topAnchor,constant : 20).isActive = true
        cityLabel.textAlignment = . center
        
        cellView.addSubview(lineView)
        lineView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        lineView.topAnchor.constraint(equalTo: cityLabel.bottomAnchor,constant : 10).isActive = true
        lineView.widthAnchor.constraint(equalTo: cellView.widthAnchor, multiplier: 0.98).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        cellView.addSubview(dateLabel)
        dateLabel.leftAnchor.constraint(equalTo:leftAnchor, constant: 10).isActive = true
        dateLabel.topAnchor.constraint(equalTo: cellView.topAnchor,constant : 20).isActive = true
        dateLabel.textAlignment = . center
        
        
        
        cellView.addSubview(newsLabel)
        newsLabel.rightAnchor.constraint(equalTo:rightAnchor, constant: -10).isActive = true
        newsLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor,constant : 5).isActive = true
        newsLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        newsLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        newsLabel.textAlignment = . right
        
        
        
        
        
    }
    
    let FView  :UIView = {
        let uv = UIView()
        uv.backgroundColor = UIColor.white
        uv.layer.cornerRadius = 7
        uv.translatesAutoresizingMaskIntoConstraints = false
        //        uv.layer.borderColor = UIColor.black.cgColor
        //        uv.layer.borderWidth = 0.5
        uv.layer.shadowOffset = CGSize(width: -2,height: 3)
        uv.layer.shadowColor = UIColor.black.cgColor
        uv.layer.shadowRadius = 10
        uv.layer.shadowOpacity = 0.3
        uv.layer.masksToBounds = false;
        uv.clipsToBounds = false;
        
        return uv
        
    }()
    
    let cellView  :UIView = {
        let uv = UIView()
        uv.backgroundColor = UIColor.rgb(222, green: 239, blue: 251)
        uv.layer.cornerRadius = 3
        uv.translatesAutoresizingMaskIntoConstraints = false
        //        uv.layer.borderColor = UIColor.black.cgColor
        //        uv.layer.borderWidth = 0.5
        //        uv.layer.shadowOffset = CGSize(width: -2,height: 3)
        //        uv.layer.shadowColor = UIColor.black.cgColor
        //        uv.layer.shadowRadius = 10
        //        uv.layer.shadowOpacity = 0.1
        //        uv.layer.masksToBounds = false;
        //        uv.clipsToBounds = false;
        
        return uv
        
    }()
    
    
    let lineView  :UIView = {
        let uv = UIView()
        uv.backgroundColor = .black
        uv.layer.cornerRadius = 1
        uv.translatesAutoresizingMaskIntoConstraints = false
        return uv
        
    }()
    
    let cityLabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.rgb(101, green: 101, blue: 101)
        pl.font = UIFont.boldSystemFont(ofSize: 18)
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString(" الزهب والدولار", comment: "this is name")
        return pl
        
    }()
    
    
    
    let dateLabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.rgb(101, green: 101, blue: 101)
        pl.font = UIFont.boldSystemFont(ofSize: 18)
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString("20/7/2017", comment: "this is name")
        return pl
        
    }()
    
    let newsLabel :UITextView = {
        let pl = UITextView()
        pl.textColor = UIColor.rgb(101, green: 101, blue: 101)
        pl.backgroundColor = UIColor.rgb(222, green: 239, blue: 251)
        pl.font = UIFont.boldSystemFont(ofSize: 15)
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString("   تااااازبنر تم صرف الرواتب طبقا لمادة الدستودية الاولي ", comment: "this is name")
        pl.isEditable = false
        return pl
        
    }()
    
}
