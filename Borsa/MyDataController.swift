//
//  MyDataController.swift
//  Borsa
//
//  Created by hazem on 6/30/18.
//  Copyright © 2018 hazem. All rights reserved.
//


import UIKit

class MyDataController : UIViewController , UIPickerViewDataSource , UIPickerViewDelegate{
    
    let defualts = UserDefaults.standard

    var cities = [CitiesModel]()
    var borsa  = [MainModel]()
    var data = [MyDataModel]()
    var hazem : MyDataModel?
    var cityId : String?
    var borsaId :String?
    
    
    var days = ["sat","sun","mon","Tus","tus","wens","thara","fri"]
    var days1 = ["sat","sun","mon","Tus","tus","wens","thara","fri"]
    var selectedDay : String?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // data method to return the number of row shown in the picker.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 1 {
            
            return cities.count
            
        }else if  pickerView.tag == 2 {
            return borsa.count
            
        }
        return 1
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            
            cityText.text = "\(cities[row].CtyName!)"
            cityId = cities[row].Cityid
        
        }else if  pickerView.tag == 2 {
            borsaText.text = "\(borsa[row].Bname!)"
             borsaId = borsa[row].Bid
        }
    
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return cities[row].CtyName!

            
        }else
            if pickerView.tag == 2 {
                return borsa[row].Bname!

            }else {
                
                return nil
        }
   
    }
    
    
    
    
    
    let mypicker = UIPickerView()
    let mypicker2 = UIPickerView()

    func donePicker() {
        
        cityText.resignFirstResponder()
        borsaText.resignFirstResponder()
        
        
    }
    
    
    
    func showPickerView (){
        
        cityText.inputView = mypicker
        borsaText.inputView = mypicker2
        ////////////
        mypicker.showsSelectionIndicator = true
        
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
        
        borsaText.inputAccessoryView = toolBar
        cityText.inputAccessoryView = toolBar
        
    }
    
   
    
    override func viewDidLoad() {

        
        mypicker.delegate = self
        mypicker.dataSource = self
        mypicker.tag = 1
        
        
        mypicker2.delegate = self
        mypicker2.dataSource = self
        mypicker2.tag = 2
        
        showPickerView ()
        donePicker()
        
        view.backgroundColor = UIColor.white //rgb(110, green: 110, blue: 110)
        navigationController?.navigationBar.barTintColor = UIColor.rgb(18, green: 179, blue: 251)
        navigationItem.title = "بياناتي"
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        
        
        view.addSubview(nameLabel)
        nameLabel.rightAnchor.constraint(equalTo:view.rightAnchor, constant: -10).isActive = true
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor,constant : 100).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4).isActive = true
        
        nameLabel.textAlignment = . center
        
        view.addSubview(numberBtn)
        numberBtn.rightAnchor.constraint(equalTo:view.rightAnchor, constant: -10).isActive = true
        numberBtn.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant : 60).isActive = true
        numberBtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4).isActive = true
        numberBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
     
        view.addSubview(changNumber)
        changNumber.rightAnchor.constraint(equalTo:numberBtn.leftAnchor, constant: -10).isActive = true
        changNumber.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant : 50).isActive = true
        changNumber.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        changNumber.heightAnchor.constraint(equalToConstant: 50).isActive = true

        view.addSubview(cityLabel)
        cityLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        cityLabel.topAnchor.constraint(equalTo: changNumber.bottomAnchor,constant : 50).isActive = true
        cityLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4).isActive = true
        cityLabel.textAlignment = . center
    
        view.addSubview(borsaLabel)
        borsaLabel.rightAnchor.constraint(equalTo:view.rightAnchor, constant: -10).isActive = true
        borsaLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor,constant : 60).isActive = true
        borsaLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4).isActive = true
        borsaLabel.textAlignment = . center
        
        view.addSubview(faxLabel)
        faxLabel.rightAnchor.constraint(equalTo:view.rightAnchor, constant: -10).isActive = true
        faxLabel.topAnchor.constraint(equalTo: borsaLabel.bottomAnchor,constant : 60).isActive = true
        faxLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4).isActive = true
        faxLabel.textAlignment = . center
        
        view.addSubview(addressLabel)
        addressLabel.rightAnchor.constraint(equalTo:view.rightAnchor, constant: -10).isActive = true
        addressLabel.topAnchor.constraint(equalTo: faxLabel.bottomAnchor,constant : 60).isActive = true
        addressLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4).isActive = true
        addressLabel.textAlignment = . center
        
        view.addSubview(nameText)
        nameText.rightAnchor.constraint(equalTo:nameLabel.leftAnchor, constant: -10).isActive = true
        nameText.topAnchor.constraint(equalTo: view.topAnchor,constant : 90).isActive = true
        nameText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        nameText.heightAnchor.constraint(equalToConstant: 40).isActive = true
        ///////
        view.addSubview(cityText)
        cityText.rightAnchor.constraint(equalTo:cityLabel.leftAnchor, constant: -10).isActive = true
        cityText.topAnchor.constraint(equalTo: changNumber.bottomAnchor,constant : 40).isActive = true
        cityText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        cityText.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //////////
        
        view.addSubview(borsaText)
        borsaText.rightAnchor.constraint(equalTo:borsaLabel.leftAnchor, constant: -10).isActive = true
        borsaText.topAnchor.constraint(equalTo: cityLabel.bottomAnchor,constant : 50).isActive = true
        borsaText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        borsaText.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(emailText)
        emailText.rightAnchor.constraint(equalTo:faxLabel.leftAnchor, constant: -10).isActive = true
        emailText.topAnchor.constraint(equalTo: borsaLabel.bottomAnchor,constant : 50).isActive = true
        emailText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        emailText.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        view.addSubview(addressText)
        addressText.rightAnchor.constraint(equalTo:addressLabel.leftAnchor, constant: -10).isActive = true
        addressText.topAnchor.constraint(equalTo: faxLabel.bottomAnchor,constant : 50).isActive = true
        addressText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        addressText.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
        view.addSubview(canceltButn)
        canceltButn.rightAnchor.constraint(equalTo:view.rightAnchor, constant: -10).isActive = true
        canceltButn.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant : -30).isActive = true
        canceltButn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4).isActive = true
        canceltButn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(saveButn)
        saveButn.rightAnchor.constraint(equalTo:canceltButn.leftAnchor, constant: -20).isActive = true
        saveButn.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant : -30).isActive = true
        saveButn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        saveButn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
      
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(EndEDiting)))
        view.isUserInteractionEnabled = true
        
        
        fetcityName ()
        fetchData()
        fetchBorsaName()
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
    let cityLabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.rgb(18, green: 179, blue: 251)
        var font = UIFont(name: "JFFlat-Regular", size: 18)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString("المحافظة", comment: "this is name")
        return pl
        
    }()
    
    let borsaLabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.rgb(18, green: 179, blue: 251)
        var font = UIFont(name: "JFFlat-Regular", size: 18)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString(" البورصة", comment: "this is name")
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
    
    let addressLabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.rgb(18, green: 179, blue: 251)
        var font = UIFont(name: "JFFlat-Regular", size: 18)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString(" العنوان ", comment: "this is name")
        return pl
    }()
    
    let numberBtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.setTitle(NSLocalizedString(" تغيير الرقم ", comment: "this is name"),for: .normal)
        button.addTarget(self, action: #selector(changemobile), for: .touchUpInside)
        button.setTitleColor(UIColor.rgb(18, green: 179, blue: 251), for: UIControlState.normal)  ///// how to give it black color and font
        button.layer.cornerRadius = 10
        return button
        
        
    }()
    
    @objc  func handlesave() {
        
    }
    
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
    
    
    let cityText :UITextField = {
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
    let borsaText :UITextField = {
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
    
    let canceltButn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.setTitle(NSLocalizedString(" cancel", comment: "this is name"),for: .normal)
        button.addTarget(self, action: #selector(handlecancel), for: .touchUpInside)
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
    
    @objc  func handlecancel() {
        
        
        
    }
    let saveButn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.setTitle(NSLocalizedString("حفظ المتغيرات ", comment: "this is name"),for: .normal)
        button.addTarget(self, action: #selector(changeData), for: .touchUpInside)
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
  
    //////// chang data without mobile number
    func changeData (){
        
        ApiService.SharedInstance.fetchFeedForInt(URL: "?k=\(UIDevice.current.identifierForVendor!.uuidString)&o=10&val=\(defualts.integer(forKey: "auth")),\(nameText.text!),\(borsaId!),\(cityId!),\(addressText.text!),\(emailText.text!)") { (Data:Int) in
            
        }
    }
    ///////// change mobile number
    func changemobile (){
        
         ApiService.SharedInstance.fetchFeedForInt(URL: "?k=\(UIDevice.current.identifierForVendor!.uuidString)&o=9&val=\(defualts.integer(forKey: "auth")),1,\(changNumber.text!)") { (Data:Int) in
        
            
        }
    }
    
    /////// fech my Data from api
    func fetchData() {
        ApiService.SharedInstance.fetchFeedForObject(URL: "?k=\(UIDevice.current.identifierForVendor!.uuidString)&o=9&val=\(defualts.integer(forKey: "auth")),2") { (Data:[String : Any]) in
            
            
            print(self.defualts.integer(forKey: "auth"))
            
            
            for arr in Data["Result"] as! [[String:Any]] {
                
                let newProduct = MyDataModel(dictionary: arr as! [String:Any] )
                
                
                self.data.append(newProduct)
                
                //////////////// eh ???
                self.nameText.text = newProduct.MyName
                self.changNumber.text = newProduct.MobNo
                self.cityText.text = newProduct.MyCity
                self.borsaText.text = newProduct.MyBorsa
                self.addressText.text = newProduct.MyAddress
                self.emailText.text = newProduct.MyMail
                print(self.defualts.integer(forKey: "auth"))
                
            }
        }
    }
    
    //////// fetch all borsa name for picker view
    func fetchBorsaName() {
        ApiService.SharedInstance.fetchFeedForUrl(URL:"?k=&o=2") { (Data:[[String : Any]]) in
           
            for arr in Data as! [[String:Any]] {
                let newProduct = MainModel(dictionary: arr as! [String:Any] )
                self.borsa.append(newProduct)
            }
            DispatchQueue.main.async(execute: {
                self.mypicker.reloadAllComponents()
            })
        }
    }
    //////// fetch all city for picker view
    
    func fetcityName (){
        
        ApiService.SharedInstance.fetchFeedForUrl(URL: "?k=\(UIDevice.current.identifierForVendor!.uuidString)&o=18&val=17335,0") { (Data : [[String: Any]]) in
            for arr in Data as! [[String : Any]]
                
            {
                let newProduct = CitiesModel(dictionary: arr as! [String : Any])
                self.cities.append(newProduct)
            }
              DispatchQueue.main.async(execute: {
            self.mypicker.reloadComponent(0)
            })
        }
     }
}
