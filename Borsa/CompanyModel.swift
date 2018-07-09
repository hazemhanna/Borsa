//
//  CompanyModel.swift
//  Borsa
//
//  Created by hazem on 6/24/18.
//  Copyright © 2018 hazem. All rights reserved.
//

import UIKit

class CompanyModel:NSObject{
    
    var ComId: String?
    var  ComName: String?
    
    
    init(dictionary: [String: Any]?) {
        self.ComId = dictionary?["ComId"] as? String
        self.ComName = dictionary?["ComName"] as? String
       
    }
}
