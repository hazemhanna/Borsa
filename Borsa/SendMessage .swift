//
//  SendMessage .swift
//  Borsa
//
//  Created by hazem on 6/25/18.
//  Copyright © 2018 hazem. All rights reserved.
//

import UIKit

class SendMessage  : UIViewController ,UITextViewDelegate{
    
    
    var textHeightConstraint: NSLayoutConstraint!
    
    let defualts = UserDefaults.standard

    override func viewDidLoad() {
        
      view.backgroundColor = UIColor.white //rgb(110, green: 110, blue: 110)
        navigationController?.navigationBar.barTintColor = UIColor.rgb(18, green: 179, blue: 251)
        navigationItem.title = "  ارسال رسالة"
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        /////// textField
        view.addSubview(nameText)
        nameText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        nameText.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
        nameText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        nameText.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(PhoneText)
        PhoneText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        PhoneText.topAnchor.constraint(equalTo: nameText.bottomAnchor, constant: 10).isActive = true
        PhoneText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        PhoneText.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        view.addSubview(HeadLineText)
        HeadLineText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        HeadLineText.topAnchor.constraint(equalTo: PhoneText.bottomAnchor, constant: 10).isActive = true
        HeadLineText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        HeadLineText.heightAnchor.constraint(equalToConstant: 50).isActive = true
      
        view.addSubview(message)
        message.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        message.topAnchor.constraint(equalTo: HeadLineText.bottomAnchor, constant: 10).isActive = true
        message.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        message.heightAnchor.constraint(equalTo:  view.heightAnchor, multiplier: 0.3).isActive = true
        self.textHeightConstraint = message.heightAnchor.constraint(equalToConstant: 60)
        self.textHeightConstraint.isActive = true
        
        message.delegate = self
        self.adjustTextViewHeight()
        
        
        view.addSubview(countButn)
        countButn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        countButn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        countButn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        countButn.heightAnchor.constraint(equalToConstant: 50).isActive = true
   
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(EndEDiting)))
        view.isUserInteractionEnabled = true
        
        
    }
    
    func EndEDiting(){
        
        view.endEditing(true)
    }
    
    let nameText :UITextField = {
        let tf = UITextField()
        tf.textColor = UIColor.rgb(155, green: 155, blue: 155)
        tf.attributedPlaceholder = NSAttributedString(string:NSLocalizedString("الاسم", comment: "this is name"),
                                                      
                                                      attributes:[NSForegroundColorAttributeName: UIColor.rgb(155, green: 155, blue: 155)])
        var font = UIFont(name: "JFFlat-Regular", size: 12)
        tf.font = font
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor.white
        tf.textAlignment = .center
        tf.layer.cornerRadius = 10
        tf.layer.borderColor = UIColor.black.cgColor
        tf.layer.borderWidth = 1
        return tf
        
    }()
    
    let PhoneText :UITextField = {
        let tf = UITextField()
        tf.textColor = UIColor.rgb(155, green: 155, blue: 155)
        tf.attributedPlaceholder = NSAttributedString(string:NSLocalizedString("التيلفون", comment: "this is name"),
                                                      
                                                      attributes:[NSForegroundColorAttributeName: UIColor.rgb(155, green: 155, blue: 155)])
        var font = UIFont(name: "JFFlat-Regular", size: 12)
        tf.font = font
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor.white
        tf.keyboardType = UIKeyboardType.numberPad
        tf.layer.cornerRadius = 10
        tf.textAlignment = .center
        tf.layer.borderColor = UIColor.black.cgColor
        tf.layer.borderWidth = 1
        return tf
        
    }()
    
    let HeadLineText :UITextField = {
        let tf = UITextField()
        tf.textColor = UIColor.rgb(155, green: 155, blue: 155)
        tf.attributedPlaceholder = NSAttributedString(string:NSLocalizedString("عنوان الرسالة", comment: "this is name"),
                                                      
                                                      attributes:[NSForegroundColorAttributeName: UIColor.rgb(155, green: 155, blue: 155)])
        var font = UIFont(name: "JFFlat-Regular", size: 12)
        tf.font = font
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor.white
        tf.layer.cornerRadius = 10
        tf.textAlignment = .center
        tf.layer.borderColor = UIColor.black.cgColor
        tf.layer.borderWidth = 1
        
        return tf
        
    }()
  
    let message :UITextView = {
        let NL = UITextView()
        NL.textColor = UIColor.rgb(155, green: 155, blue: 155)
        var font = UIFont(name: "JFFlat-Regular", size: 15)
        NL.font = font
        NL.translatesAutoresizingMaskIntoConstraints = false
        NL.text = NSLocalizedString("نص الرسالة", comment: "this is name")
        NL.layer.borderColor = UIColor.black.cgColor
        NL.layer.borderWidth = 1
        NL.textAlignment = .center
        NL.layer.cornerRadius = 7
        return NL
        
    }()
    
    ///////// clear uitextview when i write in it
    
    func textViewDidBeginEditing(_ textView: UITextView) {
     
            self.message.text = ""
        
    }
  
    /////////// tow function to make textview dynamic height
    
    func textViewDidChange(_ textView: UITextView) {
        self.adjustTextViewHeight()
    }
    
    func adjustTextViewHeight() {
        let fixedWidth = message.frame.size.width
        let newSize = message.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        self.textHeightConstraint.constant = newSize.height
        self.view.layoutIfNeeded()
    }
 
    let countButn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.rgb(18, green: 179, blue: 251)
        button.setTitle(NSLocalizedString("ارسال", comment: "this is name"),for: .normal)
        button.addTarget(self, action: #selector(SendMessage), for: .touchUpInside)
        button.setTitleColor(UIColor.white, for: UIControlState.normal)  ///// how to give it black color and font
        button.layer.cornerRadius = 10
        button.layer.shadowOffset = CGSize(width: -2,height: 3)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.3
        button.layer.masksToBounds = false;
        button.clipsToBounds = false;
        
        return button
        
    }()
    
    
    @objc  func handlePrev() {
    
    }

    func SendMessage (){
        
        if(defualts.value(forKey: "auth")) != nil {
        
        ApiService.SharedInstance.fetchFeedForInt(URL: "?k=\(UIDevice.current.identifierForVendor!.uuidString)&o=15&val=\(defualts.integer(forKey: "auth")),\(nameText.text!),\(PhoneText.text!),\(HeadLineText.text!),\(message.text!)") { (Data:Int) in
            
            if Data == 1 {
                
                //Create the pop-up alert body
                    let errorAlert = UIAlertController(title: "Oops!", message: " تم ارسسال الرسالة ", preferredStyle: .alert)
                
                    //Create the "Okay button"
                    let okayBtn = UIAlertAction(title: "Okay", style: .default, handler: { (action) in
                        //Dismiss the alert when the button is pressed
                        errorAlert.dismiss(animated: true, completion: nil)
                    })
                
                    //Add the "okay" button to the pop-up alert body
                    errorAlert.addAction(okayBtn)
                    
                    //Finally show the alert to the user
                    self.present(errorAlert, animated: true, completion: nil)
            
            }else {
            
            
                
                    //Create the pop-up alert body
                    let errorAlert = UIAlertController(title: "Oops!", message: "  خطآ في الارسال", preferredStyle: .alert)
                
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
        } else {
        
        
         ApiService.SharedInstance.fetchFeedForInt(URL: "?k=\(UIDevice.current.identifierForVendor!.uuidString)&o=15&val=\(defualts.integer(forKey: "auth")),\(nameText.text!),\(PhoneText.text!),\(HeadLineText.text!),\(message.text!),0") { (Data:Int) in
        
            
            if Data == 1 {
            
            
                    //Create the pop-up alert body
                    let errorAlert = UIAlertController(title: "Oops!", message: " تم ارسسال الرسالة ", preferredStyle: .alert)
                
                    //Create the "Okay button"
                    let okayBtn = UIAlertAction(title: "Okay", style: .default, handler: { (action) in
                        //Dismiss the alert when the button is pressed
                        errorAlert.dismiss(animated: true, completion: nil)
                    })
                
                    //Add the "okay" button to the pop-up alert body
                    errorAlert.addAction(okayBtn)
                    
                    //Finally show the alert to the user
                    self.present(errorAlert, animated: true, completion: nil)
            
            
             }else{
                
                
                
                    //Create the pop-up alert body
                    let errorAlert = UIAlertController(title: "Oops!", message: "  خطآ في الارسال", preferredStyle: .alert)
                
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
