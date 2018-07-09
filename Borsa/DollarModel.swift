//
//  DollarModel.swift
//  Borsa
//
//  Created by hazem on 6/24/18.
//  Copyright © 2018 hazem. All rights reserved.
//


import UIKit

class DollarModel:NSObject{
    
    var Cid: String?
    var  Cname: String?
    var  Cprice: String?
    var  Sympol: String?
    var  Flag: String?
    
    init(dictionary: [String: Any]?) {
        self.Cid = dictionary?["Cid"] as? String
        self.Cname = dictionary?["CName"] as? String
        self.Cprice = dictionary?["CPrice"] as? String
        self.Sympol = dictionary?["Sympol"] as? String
        self.Flag = dictionary?["Flag"] as? String
        
    }
}
