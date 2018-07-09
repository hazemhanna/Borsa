//
//  CompanyPranchViews.swift
//  Borsa
//
//  Created by hazem on 6/23/18.
//  Copyright © 2018 hazem. All rights reserved.
//

import UIKit


class CompanyPranchViews: BaseCell {
    
    
    var data :CompanyPranchModel?{
    
        didSet {
        
            
            dCityLabel.text = data?.City
            dMobileLabel.text = data?.Mobile
            dphoneLabel.text = data?.Phone
            dfaxLabel.text = data?.Fax
            dAddressLabel.text = data?.Address
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
        
        ////////////  main labels
        
        cellView.addSubview(cityLabel)
        cityLabel.rightAnchor.constraint(equalTo:rightAnchor, constant: -10).isActive = true
        cityLabel.topAnchor.constraint(equalTo: cellView.topAnchor,constant : 20).isActive = true
        cityLabel.textAlignment = . center
        
        cellView.addSubview(mobileLabel)
        mobileLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        mobileLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor,constant : 20).isActive = true
        mobileLabel.textAlignment = . center
        
        
        
        cellView.addSubview(phoneLabel)
        phoneLabel.rightAnchor.constraint(equalTo:rightAnchor, constant: -10).isActive = true
        phoneLabel.topAnchor.constraint(equalTo: mobileLabel.bottomAnchor,constant : 20).isActive = true
        phoneLabel.textAlignment = . center

        cellView.addSubview(faxLabel)
        faxLabel.rightAnchor.constraint(equalTo:rightAnchor, constant: -10).isActive = true
        faxLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor,constant : 20).isActive = true
        faxLabel.textAlignment = . center
        
        cellView.addSubview(addressLabel)
        addressLabel.rightAnchor.constraint(equalTo:rightAnchor, constant: -10).isActive = true
        addressLabel.topAnchor.constraint(equalTo: faxLabel.bottomAnchor,constant : 20).isActive = true
        addressLabel.textAlignment = . center

        
        /////////////////// dynamic label come from backend
    
        cellView.addSubview(dCityLabel)
        dCityLabel.leftAnchor.constraint(equalTo:leftAnchor, constant: 10).isActive = true
        dCityLabel.topAnchor.constraint(equalTo: topAnchor,constant : 20).isActive = true
        dCityLabel.textAlignment = . center
        
        cellView.addSubview(dMobileLabel)
        dMobileLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 80).isActive = true
        dMobileLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor,constant : 20).isActive = true
        dMobileLabel.textAlignment = . center
        
        cellView.addSubview(dphoneLabel)
        dphoneLabel.leftAnchor.constraint(equalTo:leftAnchor, constant: 50).isActive = true
        dphoneLabel.topAnchor.constraint(equalTo: mobileLabel.bottomAnchor,constant : 20).isActive = true
        dphoneLabel.textAlignment = . center
        
        cellView.addSubview(dfaxLabel)
        dfaxLabel.leftAnchor.constraint(equalTo:leftAnchor, constant: 10).isActive = true
        dfaxLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor,constant : 20).isActive = true
        dfaxLabel.textAlignment = . center
        
        cellView.addSubview(dAddressLabel)
        dAddressLabel.leftAnchor.constraint(equalTo:leftAnchor, constant: 10).isActive = true
        dAddressLabel.topAnchor.constraint(equalTo: faxLabel.bottomAnchor,constant : 20).isActive = true
        dAddressLabel.textAlignment = . center
        
        
        
        ///////////// call images
        
        cellView.addSubview(callImage)
        callImage.rightAnchor.constraint(equalTo:dMobileLabel.leftAnchor, constant: -5).isActive = true
        callImage.topAnchor.constraint(equalTo: cityLabel.bottomAnchor,constant : 20).isActive = true
        callImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.08).isActive = true
        callImage.heightAnchor.constraint(equalTo: callImage.widthAnchor).isActive = true
        
     
        
        cellView.addSubview(call2Image)
        call2Image.rightAnchor.constraint(equalTo:dphoneLabel.leftAnchor, constant: -5).isActive = true
        call2Image.topAnchor.constraint(equalTo: mobileLabel.bottomAnchor,constant : 20).isActive = true
        call2Image.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.08).isActive = true
        call2Image.heightAnchor.constraint(equalTo: call2Image.widthAnchor).isActive = true
        
        
        
        
        cellView.addSubview(newsLabel)
        newsLabel.rightAnchor.constraint(equalTo:rightAnchor, constant: -10).isActive = true
        newsLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant : -20).isActive = true
        newsLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
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
    
    
   
    
    let cityLabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.rgb(18, green: 179, blue: 251)
        pl.font = UIFont.boldSystemFont(ofSize: 18)
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString(" المدينة", comment: "this is name")
        return pl
        
    }()
    
    
    
    let mobileLabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.rgb(18, green: 179, blue: 251)
        pl.font = UIFont.boldSystemFont(ofSize: 18)
        var font = UIFont(name: "JFFlat-Regular", size: 20)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString("موبايل", comment: "this is name")
        return pl
        
    }()
    
    
 
    
    let phoneLabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.rgb(18, green: 179, blue: 251)
        var font = UIFont(name: "JFFlat-Regular", size: 20)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        
        pl.text = NSLocalizedString(" تيلفون", comment: "this is name")
        
        pl.font = UIFont.boldSystemFont(ofSize: 18)
        
        return pl
        
    }()
    
    let faxLabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.rgb(18, green: 179, blue: 251)
        var font = UIFont(name: "JFFlat-Regular", size: 18)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString(" فاكس ", comment: "this is name")
        return pl
        
}()

    
    
    
let addressLabel :UILabel = {
    let pl = UILabel()
    pl.textColor = UIColor.rgb(18, green: 179, blue: 251)
    var font = UIFont(name: "JFFlat-Regular", size: 18)
    pl.font = font
    pl.translatesAutoresizingMaskIntoConstraints = false
    pl.text = NSLocalizedString(" العنوان ", comment: "this is name")
    return pl
    
    
     }()
    
    
   
   
    
    
    
    let dCityLabel :UILabel = {
        let pl = UILabel()
    pl.textColor = UIColor.rgb(101, green: 101, blue: 101)
        pl.font = UIFont.boldSystemFont(ofSize: 18)
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString(" بفداد", comment: "this is name")
        return pl
        
    }()
    
    
    
    let dMobileLabel :UILabel = {
        let pl = UILabel()
 pl.textColor = UIColor.rgb(101, green: 101, blue: 101)
        pl.font = UIFont.boldSystemFont(ofSize: 18)
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString("٠١٢٠٠١٢٣٦٥٥٥", comment: "this is name")
        return pl
        
    }()
    
    
    
    
    let dphoneLabel :UILabel = {
        let pl = UILabel()
 pl.textColor = UIColor.rgb(101, green: 101, blue: 101)
        var font = UIFont(name: "JFFlat-Regular", size: 20)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        
        pl.text = NSLocalizedString(" ٢٢٠١٥٠٤٥", comment: "this is name")
        
        pl.font = UIFont.boldSystemFont(ofSize: 18)
        
        return pl
        
    }()
    
    let dfaxLabel :UILabel = {
        let pl = UILabel()
 pl.textColor = UIColor.rgb(101, green: 101, blue: 101)
        var font = UIFont(name: "JFFlat-Regular", size: 18)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString(" لا يوجد ", comment: "this is name")
        return pl
        
    }()
    
    
    
    
    let dAddressLabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.rgb(101, green: 101, blue: 101)
        var font = UIFont(name: "JFFlat-Regular", size: 18)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString(" ١٣ شارع بغداد ", comment: "this is name")
        return pl
        
        
    }()
    
    
    let call2Image:UIImageView = {
        let ci = UIImageView(image:#imageLiteral(resourceName: "call"))
        ci.translatesAutoresizingMaskIntoConstraints = false
        return ci
        
    }()
    
    let callImage:UIImageView = {
        let ci = UIImageView(image:#imageLiteral(resourceName: "call"))
        ci.translatesAutoresizingMaskIntoConstraints = false
        return ci
        
    }()


    let newsLabel :UITextView = {
        let pl = UITextView()
        pl.textColor = UIColor.rgb(101, green: 101, blue: 101)
        pl.backgroundColor = UIColor.rgb(222, green: 239, blue: 251)
        pl.font = UIFont.boldSystemFont(ofSize: 15)
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString("    تم صرف الرواتب طبقا لمادة الدستودية الاولي ", comment: "this is name")
        pl.isEditable = false
        return pl
        
    }()


}
