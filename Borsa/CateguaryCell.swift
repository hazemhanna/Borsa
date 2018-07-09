//
//  CateguaryCell.swift
//  Borsa
//
//  Created by hazem on 6/11/18.
//  Copyright © 2018 hazem. All rights reserved.
//

import UIKit


class CateguaryCell: BaseCell {
    
    var controller:MainController?
    
    var data : MainModel? {
        
        
        didSet{
            
            if data!.BS! == "-1" {
                
                
                arrowImage.image = #imageLiteral(resourceName: "download (1)")
                
                
            } else if data!.BS! == "1" {
                
                arrowImage.image = #imageLiteral(resourceName: "download (2)")
                
                
                
            }else {
                
                arrowImage.image = #imageLiteral(resourceName: "refresh_grey_192x192")
                
            }
            priceLabel.text = data!.Sprice
            cityLabel.text = data!.Bname
            orderPriceLabel.text = data!.Bprice
            
        }
        
        
    }
    
    override func setupViews() {
        
        addSubview(cellView)
        cellView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cellView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        cellView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        cellView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        addSubview(ImageView)
        ImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/4).isActive = true
        ImageView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        ImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        ImageView.isUserInteractionEnabled = false
        
        ////////////
        cellView.addSubview(pointImage)
        pointImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        pointImage.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        pointImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.06 ).isActive = true
        pointImage.heightAnchor.constraint(equalTo: heightAnchor,multiplier:0.5).isActive = true
        ////////
        cellView.addSubview(arrowImage)
        arrowImage.leftAnchor.constraint(equalTo:pointImage.rightAnchor, constant:30).isActive = true
        arrowImage.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        arrowImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.05).isActive = true
        arrowImage.heightAnchor.constraint(equalTo: arrowImage.widthAnchor).isActive = true
        
        cellView.addSubview(priceLabel)
        priceLabel.leftAnchor.constraint(equalTo:ImageView.rightAnchor).isActive = true
        priceLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        priceLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/4).isActive = true
        priceLabel.textAlignment = .center
    
        cellView.addSubview(orderPriceLabel)
        orderPriceLabel.leftAnchor.constraint(equalTo:priceLabel.rightAnchor).isActive = true
        orderPriceLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        orderPriceLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/4).isActive = true
        orderPriceLabel.textAlignment = .center
        
        cellView.addSubview(cityLabel)
        cityLabel.leftAnchor.constraint(equalTo:orderPriceLabel.rightAnchor).isActive = true
        cityLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        cityLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/4).isActive = true
        cityLabel.textAlignment = . center
        
        pointImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(SwitchToStockDetails)))
        pointImage.isUserInteractionEnabled = true
    }
    
    
    func SwitchToStockDetails(tapGestureRecognizer: UITapGestureRecognizer)
    {
        
        controller?.SwtichToStockDetails(id:data!.Bid!)
        
    }
    
    let ImageView  :UIView = {
        let uv = UIView()
        uv.backgroundColor = .clear
        uv.translatesAutoresizingMaskIntoConstraints = false
        return uv
    }()
    
    let cellView  :UIView = {
        let uv = UIView()
        uv.backgroundColor = .white
        uv.layer.cornerRadius = 3
        uv.translatesAutoresizingMaskIntoConstraints = false
        uv.layer.shadowOffset = CGSize(width: -2,height: 3)
        uv.layer.shadowColor = UIColor.black.cgColor
        uv.layer.shadowRadius = 10
        uv.layer.shadowOpacity = 0.1
        uv.layer.masksToBounds = false;
        uv.clipsToBounds = false;
        return uv
        
    }()
    let pointImage:UIImageView = {
        let ci = UIImageView(image:#imageLiteral(resourceName: "menu"))
        ci.translatesAutoresizingMaskIntoConstraints = false
        return ci
        
    }()
    let arrowImage:UIImageView = {
        let ci = UIImageView(image:#imageLiteral(resourceName: "download (1)"))
        ci.translatesAutoresizingMaskIntoConstraints = false
        return ci
        
    }()
    let secondArrowImage:UIImageView = {
        let ci = UIImageView(image:#imageLiteral(resourceName: "download (2)"))
        ci.translatesAutoresizingMaskIntoConstraints = false
        return ci
        
    }()
    let priceLabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.rgb(179, green: 179, blue: 179)
        var font = UIFont(name: "JFFlat-Regular", size: 14)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString(" 123.0 ", comment: "this is name")
        return pl
        
    }()
    let cityLabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.rgb(179, green: 179, blue: 179)
        var font = UIFont(name: "NotoKufiArabic-Bold", size: 12)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString("اربيل ", comment: "this is name")
        return pl
        
    }()
    
    let orderPriceLabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.rgb(179, green: 179, blue: 179)
        var font = UIFont(name: "JFFlat-Regular", size: 14)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString(" ٢٠٫٠  ", comment: "this is name")
        return pl
        
    }()

}
