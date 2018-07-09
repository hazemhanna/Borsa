//
//  NewsModel.swift
//  Borsa
//
//  Created by hazem on 6/24/18.
//  Copyright © 2018 hazem. All rights reserved.
//

import UIKit

class NewsModel :NSObject{
    
    var NewesBar: String?
   
    
    init(dictionary: [String: Any]?) {
        
        self.NewesBar = dictionary?["NewesBar"] as? String
        
    }
}
