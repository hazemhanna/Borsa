//
//  ArrowDetails.swift
//  Borsa
//
//  Created by hazem on 6/12/18.
//  Copyright © 2018 hazem. All rights reserved.
//

import UIKit

class CalculateController : UIViewController ,UITextFieldDelegate {

   
    var array:SubCateguaryModel?
   
    override func viewDidLoad() {
        
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.rgb(18, green: 179, blue: 251)
        navigationItem.title = " بورصة اربيل "
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]

    
        view.addSubview(mainView)
        mainView.topAnchor.constraint(equalTo: view.topAnchor,constant : 100).isActive = true
        mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6).isActive = true
        //////// switch demo
        mainView.addSubview(switchDemo)
        switchDemo.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 20).isActive = true
        switchDemo.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10).isActive = true
        
        ////////////// show label
        mainView.addSubview(showLabel)
        showLabel.leftAnchor.constraint(equalTo: switchDemo.rightAnchor, constant: 20).isActive = true
        showLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20).isActive = true
        ///////
        mainView.addSubview(typeLabe)
        typeLabe.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -10).isActive = true
        typeLabe.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20).isActive = true
    
        
        mainView.addSubview(dTypeLabe)
        dTypeLabe.rightAnchor.constraint(equalTo: typeLabe.leftAnchor, constant: -10).isActive = true
        dTypeLabe.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20).isActive = true
        
        mainView.addSubview(priceLabe)
        priceLabe.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -10).isActive = true
        priceLabe.topAnchor.constraint(equalTo: showLabel.bottomAnchor, constant: 30).isActive = true
        
        mainView.addSubview(dpriceLabe)
        dpriceLabe.rightAnchor.constraint(equalTo: priceLabe.leftAnchor, constant: -10).isActive = true
        dpriceLabe.topAnchor.constraint(equalTo: showLabel.bottomAnchor, constant: 30).isActive = true
        ////////
        mainView.addSubview(countLabe)
        countLabe.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -10).isActive = true
        countLabe.topAnchor.constraint(equalTo: priceLabe.bottomAnchor, constant: 40).isActive = true
        //////////
        mainView.addSubview(dinarLabe)
        dinarLabe.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -10).isActive = true
        dinarLabe.topAnchor.constraint(equalTo: countLabe.bottomAnchor, constant: 65).isActive = true
       ///////////
        mainView.addSubview(USDLabe)
        USDLabe.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -10).isActive = true
        USDLabe.topAnchor.constraint(equalTo: dinarLabe.bottomAnchor, constant: 75).isActive = true
        
        
        /////// textField
        mainView.addSubview(countText)
        countText.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 10).isActive = true
        countText.topAnchor.constraint(equalTo: priceLabe.bottomAnchor, constant: 30).isActive = true
        countText.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.4).isActive = true
        countText.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        ////////
        mainView.addSubview(dinarText)
        dinarText.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 10).isActive = true
        dinarText.topAnchor.constraint(equalTo: countText.bottomAnchor, constant: 40).isActive = true
        dinarText.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.4).isActive = true
        dinarText.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        ////////////////
        mainView.addSubview(USDText)
        USDText.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 10).isActive = true
        USDText.topAnchor.constraint(equalTo: dinarText.bottomAnchor, constant: 50).isActive = true
        USDText.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.4).isActive = true
        USDText.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        mainView.addSubview(countButn)
        countButn.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        countButn.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -10).isActive = true
        countButn.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.4).isActive = true
        countButn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(EndEDiting)))
         view.isUserInteractionEnabled = true
        
        fetchData()
    }
    func EndEDiting(){
        
        view.endEditing(true)
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
    let showLabel :UILabel = {
        let NL = UILabel()
        NL.textColor = UIColor.rgb(155, green: 155, blue: 155)
        var font = UIFont(name: "JFFlat-Regular", size: 15)
        NL.font = font
        NL.translatesAutoresizingMaskIntoConstraints = false
        NL.text = NSLocalizedString("عرض", comment: "this is name")
        return NL
    }()
    let orderLabel :UILabel = {
        let NL = UILabel()
        NL.textColor = UIColor.rgb(155, green: 155, blue: 155)
        var font = UIFont(name: "JFFlat-Regular", size: 15)
        NL.font = font
        NL.translatesAutoresizingMaskIntoConstraints = false
        NL.text = NSLocalizedString("طلب", comment: "this is name")
        return NL
    }()
    ////////////////// on and of button
    let switchDemo : UISwitch = {
    let Demo = UISwitch()
        Demo.isOn = false
        Demo.setOn(false, animated: false)
        Demo.addTarget(self, action: #selector(switchValueDidChange), for: .touchUpInside)
        Demo.translatesAutoresizingMaskIntoConstraints = false
        return Demo
    }()
      @objc func switchValueDidChange(sender:UISwitch!)
    {
        if (sender.isOn == true){
            showLabel.text = "طلب"
            dpriceLabe.text = array!.Sprice!
        }
        else{
           showLabel.text = "عرض"
          dpriceLabe.text = array!.Bprice!
        }
    }
    let typeLabe :UILabel = {
        let NL = UILabel()
        NL.textColor = UIColor.rgb(18, green: 179, blue: 251)
        var font = UIFont(name: "JFFlat-Regular", size: 15)
        NL.font = font
        NL.translatesAutoresizingMaskIntoConstraints = false
        NL.text = NSLocalizedString("الفية:", comment: "this is name")
        return NL
    }()
    ///////// dynamic type
    let dTypeLabe :UILabel = {
        let NL = UILabel()
        NL.textColor = UIColor.rgb(155, green: 155, blue: 155)
        var font = UIFont(name: "JFFlat-Regular", size: 15)
        NL.font = font
        NL.translatesAutoresizingMaskIntoConstraints = false
        NL.text = NSLocalizedString("خشن", comment: "this is name")
        return NL
    }()
    let priceLabe :UILabel = {
        let NL = UILabel()
        NL.textColor = UIColor.rgb(18, green: 179, blue: 251)
        var font = UIFont(name: "JFFlat-Regular", size: 15)
        NL.font = font
        NL.translatesAutoresizingMaskIntoConstraints = false
        NL.text = NSLocalizedString("سعر الصرف:", comment: "this is name")
        return NL
    }()
    ///////// Dynamic price
    let dpriceLabe :UILabel = {
        let NL = UILabel()
        NL.textColor = UIColor.rgb(155, green: 155, blue: 155)
        var font = UIFont(name: "JFFlat-Regular", size: 15)
        NL.font = font
        NL.translatesAutoresizingMaskIntoConstraints = false
        return NL
        
    }()
    //////////////
    let countLabe :UILabel = {
        let NL = UILabel()
        NL.textColor = UIColor.rgb(18, green: 179, blue: 251)
        var font = UIFont(name: "JFFlat-Regular", size: 15)
        NL.font = font
        NL.translatesAutoresizingMaskIntoConstraints = false
        NL.text = NSLocalizedString("العدد", comment: "this is name")
        return NL
    }()
    let dinarLabe :UILabel = {
        let NL = UILabel()
        NL.textColor = UIColor.rgb(18, green: 179, blue: 251)
        var font = UIFont(name: "JFFlat-Regular", size: 15)
        NL.font = font
        NL.translatesAutoresizingMaskIntoConstraints = false
        NL.text = NSLocalizedString("دينار عراقي", comment: "this is name")
        return NL
    }()
    let USDLabe :UILabel = {
        let NL = UILabel()
        NL.textColor = UIColor.rgb(18, green: 179, blue: 251)
        var font = UIFont(name: "JFFlat-Regular", size: 15)
        NL.font = font
        NL.translatesAutoresizingMaskIntoConstraints = false
        NL.text = NSLocalizedString("USD", comment: "this is name")
        return NL
    }()
    lazy var countText :UITextField = {
        let tf = UITextField()
        tf.textColor = UIColor.rgb(155, green: 155, blue: 155)
        tf.attributedPlaceholder = NSAttributedString(string:NSLocalizedString("00.00", comment: "this is name"),
                                                      
                                                      attributes:[NSForegroundColorAttributeName: UIColor.rgb(155, green: 155, blue: 155)])
        var font = UIFont(name: "JFFlat-Regular", size: 12)
        tf.font = font
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor.white
        tf.textAlignment = .center
        tf.keyboardType = UIKeyboardType.numberPad
        tf.layer.cornerRadius = 10
        tf.layer.shadowColor = UIColor.black.cgColor
        tf.layer.shadowOffset = CGSize(width: -2, height: 3)
        tf.layer.shadowOpacity = 0.1
        tf.layer.shadowRadius = 10
        tf.delegate = self
        tf.layer.masksToBounds = false
        tf.clipsToBounds = false
        return tf
    }()
        lazy var dinarText :UITextField = {
        let tf = UITextField()
        tf.textColor = UIColor.rgb(155, green: 155, blue: 155)
        tf.attributedPlaceholder = NSAttributedString(string:NSLocalizedString("00.00", comment: "this is name"),
                                                      
                                                      attributes:[NSForegroundColorAttributeName: UIColor.rgb(155, green: 155, blue: 155)])
        var font = UIFont(name: "JFFlat-Regular", size: 12)
        tf.font = font
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor.white
        tf.layer.cornerRadius = 10
        tf.textAlignment = .center
        tf.keyboardType = UIKeyboardType.numberPad
        tf.layer.shadowColor = UIColor.black.cgColor
        tf.layer.shadowOffset = CGSize(width: -2, height: 3)
        tf.layer.shadowOpacity = 0.1
        tf.layer.shadowRadius = 10
         tf.delegate = self
        tf.layer.masksToBounds = false
        tf.clipsToBounds = false
        return tf
    }()
     lazy var USDText :UITextField = {
        let tf = UITextField()
        tf.textColor = UIColor.rgb(155, green: 155, blue: 155)
        tf.attributedPlaceholder = NSAttributedString(string:NSLocalizedString("00.00", comment: "this is name"),
                                                      
                                                      attributes:[NSForegroundColorAttributeName: UIColor.rgb(155, green: 155, blue: 155)])
        var font = UIFont(name: "JFFlat-Regular", size: 12)
        tf.font = font
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor.white
        tf.layer.cornerRadius = 10
        tf.textAlignment = .center
        tf.keyboardType = UIKeyboardType.numberPad
        tf.layer.shadowColor = UIColor.black.cgColor
        tf.layer.shadowOffset = CGSize(width: -2, height: 3)
        tf.layer.shadowOpacity = 0.1
        tf.layer.shadowRadius = 10
        tf.delegate = self

        tf.layer.masksToBounds = false
        tf.clipsToBounds = false
        return tf
        
    }()
    let countButn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.rgb(18, green: 179, blue: 251)
        button.setTitle(NSLocalizedString("احسب ", comment: "this is name"),for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        button.setTitleColor(UIColor.white, for: UIControlState.normal)  ///// how to give it black color and font
        button.layer.cornerRadius = 7
        button.layer.shadowOffset = CGSize(width: -2,height: 3)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 10
        var font = UIFont(name: "JFFlat-Regular", size: 14)
        button.titleLabel?.font = font
        button.layer.shadowOpacity = 0.3
        button.layer.masksToBounds = false;
        button.clipsToBounds = false;
        return button
    }()
    @objc  func handlePrev() {
        
      calculator()
    }
    
    ///////// fetch dynamic price
    
       func fetchData(){
        dpriceLabe.text  = array?.Bprice
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField.text != nil {
            dinarText.text = ""
            USDText.text = ""
            countText.text = ""
            
        }
        
        return true
    }
    ///////// fuction that make  calculator
    func calculator(){
      
        if countText.text?.isEmpty == false {
        dinarText.text = "\(Double(countText.text!)! * Double(array!.Sqty!)!)"
        USDText.text = "\(Double(Double(dinarText.text!)! / Double(( dpriceLabe.text!))!).roundTo(places: 2))"
        }else if USDText.text?.isEmpty == false {
        dinarText.text = "\(Double(USDText.text!)! * Double((array!.Bprice)!)!)"
            countText.text = "\(Double(Double(dinarText.text!)! / Double((array!.Sqty)!)!).roundTo(places: 2))"
        }else if dinarText.text?.isEmpty == false {
         countText.text = "\(Double(Double(dinarText.text!)! / Double((array!.Sqty)!)!).roundTo(places: 2))"
         USDText.text = "\(Double(Double(dinarText.text!)! / Double(( dpriceLabe.text)!)!).roundTo(places: 2))"
        }
    }
}
