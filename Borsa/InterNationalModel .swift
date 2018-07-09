//
//  InterNationalModel .swift
//  Borsa
//
//  Created by hazem on 6/24/18.
//  Copyright © 2018 hazem. All rights reserved.
//

import UIKit

class InterNationalModel :NSObject{
    
    var NId: String?
    var  NKind: String?
    var NDate: String?
    var  HLine: String?
    var Details: String?
    
    
    init(dictionary: [String: Any]?) {
        
        self.NId = dictionary?["NId"] as? String
        self.NKind = dictionary?["NKind"] as? String
        self.NDate = dictionary?["NDate"] as? String
        self.HLine = dictionary?["HLine"] as? String
        self.Details = dictionary?["Details"] as? String
    }
}
