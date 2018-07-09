//
//  AmericanView.swift
//  Borsa
//
//  Created by hazem on 6/23/18.
//  Copyright © 2018 hazem. All rights reserved.
//

import UIKit


class AmericanView: BaseCell {
    
    var controller : AmericanDollar?
    var data : DollarModel? {
        
        didSet{
            
            GetImageFromUrl()
            cityLabel.text = data?.Cname
            enLabel.text = data?.Sympol
            PriceLabel.text = data?.Cprice
        }
    }
    
    
    
    
    
    
    override func setupViews() {
        
        addSubview(cellView)
        cellView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cellView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        cellView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        cellView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        ////////////
        cellView.addSubview(FlagImage)
        FlagImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        FlagImage.topAnchor.constraint(equalTo: cellView.topAnchor,constant : 20).isActive = true
        FlagImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1).isActive = true
        FlagImage.heightAnchor.constraint(equalTo: FlagImage.widthAnchor).isActive = true
        ////////
        cellView.addSubview(calculatorImage)
        calculatorImage.topAnchor.constraint(equalTo:FlagImage.bottomAnchor, constant: 20).isActive = true
        calculatorImage.rightAnchor.constraint(equalTo: cellView.rightAnchor, constant : -10).isActive = true
        calculatorImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1).isActive = true
        calculatorImage.heightAnchor.constraint(equalTo: calculatorImage.widthAnchor).isActive = true
        
        cellView.addSubview(cityLabel)
        cityLabel.topAnchor.constraint(equalTo:topAnchor, constant: 20).isActive = true
        cityLabel.centerXAnchor.constraint(equalTo: cellView.centerXAnchor).isActive = true
        cityLabel.textAlignment = .center
        
        cellView.addSubview(enLabel)
        enLabel.topAnchor.constraint(equalTo:cityLabel.bottomAnchor, constant: 10).isActive = true
        enLabel.centerXAnchor.constraint(equalTo: cellView.centerXAnchor).isActive = true
        enLabel.textAlignment = .center
        
        cellView.addSubview(PriceLabel)
        PriceLabel.topAnchor.constraint(equalTo:enLabel.bottomAnchor, constant: 10).isActive = true
        PriceLabel.centerXAnchor.constraint(equalTo: cellView.centerXAnchor).isActive = true
        PriceLabel.textAlignment = .center
        
        calculatorImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(SwitchToStockDetails)))
        calculatorImage.isUserInteractionEnabled = true
        
    }
    
    
    
    func SwitchToStockDetails(tapGestureRecognizer: UITapGestureRecognizer)
    {
        
        controller?.SwtichToStockDetails(id:data!)
        
        
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
    
    let FlagImage:CustomImageView = {
        let ci = CustomImageView(image:#imageLiteral(resourceName: "flag "))
        ci.translatesAutoresizingMaskIntoConstraints = false
        return ci
        
    }()
    
    let calculatorImage:UIImageView = {
        let ci = UIImageView(image:#imageLiteral(resourceName: "calculating"))
        ci.translatesAutoresizingMaskIntoConstraints = false
        return ci
        
    }()
    
    let cityLabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.rgb(179, green: 179, blue: 179)
        var font = UIFont(name: "JFFlat-Regular", size: 20)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        
        pl.text = NSLocalizedString("   دولار امريكي ", comment: "this is name")
        
        pl.font = UIFont.boldSystemFont(ofSize: 20)
        
        return pl
        
    }()
    
    let enLabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.rgb(179, green: 179, blue: 179)
        var font = UIFont(name: "JFFlat-Regular", size: 20)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString(" USD ", comment: "this is name")
        return pl
        
    }()
    
    ///////
    let PriceLabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.rgb(179, green: 179, blue: 179)
        var font = UIFont(name: "JFFlat-Regular", size: 20)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString(" 1300  ", comment: "this is name")
        return pl
        
    }()
    
    
    func GetImageFromUrl(){
        
        var  url = "\(data!.Flag!)" as? String
        if let imageurl = url {
            
            FlagImage.loadImageUsingUrlString(imageurl)
            
            
        }
        
    }
    
    
}

