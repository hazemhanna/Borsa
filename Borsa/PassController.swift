//
//  PassController.swift
//  Borsa
//
//  Created by hazem on 6/30/18.
//  Copyright © 2018 hazem. All rights reserved.
//

import UIKit

class PassController : UIViewController {
    
    let defualts = UserDefaults.standard


    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.white //rgb(110, green: 110, blue: 110)
        navigationController?.navigationBar.barTintColor = UIColor.rgb(18, green: 179, blue: 251)
        navigationItem.title = "تغيير كلمة المرور"
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        view.addSubview(oldPass)
        oldPass.rightAnchor.constraint(equalTo:view.rightAnchor, constant: -10).isActive = true
        oldPass.topAnchor.constraint(equalTo: view.topAnchor,constant : 100).isActive = true
        oldPass.textAlignment = . right
        //////////////
        view.addSubview(newPass)
        newPass.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        newPass.topAnchor.constraint(equalTo: oldPass.bottomAnchor,constant : 50).isActive = true
        newPass.textAlignment = . right
        /////////////
        view.addSubview(confirmPass)
        confirmPass.rightAnchor.constraint(equalTo:view.rightAnchor, constant: -10).isActive = true
        confirmPass.topAnchor.constraint(equalTo: newPass.bottomAnchor,constant : 60).isActive = true
        confirmPass.textAlignment = . right
        //////////////
        view.addSubview(oldPassText)
        oldPassText.leftAnchor.constraint(equalTo:view.leftAnchor, constant:10).isActive = true
        oldPassText.topAnchor.constraint(equalTo: view.topAnchor,constant : 90).isActive = true
        oldPassText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        oldPassText.heightAnchor.constraint(equalToConstant: 40).isActive = true
        ///////
        view.addSubview(newPassText)
        newPassText.leftAnchor.constraint(equalTo:view.leftAnchor, constant:10).isActive = true
        newPassText.topAnchor.constraint(equalTo: oldPass.bottomAnchor,constant : 40).isActive = true
        newPassText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        newPassText.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //////////
        view.addSubview(confirmPassText)
        confirmPassText.leftAnchor.constraint(equalTo:view.leftAnchor, constant:10).isActive = true
        confirmPassText.topAnchor.constraint(equalTo: newPass.bottomAnchor,constant : 50).isActive = true
        confirmPassText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        confirmPassText.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //////////
        view.addSubview(saveButn)
        saveButn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButn.topAnchor.constraint(equalTo: confirmPassText.bottomAnchor,constant : 30).isActive = true
        saveButn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        saveButn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(EndEDiting)))
        view.isUserInteractionEnabled = true
        
    }
   
    
    func EndEDiting(){
        
        view.endEditing(true)
    }
    
    let oldPass :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.rgb(18, green: 179, blue: 251)
        var font = UIFont(name: "JFFlat-Regular", size: 14)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString(" كلمة المرور القديمة", comment: "this is name")
        return pl
        
    }()
    let newPass :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.rgb(18, green: 179, blue: 251)
        pl.translatesAutoresizingMaskIntoConstraints = false
        var font = UIFont(name: "JFFlat-Regular", size: 14)
        pl.font = font
        pl.text = NSLocalizedString("كلمة المرور الجديدة ", comment: "this is name")
        return pl
        
    }()
    
    let confirmPass :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.rgb(18, green: 179, blue: 251)
        var font = UIFont(name: "JFFlat-Regular", size: 14)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString(" تاكيد كلمة المرور", comment: "this is name")
        return pl
    }()

    let oldPassText :UITextField = {
        let tf = UITextField()
        tf.textColor = UIColor.rgb(155, green: 155, blue: 155)
        tf.attributedPlaceholder = NSAttributedString(string:NSLocalizedString("", comment: "this is name"),
                                                      
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
    
    let newPassText :UITextField = {
        let tf = UITextField()
        tf.textColor = UIColor.rgb(155, green: 155, blue: 155)
        tf.attributedPlaceholder = NSAttributedString(string:NSLocalizedString("", comment: "this is name"),
                                                      
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
    let confirmPassText :UITextField = {
        let tf = UITextField()
        tf.textColor = UIColor.rgb(155, green: 155, blue: 155)
        tf.attributedPlaceholder = NSAttributedString(string:NSLocalizedString("", comment: "this is name"),
                                                      
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
        button.setTitle(NSLocalizedString("حفظ المتغيرات ", comment: "this is name"),for: .normal)
        button.addTarget(self, action: #selector(changePass), for: .touchUpInside)
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
    
    @objc  func handlesave() {
        
        
        
    }
    
    func changePass (){
    
        
        let new = newPassText.text!
        let confirm = confirmPassText.text!
        
        if  new == confirm  {
            
            
            ApiService.SharedInstance.fetchFeedForInt(URL: "?k=\(UIDevice.current.identifierForVendor!.uuidString)&o=8&val=\(defualts.integer(forKey: "auth")),\(oldPassText.text!),\(newPassText.text!)") { (Data:Int) in

            print(Data)
                
                //Create the pop-up alert body
                let errorAlert = UIAlertController(title: "Oops!", message:  " \(self.newPassText.text!) تم تغيير كلمة المرور الي ", preferredStyle: .actionSheet)
                
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
            }else {
            
            //Create the pop-up alert body
            let errorAlert = UIAlertController(title: "Oops!", message:  "كلمة المرور غير متطابقة", preferredStyle: .alert)
            
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
