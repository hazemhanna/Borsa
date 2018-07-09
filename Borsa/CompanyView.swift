//
//  CompanyView.swift
//  Borsa
//
//  Created by hazem on 6/23/18.
//  Copyright © 2018 hazem. All rights reserved.
//

import UIKit


class CompanyView: BaseCell {
    
    var controller : CompanyController?
    
    var data  : CompanyModel? {
        
        
        
        didSet {
            
            cityLabel.text = data?.ComName
            
        }
    }
    
    
    
    
    
    override func setupViews() {
        
        addSubview(cellView)
        cellView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cellView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        cellView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        cellView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        //cellView.isUserInteractionEnabled = false
        
        
        ////////////
        
        cellView.addSubview(cityLabel)
        cityLabel.rightAnchor.constraint(equalTo:rightAnchor, constant: -5).isActive = true
        cityLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        cityLabel.textAlignment = . center
        
        
        cityLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(SwitchToStockDetails)))
        cityLabel.isUserInteractionEnabled = true
        
    }
    
    
    
    func SwitchToStockDetails(tapGestureRecognizer: UITapGestureRecognizer)
        
    {
        controller?.SwtichToStockDetails(id: data!.ComId!)
    }
    
    
    
    let cellView  :UIView = {
        let uv = UIView()
        uv.backgroundColor = .white
        uv.layer.cornerRadius = 3
        uv.translatesAutoresizingMaskIntoConstraints = false
        //        uv.layer.borderColor = UIColor.black.cgColor
        //        uv.layer.borderWidth = 0.5
        uv.layer.shadowOffset = CGSize(width: -2,height: 3)
        uv.layer.shadowColor = UIColor.black.cgColor
        uv.layer.shadowRadius = 10
        uv.layer.shadowOpacity = 0.1
        uv.layer.masksToBounds = false;
        uv.clipsToBounds = false;
        
        return uv
        
    }()
    
    
    
    
    let cityLabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.rgb(18, green: 179, blue: 251)
        pl.font = UIFont.boldSystemFont(ofSize: 18)
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString("  شركة  البرق للصرفة ", comment: "this is name")
        return pl
        
    }()
    
    
    
}
