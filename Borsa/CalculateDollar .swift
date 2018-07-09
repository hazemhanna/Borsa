//
//  CalculateDollar .swift
//  Borsa
//
//  Created by hazem on 6/25/18.
//  Copyright © 2018 hazem. All rights reserved.
//

import UIKit

class CalculateDollar  : UIViewController {
    
    
    var array = [DollarModel]()
    
    var id:DollarModel?
    var headerData:DollarModel?
    
    override func viewDidLoad() {
    

        DolarLabel.text  = headerData!.Cname!
        dinarLabe.text  = id!.Cname!
        sympolLabe.text = headerData?.Sympol
        sympl2Labe.text = id?.Sympol
        priceLabe.text = headerData?.Cprice
        countLabe.text = id?.Cprice
        
        
        
        
        view.backgroundColor = UIColor.rgb(110, green: 110, blue: 110)
        navigationController?.navigationBar.barTintColor = UIColor.rgb(18, green: 179, blue: 251)
        navigationItem.title = " بورصة اربيل "
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        view.addSubview(mainView)
        mainView.topAnchor.constraint(equalTo: view.topAnchor,constant : 70).isActive = true
        mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6).isActive = true
        ///////
        mainView.addSubview(DolarLabel)
        DolarLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        DolarLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20).isActive = true
        
        mainView.addSubview(sympolLabe)
        sympolLabe.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -40).isActive = true
        sympolLabe.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20).isActive = true

        mainView.addSubview(priceLabe)
        priceLabe.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        priceLabe.topAnchor.constraint(equalTo: DolarLabel.bottomAnchor, constant: 20).isActive = true
       
        mainView.addSubview(dollarText)
        dollarText.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        dollarText.topAnchor.constraint(equalTo: priceLabe.bottomAnchor, constant: 20).isActive = true
        dollarText.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.8).isActive = true
        dollarText.heightAnchor.constraint(equalToConstant: 40).isActive = true
        /////////
        mainView.addSubview(dinarLabe)
        dinarLabe.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        dinarLabe.topAnchor.constraint(equalTo: dollarText.bottomAnchor, constant: 30).isActive = true
    
        mainView.addSubview(sympl2Labe)
        sympl2Labe.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -40).isActive = true
        sympl2Labe.topAnchor.constraint(equalTo: dollarText.bottomAnchor, constant: 30).isActive = true
        
        mainView.addSubview(countLabe)
        countLabe.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        countLabe.topAnchor.constraint(equalTo: dinarLabe.bottomAnchor, constant: 20).isActive = true
        
        mainView.addSubview(dinarText)
        dinarText.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        dinarText.topAnchor.constraint(equalTo: countLabe.bottomAnchor, constant: 20).isActive = true
        dinarText.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.8).isActive = true
        dinarText.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        mainView.addSubview(countButn)
        countButn.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        countButn.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20).isActive = true
        countButn.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.4).isActive = true
        countButn.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    }
    ////////////////// main view
    
    
    let mainView :UIView = {
        let uv = UIView()
        uv.backgroundColor = UIColor.rgb(245, green: 245, blue: 245)
        uv.layer.cornerRadius = 3
        uv.translatesAutoresizingMaskIntoConstraints = false
        
        return uv
    }()
    //////////////////////////////

    let DolarLabel :UILabel = {
        let NL = UILabel()
        NL.textColor = UIColor.rgb(155, green: 155, blue: 155)
        var font = UIFont(name: "JFFlat-Regular", size: 15)
        NL.translatesAutoresizingMaskIntoConstraints = false
        NL.text = NSLocalizedString("دولار امريكي", comment: "this is name")
        return NL
        
    }()
    ////////////////// on and of button
    let sympolLabe :UILabel = {
        let NL = UILabel()
        NL.textColor = UIColor.rgb(18, green: 179, blue: 251)
        var font = UIFont(name: "JFFlat-Regular", size: 15)
        NL.font = font
        NL.translatesAutoresizingMaskIntoConstraints = false
        NL.text = NSLocalizedString("(USD)", comment: "this is name")
        return NL
        
    }()
    
    ///////// dynamic type
    let priceLabe :UILabel = {
        let NL = UILabel()
        NL.textColor = UIColor.rgb(155, green: 155, blue: 155)
        var font = UIFont(name: "JFFlat-Regular", size: 15)
        NL.font = font
        NL.translatesAutoresizingMaskIntoConstraints = false
        NL.text = NSLocalizedString("1", comment: "this is name")
        return NL
        
    }()
    
    
    let dinarLabe :UILabel = {
        let NL = UILabel()
        NL.textColor = UIColor.rgb(155, green: 155, blue: 155)
        var font = UIFont(name: "JFFlat-Regular", size: 15)
        NL.font = font
        NL.translatesAutoresizingMaskIntoConstraints = false
        NL.text = NSLocalizedString(" دينار عداقي", comment: "this is name")
        
        return NL
        
    }()
    
    ///////// Dynamic price
    
    let sympl2Labe :UILabel = {
        let NL = UILabel()
        NL.textColor = UIColor.rgb(18, green: 179, blue: 251)
        var font = UIFont(name: "JFFlat-Regular", size: 15)
        NL.font = font
        NL.text = NSLocalizedString("(IQD)", comment: "this is name")
        NL.translatesAutoresizingMaskIntoConstraints = false
        return NL
        
    }()
    //////////////
    let countLabe :UILabel = {
        let NL = UILabel()
        NL.textColor = UIColor.rgb(155, green: 155, blue: 155)
        var font = UIFont(name: "JFFlat-Regular", size: 15)
        NL.font = font
        NL.translatesAutoresizingMaskIntoConstraints = false
        NL.text = NSLocalizedString("12300", comment: "this is name")
        return NL
        
    }()
    let dollarText :UITextField = {
        let tf = UITextField()
        tf.textColor = UIColor.rgb(155, green: 155, blue: 155)
        tf.attributedPlaceholder = NSAttributedString(string:NSLocalizedString(" ", comment: "this is name"),
                                                      
                                                      attributes:[NSForegroundColorAttributeName: UIColor.rgb(155, green: 155, blue: 155)])
        var font = UIFont(name: "JFFlat-Regular", size: 12)
        tf.font = font
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor.white
        tf.textAlignment = .center
        tf.layer.cornerRadius = 10
        tf.layer.shadowColor = UIColor.black.cgColor
        tf.layer.shadowOffset = CGSize(width: -2, height: 3)
        tf.layer.shadowOpacity = 0.1
        tf.layer.shadowRadius = 10
        tf.layer.masksToBounds = false
        tf.clipsToBounds = false
        return tf
        
    }()
    
    
    let dinarText :UITextField = {
        let tf = UITextField()
        tf.textColor = UIColor.rgb(155, green: 155, blue: 155)
        tf.attributedPlaceholder = NSAttributedString(string:NSLocalizedString(" ", comment: "this is name"),
                                                      
                                                      attributes:[NSForegroundColorAttributeName: UIColor.rgb(155, green: 155, blue: 155)])
        var font = UIFont(name: "JFFlat-Regular", size: 12)
        tf.font = font
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor.white
        tf.layer.cornerRadius = 10
        tf.textAlignment = .center
        tf.layer.shadowColor = UIColor.black.cgColor
        tf.layer.shadowOffset = CGSize(width: -2, height: 3)
        tf.layer.shadowOpacity = 0.1
        tf.layer.shadowRadius = 10
        tf.layer.masksToBounds = false
        tf.clipsToBounds = false
        return tf
        
    }()
    
    let countButn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.setTitle(NSLocalizedString("احسب ", comment: "this is name"),for: .normal)
        button.addTarget(self, action: #selector(handleCal), for: .touchUpInside)
        button.setTitleColor(UIColor.rgb(18, green: 179, blue: 251), for: UIControlState.normal)  ///// how to give it black color and font
        button.layer.cornerRadius = 7
        button.layer.shadowOffset = CGSize(width: -2,height: 3)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.3
        button.layer.masksToBounds = false;
        button.clipsToBounds = false;
        return button
        
    }()

    
    
    @objc  func handleCal() {
        count()

    }

    func count()  {
        
        if dollarText.text?.isEmpty == false {
            dinarText.text = "\(Double(dollarText.text! )! * Double((id?.Cprice)!)!)"
        }else if dollarText.text?.isEmpty == false{
            
            dollarText.text = "\(Double(dinarText.text!)! / Double((headerData?.Cprice)!)!)"
        }
    }
}


