//
//  LoginController.swift
//  Borsa
//
//  Created by hazem on 6/26/18.
//  Copyright © 2018 hazem. All rights reserved.
//


import UIKit

class LoginController  : UIViewController {
    
    var call : RegisterController?
    
  
    let defualts = UserDefaults.standard
    
   
    var textHeightConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        
        view.backgroundColor = UIColor.white //rgb(110, green: 110, blue: 110)
        navigationController?.navigationBar.barTintColor = UIColor.rgb(18, green: 179, blue: 251)
        navigationItem.title = "welcome"
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
  
        ///////// view
        view.addSubview(NameView)
        NameView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        NameView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        NameView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        NameView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        ////// view
        view.addSubview(passView)
        passView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passView.topAnchor.constraint(equalTo: NameView.bottomAnchor, constant: 10).isActive = true
        passView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        passView.heightAnchor.constraint(equalToConstant: 70).isActive = true

        ///// phone image
        NameView.addSubview(phoneImage)
        phoneImage.rightAnchor.constraint(equalTo: NameView.rightAnchor,constant : -10).isActive = true
        phoneImage.centerYAnchor.constraint(equalTo: NameView.centerYAnchor).isActive = true
        phoneImage.widthAnchor.constraint(equalTo: NameView.widthAnchor, multiplier: 0.15).isActive = true
        phoneImage.heightAnchor.constraint(equalTo: phoneImage.widthAnchor).isActive = true
        ///////// line
        NameView.addSubview(lineView)
        lineView.rightAnchor.constraint(equalTo: phoneImage.leftAnchor,constant : -20).isActive = true
        lineView.centerYAnchor.constraint(equalTo: NameView.centerYAnchor).isActive = true
        lineView.heightAnchor.constraint(equalTo: NameView.heightAnchor, multiplier: 0.5).isActive = true
        lineView.widthAnchor.constraint(equalToConstant: 1).isActive = true
        ///// lock image
        passView.addSubview(passmage)
        passmage.rightAnchor.constraint(equalTo: passView.rightAnchor,constant : -10).isActive = true
        passmage.centerYAnchor.constraint(equalTo: passView.centerYAnchor).isActive = true
        passmage.widthAnchor.constraint(equalTo: passView.widthAnchor, multiplier: 0.15).isActive = true
        passmage.heightAnchor.constraint(equalTo: passmage.widthAnchor).isActive = true
        ////////// line
        passView.addSubview(line2View)
        line2View.rightAnchor.constraint(equalTo: passmage.leftAnchor,constant : -20).isActive = true
        line2View.centerYAnchor.constraint(equalTo: passView.centerYAnchor).isActive = true
        line2View.heightAnchor.constraint(equalTo: passView.heightAnchor, multiplier: 0.5).isActive = true
        line2View.widthAnchor.constraint(equalToConstant: 1).isActive = true
        //////////// phone textfield
        NameView.addSubview(nameText)
        nameText.leftAnchor.constraint(equalTo: NameView.leftAnchor).isActive = true
        nameText.centerYAnchor.constraint(equalTo: NameView.centerYAnchor).isActive = true
        nameText.widthAnchor.constraint(equalTo: NameView.widthAnchor, multiplier: 0.7).isActive = true
        nameText.heightAnchor.constraint(equalToConstant: 70).isActive = true
        ////// pass tf
        passView.addSubview(PassText)
        PassText.leftAnchor.constraint(equalTo: passView.leftAnchor).isActive = true
        PassText.centerYAnchor.constraint(equalTo: passView.centerYAnchor).isActive = true
        PassText.widthAnchor.constraint(equalTo: passView.widthAnchor, multiplier: 0.7).isActive = true
        PassText.heightAnchor.constraint(equalToConstant: 70).isActive = true
        ///////////// label
        view.addSubview(messageLabe)
        messageLabe.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        messageLabe.topAnchor.constraint(equalTo: passView.bottomAnchor, constant: 20).isActive = true
        /////// label
        view.addSubview(registerLabe)
        registerLabe.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerLabe.topAnchor.constraint(equalTo: messageLabe.bottomAnchor, constant: 20).isActive = true
        /////////////// login button
        view.addSubview(countButn)
        countButn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        countButn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        countButn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        countButn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
        messageLabe.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(SwtichToMessagePAge)))
        messageLabe.isUserInteractionEnabled = true
    
        registerLabe.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(SwtichToRegisterPage)))
        registerLabe.isUserInteractionEnabled = true
        
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(EndEDiting)))
        view.isUserInteractionEnabled = true
        
        
    }
    
    func EndEDiting(){
        
        view.endEditing(true)
    }
    
    /////////  switch controller to send Message page
    
    func SwtichToMessagePAge(){
        let hospitalControll = SendMessage()
        self.navigationController?.pushViewController(hospitalControll, animated: true)
    
    
    
    }
    func SwtichToRegisterPage(){
        let hospitalControll = PhoneController()
        self.navigationController?.pushViewController(hospitalControll, animated: true)
    }
    
    let NameView :UIView = {
        let tf = UIView()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor.white
        tf.layer.cornerRadius = 10
        tf.layer.shadowColor = UIColor.black.cgColor
        tf.layer.shadowOffset = CGSize(width: -2, height: 3)
        tf.layer.shadowOpacity = 0.1
        tf.layer.shadowRadius = 10
        tf.layer.masksToBounds = false
        tf.clipsToBounds = false
        return tf
    }()
    let passView :UIView = {
        let tf = UIView()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor.white
        tf.layer.cornerRadius = 10
        tf.layer.shadowColor = UIColor.black.cgColor
        tf.layer.shadowOffset = CGSize(width: -2, height: 3)
        tf.layer.shadowOpacity = 0.1
        tf.layer.shadowRadius = 10
        tf.layer.masksToBounds = false
        tf.clipsToBounds = false
        return tf
    }()
    let lineView :UIView = {
        let tf = UIView()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor.lightGray
        return tf
    }()
    let line2View :UIView = {
        let tf = UIView()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor.lightGray
        return tf
    }()
    
    let nameText :UITextField = {
        let tf = UITextField()
        tf.textColor = UIColor.rgb(155, green: 155, blue: 155)
        tf.attributedPlaceholder = NSAttributedString(string:NSLocalizedString("رقم الهاتف", comment: "this is name"),
                                                      
                                                      attributes:[NSForegroundColorAttributeName: UIColor.rgb(155, green: 155, blue: 155)])
        tf.font = UIFont.boldSystemFont(ofSize: 15)
        tf.keyboardType = UIKeyboardType.numberPad
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor.white
        tf.textAlignment = .center
        tf.layer.cornerRadius = 10
        return tf
        
    }()
    
    let PassText :UITextField = {
        let tf = UITextField()
        tf.textColor = UIColor.rgb(155, green: 155, blue: 155)
        tf.attributedPlaceholder = NSAttributedString(string:NSLocalizedString("كلمة المرور", comment: "this is name"),
                                                      
                                                      attributes:[NSForegroundColorAttributeName: UIColor.rgb(155, green: 155, blue: 155)])
        tf.font = UIFont.boldSystemFont(ofSize: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor.white
        tf.layer.cornerRadius = 10
        tf.textAlignment = .center
        return tf
        
    }()
    
    
    
    
    let messageLabe :UILabel = {
        let NL = UILabel()
        NL.textColor = UIColor.rgb(18, green: 179, blue: 251)
        var font = UIFont(name: "JFFlat-Regular", size: 14)
        NL.font = font
        NL.translatesAutoresizingMaskIntoConstraints = false
        NL.text = NSLocalizedString("رسالة الي  ادارة التطبيق", comment: "this is name")
      
        return NL
        
    }()
    
    let registerLabe :UILabel = {
        let NL = UILabel()
        NL.textColor = UIColor.rgb(18, green: 179, blue: 251)
        var font = UIFont(name: "JFFlat-Regular", size: 14)
        NL.font = font
        NL.translatesAutoresizingMaskIntoConstraints = false
        NL.text = NSLocalizedString(" التسجيل  ", comment: "this is name")
        
        return NL
        
    }()

    let phoneImage:UIImageView = {
        let ci = UIImageView(image:#imageLiteral(resourceName: "mobile-phone (1)"))
        ci.translatesAutoresizingMaskIntoConstraints = false
        return ci
        
    }()
    
    let passmage:UIImageView = {
        let ci = UIImageView(image:#imageLiteral(resourceName: "lock"))
        ci.translatesAutoresizingMaskIntoConstraints = false
        return ci
        
    }()

    let countButn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.rgb(18, green: 179, blue: 251)
        button.setTitle(NSLocalizedString("دخول", comment: "this is name"),for: .normal)
        
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        button.setTitleColor(UIColor.white, for: UIControlState.normal)  ///// how to give it black color and font
        button.layer.cornerRadius = 10
        button.layer.shadowOffset = CGSize(width: -2,height: 3)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.3
        button.layer.masksToBounds = false
        button.clipsToBounds = false
        return button
        
    }()
    
    @objc  func handlePrev() {
        
   
    
    }
    
    func login (){
    
        
        if (nameText.text?.isEmpty == true || (PassText.text?.isEmpty)! == true) {
        
        print("error")
        
        } else{
        
         ApiService.SharedInstance.fetchFeedForInt(URL: "?k=\(UIDevice.current.identifierForVendor!.uuidString)&o=1&val=0,\(nameText.text!),\(PassText.text!)") { (Data:Int) in

            print(Data)
            

            let defualts = UserDefaults.standard
            defualts.setValue(Data, forKey: "auth")
        
            
            if (Data != 0) {
                
                let layout = UICollectionViewFlowLayout()
                let hospitalControll =  MainController(collectionViewLayout:layout)
                self.navigationController?.pushViewController(hospitalControll, animated: true)
                
            }
                
                
            else{
                
                //Create the pop-up alert body
                let errorAlert = UIAlertController(title: "Oops!", message: "خطا في البيانات حاول مرة اخري  ", preferredStyle: .alert)
                
                //Create the "Okay button"
                let okayBtn = UIAlertAction(title: "Okay", style: .default, handler: { (action) in
                    //Dismiss the alert when the button is pressed
                    errorAlert.dismiss(animated: true, completion: nil)
                })
                
                //Add the "okay" button to the pop-up alert body
                errorAlert.addAction(okayBtn)
                
                //Finally show the alert to the user
                self.present(errorAlert, animated: true, completion: nil)
                
                
              }
            }
        }
    }
}


