//
//  CompanyPranchModel.swift
//  Borsa
//
//  Created by hazem on 6/24/18.
//  Copyright © 2018 hazem. All rights reserved.
//

import UIKit

class CompanyPranchModel:NSObject{
    
    var BrId: String?
    var  ComId: String?
    var City: String?
    var  Mobile: String?
    var Phone: String?
    var  Fax: String?
    var Address: String?
    var  Details: String?
    
    init(dictionary: [String: Any]?) {
        
        self.BrId = dictionary?["BrId"] as? String
        self.ComId = dictionary?["ComId"] as? String
        self.City = dictionary?["City"] as? String
        self.Mobile = dictionary?["Mobile"] as? String
        self.Phone = dictionary?["Phone"] as? String
        self.Fax = dictionary?["Fax"] as? String
        self.Address = dictionary?["Address"] as? String
        self.Details = dictionary?["Details"] as? String
        
        
        
        
    }
}
