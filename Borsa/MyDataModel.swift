//
//  MyDataModel.swift
//  Borsa
//
//  Created by hazem on 7/2/18.
//  Copyright © 2018 hazem. All rights reserved.
//

import UIKit

class MyDataModel: NSObject {
    
    
    
    var Myid: String?
    var MyName: String?
    var BorsaId: String?
    var MyBorsa: String?
    var CityId: String?
    var MyCity: String?
    var MyAddress: String?
    var MyMail: String?
    var MobNo: String?
    
    
    init(dictionary: [String: Any]?) {
        
        self.Myid = dictionary?["Myid"] as? String
        self.MyName = dictionary?["MyName"] as? String
        self.BorsaId = dictionary?["BorsaId"] as? String
        self.MyBorsa = dictionary?["MyBorsa"] as? String
        self.CityId = dictionary?["CityId"] as? String
        self.MyCity = dictionary?["MyCity"] as? String
        self.MyAddress = dictionary?["MyAddress"] as? String
        self.MyMail = dictionary?["MyMail"] as? String
        self.MobNo = dictionary?["MobNo"] as? String
    }
    
}
