//
//  RegisterController.swift
//  Borsa
//
//  Created by hazem on 7/2/18.
//  Copyright © 2018 hazem. All rights reserved.
//


import UIKit
class RegisterController : UIViewController {

    
    
    override func viewDidLoad() {
        
        
        view.backgroundColor = UIColor.white //rgb(110, green: 110, blue: 110)
        navigationController?.navigationBar.barTintColor = UIColor.rgb(18, green: 179, blue: 251)
        navigationItem.title = "register"
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
  
        view.addSubview(nameLabel)
        nameLabel.rightAnchor.constraint(equalTo:view.rightAnchor, constant: -10).isActive = true
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor,constant : 150).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4).isActive = true
        nameLabel.textAlignment = . center

        view.addSubview(phoneNumber)
        phoneNumber.rightAnchor.constraint(equalTo:view.rightAnchor, constant: -10).isActive = true
        phoneNumber.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant : 40).isActive = true
        phoneNumber.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4).isActive = true
        phoneNumber.textAlignment = . center

        view.addSubview(addressLabel)
        addressLabel.rightAnchor.constraint(equalTo:view.rightAnchor, constant: -10).isActive = true
        addressLabel.topAnchor.constraint(equalTo: phoneNumber.bottomAnchor,constant : 40).isActive = true
        addressLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4).isActive = true
        addressLabel.textAlignment = . center
        
        view.addSubview(faxLabel)
        faxLabel.rightAnchor.constraint(equalTo:view.rightAnchor, constant: -10).isActive = true
        faxLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor,constant : 40).isActive = true
        faxLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4).isActive = true
        faxLabel.textAlignment = . center
 
        view.addSubview(passLabel)
        passLabel.rightAnchor.constraint(equalTo:view.rightAnchor, constant: -10).isActive = true
        passLabel.topAnchor.constraint(equalTo: faxLabel.bottomAnchor,constant : 40).isActive = true
        passLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4).isActive = true
        passLabel.textAlignment = . center
   
        view.addSubview(nameText)
        nameText.rightAnchor.constraint(equalTo:nameLabel.leftAnchor, constant: -10).isActive = true
        nameText.topAnchor.constraint(equalTo: view.topAnchor,constant : 140).isActive = true
        nameText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        nameText.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(changNumber)
        changNumber.rightAnchor.constraint(equalTo:phoneNumber.leftAnchor, constant: -10).isActive = true
        changNumber.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant : 30).isActive = true
        changNumber.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        changNumber.heightAnchor.constraint(equalToConstant: 50).isActive = true
      
        view.addSubview(addressText)
        addressText.rightAnchor.constraint(equalTo:addressLabel.leftAnchor, constant: -10).isActive = true
        addressText.topAnchor.constraint(equalTo: phoneNumber.bottomAnchor,constant : 30).isActive = true
        addressText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        addressText.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(emailText)
        emailText.rightAnchor.constraint(equalTo:faxLabel.leftAnchor, constant: -10).isActive = true
        emailText.topAnchor.constraint(equalTo: addressLabel.bottomAnchor,constant : 30).isActive = true
        emailText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        emailText.heightAnchor.constraint(equalToConstant: 40).isActive = true
  
        view.addSubview(passText)
        passText.rightAnchor.constraint(equalTo:addressLabel.leftAnchor, constant: -10).isActive = true
        passText.topAnchor.constraint(equalTo: faxLabel.bottomAnchor,constant : 30).isActive = true
        passText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        passText.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
       
        view.addSubview(saveButn)
        saveButn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -20).isActive = true
        saveButn.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant : -30).isActive = true
        saveButn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        saveButn.heightAnchor.constraint(equalToConstant: 50).isActive = true

        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(EndEDiting)))
        view.isUserInteractionEnabled = true
        
       
    }
   
    func EndEDiting(){
        
        view.endEditing(true)
    }
  
    let nameLabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.rgb(18, green: 179, blue: 251)
        var font = UIFont(name: "JFFlat-Regular", size: 18)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString(" الاسم", comment: "this is name")
        return pl
        
    }()

    let phoneNumber :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.rgb(18, green: 179, blue: 251)
        var font = UIFont(name: "JFFlat-Regular", size: 18)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString(" الهاتف ", comment: "this is name")
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

    let faxLabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.rgb(18, green: 179, blue: 251)
        var font = UIFont(name: "JFFlat-Regular", size: 18)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString(" الايميل", comment: "this is name")
        return pl
    }()
   
    let passLabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.rgb(18, green: 179, blue: 251)
        var font = UIFont(name: "JFFlat-Regular", size: 18)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString("كلمة المرور", comment: "this is name")
        return pl
    }()
   
    let changNumber :UITextField = {
        let tf = UITextField()
        tf.textColor = UIColor.rgb(155, green: 155, blue: 155)
        tf.attributedPlaceholder = NSAttributedString(string:NSLocalizedString(" ", comment: "this is name"),
                                                      
                                                      attributes:[NSForegroundColorAttributeName: UIColor.rgb(155, green: 155, blue: 155)])
        var font = UIFont(name: "JFFlat-Regular", size: 14)
        tf.font = font
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor.white
        tf.textAlignment = .center
        tf.layer.cornerRadius = 10
        tf.keyboardType = UIKeyboardType.numberPad
        tf.layer.shadowColor = UIColor.black.cgColor
        tf.layer.shadowOffset = CGSize(width: -2, height: 3)
        tf.layer.shadowOpacity = 0.1
        tf.layer.shadowRadius = 10
        tf.layer.masksToBounds = false
        tf.clipsToBounds = false
        return tf
        
    }()
    let nameText :UITextField = {
        let tf = UITextField()
        tf.textColor = UIColor.rgb(155, green: 155, blue: 155)
        tf.attributedPlaceholder = NSAttributedString(string:NSLocalizedString(" ", comment: "this is name"),
                                                      
                                                      attributes:[NSForegroundColorAttributeName: UIColor.rgb(155, green: 155, blue: 155)])
        var font = UIFont(name: "JFFlat-Regular", size: 14)
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
    
   
    let emailText :UITextField = {
        let tf = UITextField()
        tf.textColor = UIColor.rgb(155, green: 155, blue: 155)
        tf.attributedPlaceholder = NSAttributedString(string:NSLocalizedString(" ", comment: "this is name"),
                                                      
                                                      attributes:[NSForegroundColorAttributeName: UIColor.rgb(155, green: 155, blue: 155)])
        var font = UIFont(name: "JFFlat-Regular", size: 14)
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
    let addressText :UITextField = {
        let tf = UITextField()
        tf.textColor = UIColor.rgb(155, green: 155, blue: 155)
        tf.attributedPlaceholder = NSAttributedString(string:NSLocalizedString(" ", comment: "this is name"),
                                                      
                                                      attributes:[NSForegroundColorAttributeName: UIColor.rgb(155, green: 155, blue: 155)])
        var font = UIFont(name: "JFFlat-Regular", size: 14)
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
    let passText :UITextField = {
        let tf = UITextField()
        tf.textColor = UIColor.rgb(155, green: 155, blue: 155)
        tf.attributedPlaceholder = NSAttributedString(string:NSLocalizedString(" ", comment: "this is name"),
                                                      
                                                      attributes:[NSForegroundColorAttributeName: UIColor.rgb(155, green: 155, blue: 155)])
        var font = UIFont(name: "JFFlat-Regular", size: 14)
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
    let saveButn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.setTitle(NSLocalizedString(" Register", comment: "this is name"),for: .normal)
        button.addTarget(self, action: #selector(Register), for: .touchUpInside)
        button.setTitleColor(UIColor.rgb(18, green: 179, blue: 251), for: UIControlState.normal)  ///// how to give it black color and font
        button.layer.cornerRadius = 10
        button.layer.shadowOffset = CGSize(width: -2,height: 3)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.3
        button.layer.masksToBounds = false
        button.clipsToBounds = false
        return button
        
    }()
    
    @objc  func handlesavec() {
        
    }
    
    //////// register
    
    
    
    
    
    
   
    func Register ( ) {
    
//        let calendar = Calendar.current
//        let time = calendar.dateComponents([.hour,.minute,.second], from: Date())
//        let serial0 = time.hour
//        let serial1 = time.minute
//        let serial2 = time.second!
//        let serial = serial0! * serial2 * serial1!
//        print("\(time.hour!):\(time.minute!):\(time.second!)")
//
//        let deviceserial  = serial *  Int(changNumber.text!)!
//        print(deviceserial)
//
        
        
        if (changNumber.text?.isEmpty == true && nameText.text?.isEmpty == true && addressText.text?.isEmpty == true && emailText.text?.isEmpty == true && passText.text?.isEmpty == true )
        {
       
            
            
        }else {
        
        ApiService.SharedInstance.fetchFeedForInt(URL: "?k=\(UIDevice.current.identifierForVendor!.uuidString)&o=21&val=0,2,\(changNumber.text!),\(nameText.text!),1,1,\(addressText.text!),\(emailText.text!),\(passText.text!)") { (Data:Int) in
            
            
            
            if (Data != -1) {
                let layout = UICollectionViewFlowLayout()
                let hospitalControll =  LoginController()
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
