//
//  InternationalNewsController .swift
//  Borsa
//
//  Created by hazem on 6/23/18.
//  Copyright © 2018 hazem. All rights reserved.
//


import UIKit


class InternationalNewsController :  UICollectionViewController, UICollectionViewDelegateFlowLayout{
    var Headers = "Header"
    var Cellid="Cellid"
    var Cellids="Cellids"
    var footer = "footer"
    
    var data = [InterNationalModel]()
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cellid, for: indexPath) as! InternationalNewsView
        
        cell.data = data[indexPath.item]
       
        
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return data.count
        
    }
    
    ////// size of the cell
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width:collectionView.frame.width - 20  ,height:(collectionView.frame.height  * 0.25) - (navigationController?.navigationBar.frame.size.height)!)
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 25
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
    
    
    override func viewDidLoad() {
        collectionView?.contentInset = UIEdgeInsetsMake(10, 0, 0, 0)
        collectionView?.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = UIColor.rgb(18, green: 179, blue: 251)
        collectionView?.register(InternationalNewsView.self, forCellWithReuseIdentifier: Cellid)
        navigationItem.title = "اخبار عالمية  "
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout // casting is required because UICollectionViewLayout doesn't offer header pin. Its feature of UICollectionViewFlowLayout
        layout?.sectionFootersPinToVisibleBounds = true
        
        fetcData ()
    }



    
    func fetcData (){
        
        
        
        ApiService.SharedInstance.fetchFeedForUrl(URL: "?k=\(UIDevice.current.identifierForVendor!.uuidString)&o=4&val=kjhkjhkj,2") { (Data : [[String: Any]]) in
            for arr in Data as! [[String : Any]]
            {
                
                
                let newProduct = InterNationalModel(dictionary: arr as! [String : Any])
                
                self.data.append(newProduct)
                
            }
            
            DispatchQueue.main.async(execute: {
                self.collectionView?.reloadData()
            })
            
            
        }
    }





}
