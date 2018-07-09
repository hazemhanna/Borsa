//
//  MessageBoxView.swift
//  Borsa
//
//  Created by hazem on 6/25/18.
//  Copyright © 2018 hazem. All rights reserved.
//


import UIKit


class MessageBoxView: BaseCell {
    
    
    
    var data : MessageBoxModel? {
        
        didSet{
            
MessageSubjectLabel.text = data?.Subject
            MessageText.text = data?.Msg
        dateLabel.text = data?.MDate
           
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
        cellView.addSubview(MessageSubjectLabel)
        MessageSubjectLabel.rightAnchor.constraint(equalTo:rightAnchor, constant: -10).isActive = true
        MessageSubjectLabel.topAnchor.constraint(equalTo: cellView.topAnchor,constant : 25).isActive = true
        MessageSubjectLabel.textAlignment = . center
        
        
        cellView.addSubview(dateLabel)
        dateLabel.topAnchor.constraint(equalTo:cellView.topAnchor, constant: 5).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor,constant : 10).isActive = true
        dateLabel.textAlignment = . center
        
        
        cellView.addSubview(lineView)
        lineView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        lineView.topAnchor.constraint(equalTo: MessageSubjectLabel.bottomAnchor,constant : 5).isActive = true
        lineView.widthAnchor.constraint(equalTo: cellView.widthAnchor, multiplier: 0.98).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
       
        
        cellView.addSubview(MessageText)
        MessageText.rightAnchor.constraint(equalTo:rightAnchor, constant: -10).isActive = true
        MessageText.topAnchor.constraint(equalTo: lineView.bottomAnchor,constant : 5).isActive = true
        MessageText.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        MessageText.heightAnchor.constraint(equalToConstant: 40).isActive = true
        MessageText.textAlignment = . right
      
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
    
    let MessageSubjectLabel :UILabel = {
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
    
    let MessageText :UITextView = {
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
