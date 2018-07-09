//
//  Extention.swift
//  Borsa
//
//  Created by hazem on 6/11/18.
//  Copyright © 2018 hazem. All rights reserved.
//

import UIKit
extension Double {
    /// Rounds the double to decimal places value
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

extension UIColor {
    static func rgb(_ red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static let backgroundColor = UIColor.rgb(21, green: 22, blue: 33)
    static let outlineStrokeColor = UIColor.rgb(234, green: 46, blue: 111)
    static let trackStrokeColor = UIColor.rgb(56, green: 25, blue: 49)
    static let pulsatingFillColor = UIColor.rgb(86, green: 30, blue: 63)
}
let imageCache = NSCache<NSString, UIImage>()

class CustomImageView: UIImageView {
    
    var imageUrlString: String?
    
    func loadImageUsingUrlString(_ urlString: String) {
        
        imageUrlString = urlString
        
        let url = URL(string: urlString)
        
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, respones, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            
            DispatchQueue.main.async(execute: {
                
                if let imageToCache =  UIImage(data: data!) {
                    
                    if self.imageUrlString == urlString {
                        
                        self.image = imageToCache
                        imageCache.setObject(imageToCache, forKey: urlString as NSString)
                    }
                }
            })
            
        }).resume()
    }
    
}
