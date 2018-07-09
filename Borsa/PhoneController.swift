//
//  PhoneController.swift
//  Borsa
//
//  Created by hazem on 7/3/18.
//  Copyright © 2018 hazem. All rights reserved.
//

import UIKit

class PhoneController : UIViewController {

    
    override func viewDidLoad() {
    
        view.backgroundColor = UIColor.white //rgb(110, green: 110, blue: 110)
        navigationController?.navigationBar.barTintColor = UIColor.rgb(18, green: 179, blue: 251)
        navigationItem.title = "مرحبا"
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        
        view.addSubview(phoneLabel)
        phoneLabel.topAnchor.constraint(equalTo: view.topAnchor,constant : 150).isActive = true
        phoneLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        phoneLabel.textAlignment = . center
        
        view.addSubview(phoneNumber)
        phoneNumber.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        phoneNumber.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor,constant : 20).isActive = true
        phoneNumber.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        phoneNumber.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        view.addSubview(checkBtn)
        checkBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        checkBtn.topAnchor.constraint(equalTo: phoneNumber.bottomAnchor,constant : 20).isActive = true
        checkBtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        checkBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true

        
        
    }
  
    
    let phoneLabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.rgb(18, green: 179, blue: 251)
        var font = UIFont(name: "JFFlat-Regular", size: 18)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString(" رقم الهاتف", comment: "this is name")
        return pl
    }()
    
    let phoneNumber :UITextField = {
        let tf = UITextField()
        tf.textColor = UIColor.rgb(155, green: 155, blue: 155)
        tf.attributedPlaceholder = NSAttributedString(string:NSLocalizedString(" ", comment: "this is name"),
                                                      
                                                      attributes:[NSForegroundColorAttributeName: UIColor.rgb(155, green: 155, blue: 155)])
        var font = UIFont(name: "JFFlat-Regular", size: 14)
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
        tf.layer.masksToBounds = false
        tf.clipsToBounds = false
        return tf
        
    }()
    
    let checkBtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.setTitle(NSLocalizedString(" check", comment: "this is name"),for: .normal)
        button.addTarget(self, action: #selector(chackForMobile), for: .touchUpInside)
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
    
    func chackForMobile (){
        
        
        if (phoneNumber.text?.isEmpty == true) {  print("error")  }
        
        else {
        
        ApiService.SharedInstance.fetchFeedForInt(URL: "?k=\(UIDevice.current.identifierForVendor!.uuidString)=&o=21&val=0,1,\(phoneNumber.text!)") { (Data:Int) in
            
            if (Data == 1) {
                
                let hospitalControll =  RegisterController()
                self.navigationController?.pushViewController(hospitalControll, animated: true)
        
            }else{
            
                //Create the pop-up alert body
                let errorAlert = UIAlertController(title: "Oops!", message: "الهاتف مستخدم من فضلك ادخل هاتف اخر ", preferredStyle: .alert)
                
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
