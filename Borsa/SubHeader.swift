
//
//  File.swift
//  Borsa
//
//  Created by hazem on 6/23/18.
//  Copyright © 2018 hazem. All rights reserved.
//

import UIKit


class SubHeader: BaseCell , UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    var data = [DollarModel]()
    var controller:AmericanDollar?
    
    
    var selectedDay : String?
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // data method to return the number of row shown in the picker.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        pickcerTF.text = "\(data[row].Cname!)"
        controller?.HeaderCurrency = data[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row].Cname
    }
    
    
    
    // delegate method called when the row was selected.
    
    
    override func setupViews() {
        
        backgroundColor = UIColor.white
        layer.cornerRadius = 3
        frame.size.width = 500
        
        
        addSubview(mainView)
        mainView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        mainView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        mainView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        mainView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        mainView.isUserInteractionEnabled = false
        //////// picertextfield
        
        addSubview(pickcerTF)
        pickcerTF.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -10).isActive = true
        pickcerTF.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        pickcerTF.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4).isActive = true
        pickcerTF.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        addSubview(searchBtn)
        searchBtn.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        searchBtn.topAnchor.constraint(equalTo: pickcerTF.bottomAnchor, constant: 10).isActive = true
        searchBtn.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2).isActive = true
        searchBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        searchBtn.isUserInteractionEnabled = true
        
        
        addSubview(search)
        search.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 15).isActive = true
        search.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        search.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.7).isActive = true
        search.heightAnchor.constraint(equalToConstant: 40).isActive = true
        search.isUserInteractionEnabled = true
        showPickerView ()
        donePicker()
        FetchData()
        
    }
    
    /////// picker view function
    
    func donePicker() {
        
        pickcerTF.resignFirstResponder()
        
    }
    
    func showPickerView (){
        
        let mypicker = UIPickerView()
        mypicker.delegate = self
        mypicker.dataSource = self
        pickcerTF.inputView = mypicker
        ////////////
        mypicker.showsSelectionIndicator = true
        mypicker.delegate = self
        mypicker.dataSource = self
        mypicker.backgroundColor = .white
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.rgb(18, green: 179, blue: 251)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(SubHeader.donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(SubHeader.donePicker))
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        
        pickcerTF.inputAccessoryView = toolBar
        
    }
    
    /////// pickerview text field
    let pickcerTF :UITextField = {
        let tf = UITextField()
        tf.textColor = UIColor.rgb(155, green: 155, blue: 155)
        var font = UIFont(name: "NotoKufiArabic-Bold", size: 14)
        tf.font = font
        tf.attributedPlaceholder = NSAttributedString(string:NSLocalizedString("الدولار الامريكي", comment: "this is name"),
                                                      
                                                      attributes:[NSForegroundColorAttributeName: UIColor.rgb(155, green: 155, blue: 155)])
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor.white
        tf.layer.cornerRadius = 7
        tf.textAlignment = .center
        return tf
        
    }()
    //////////////////
    
    let mainView  :UIView = {
        let uv = UIView()
        uv.backgroundColor = .white
        uv.layer.cornerRadius = 7
        uv.translatesAutoresizingMaskIntoConstraints = false
        //        uv.layer.borderColor = UIColor.black.cgColor
        //        uv.layer.borderWidth = 0.5
        uv.layer.shadowOffset = CGSize(width: -2,height: 3)
        uv.layer.shadowColor = UIColor.black.cgColor
        uv.layer.shadowRadius = 10
        uv.layer.shadowOpacity = 0.1
        uv.layer.masksToBounds = false;
        uv.clipsToBounds = false;
        
        return uv
        
    }()
    
    
    
    let cityLabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.rgb(101, green: 101, blue: 101)
        var font = UIFont(name: "NotoKufiArabic-Bold", size: 20)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString(" دولار امريكي ", comment: "this is name")
        pl.font = UIFont.boldSystemFont(ofSize: 18)
        return pl
        
    }()
    
    
    let search :UITextField = {
        let tf = UITextField()
        tf.textColor = UIColor.rgb(155, green: 155, blue: 155)
        tf.attributedPlaceholder = NSAttributedString(string:NSLocalizedString("بحث عن عملة ", comment: "this is name"),
                                                      
                                                      attributes:[NSForegroundColorAttributeName: UIColor.rgb(155, green: 155, blue: 155)])
        var font = UIFont(name: "NotoKufiArabic-Bold", size: 12)
        tf.font = font
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor.white
        tf.layer.cornerRadius = 7
        tf.textAlignment = .center
        tf.layer.borderColor = UIColor.rgb(18, green: 179, blue: 251).cgColor
        tf.layer.borderWidth = 1
        return tf
        
    }()
    
    
    
    lazy var searchBtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.rgb(18, green: 179, blue: 251)
        button.setTitle(NSLocalizedString("ابحث", comment: "this is name"),for: .normal)
        
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
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
        
        controller?.search(name: search.text!)
        
    }
    
    
    func FetchData()  {
        ApiService.SharedInstance.fetchFeedForUrl(URL: "?k=kjhkjhkj&o=13") { (Data:[[String:Any]]) in
            for arr in Data as! [[String:Any]] {
                let newProduct = DollarModel(dictionary: arr as! [String:Any] )
                self.data.append(newProduct)
            }
        }
    }
}

