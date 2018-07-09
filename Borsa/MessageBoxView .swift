//
//  MessageBoxView .swift
//  Borsa
//
//  Created by hazem on 7/1/18.
//  Copyright © 2018 hazem. All rights reserved.
//

import UIKit

class MessageBoxModel: NSObject {
    
    
    
    var MId: String?
    var MDate: String?
    var  Subject: String?
    var Msg: String?
    
    
    init(dictionary: [String: Any]?) {
        
        self.MId = dictionary?["MId"] as? String
        self.MDate = dictionary?["MDate"] as? String
        self.Subject = dictionary?["Subject"] as? String
        self.Msg = dictionary?["Msg"] as? String
    }
    
}
    

