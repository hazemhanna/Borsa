//
//  CitiesModel.swift
//  Borsa
//
//  Created by hazem on 7/1/18.
//  Copyright © 2018 hazem. All rights reserved.
//
import UIKit

class CitiesModel: NSObject {
    
    
    
    var Cityid: String?
    var CtyName: String?
    
    
    
    init(dictionary: [String: Any]?) {
        
        self.Cityid = dictionary?["Cityid"] as? String
        self.CtyName = dictionary?["CtyName"] as? String
       
    }
    
}

/////




