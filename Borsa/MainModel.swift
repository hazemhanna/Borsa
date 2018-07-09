//
//  MainModel.swift
//  Borsa
//
//  Created by hazem on 6/12/18.
//  Copyright © 2018 hazem. All rights reserved.
//

import UIKit

class MainModel:NSObject{
    
    var Bid: String?
    var  Bname: String?
    var  Bprice: String?
    var  Sprice: String?
    var  SS: String?
    var  BS: String?   
    var  Statous: String?
    


    init(dictionary: [String: Any]?) {
        self.Bid = dictionary?["Bid"] as? String
        self.Bname = dictionary?["BName"] as? String
        self.Bprice = dictionary?["Bprice"] as? String
        self.Sprice = dictionary?["SPrice"] as? String
        self.SS = dictionary?["SS"] as? String
        self.BS = dictionary?["BS"] as? String
        self.Statous = dictionary?["Statous"] as? String

    }
}

