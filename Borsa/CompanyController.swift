//
//  CompanyController.swift
//  Borsa
//
//  Created by hazem on 6/23/18.
//  Copyright © 2018 hazem. All rights reserved.
//

import UIKit


class CompanyController:  UICollectionViewController, UICollectionViewDelegateFlowLayout{
    var Headers = "Header"
    var Cellid="Cellid"
    var Cellids="Cellids"
    var footer = "footer"
    
    var data = [CompanyModel]()
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cellid, for: indexPath) as! CompanyView
        cell.controller = self
        cell.data = data[indexPath.item]
        
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return data.count
        
    }
    
    ////// size of the cell
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width:collectionView.frame.width - 10  ,height:(collectionView.frame.height  * 0.15) - (navigationController?.navigationBar.frame.size.height)!)
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
    func SwtichToStockDetails(id:String){
        let layout = UICollectionViewFlowLayout()
        let hospitalControll =  CompanyPranches(collectionViewLayout:layout)
        hospitalControll.id = id
        self.navigationController?.pushViewController(hospitalControll, animated: true)
    }
    
    
    override func viewDidLoad() {
        collectionView?.contentInset = UIEdgeInsetsMake(10, 0, 0, 0)
        collectionView?.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = UIColor.rgb(18, green: 179, blue: 251)
        collectionView?.register(CompanyView.self, forCellWithReuseIdentifier: Cellid)
        navigationItem.title = "شركات الصرافة "
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout // casting is required because UICollectionViewLayout doesn't offer header pin. Its feature of UICollectionViewFlowLayout
        layout?.sectionFootersPinToVisibleBounds = true
        
        fetcData()
        
    }
    
    
    func fetcData()  {
        
        
        ApiService.SharedInstance.fetchFeedForUrl(URL: "?k=\(UIDevice.current.identifierForVendor!.uuidString)&o=5") { (Data : [[String:Any]]) in
            
            for arr in Data as! [[String : Any]]{
                
                let newProduct = CompanyModel(dictionary: arr as! [String:Any])
                
                self.data.append(newProduct)
                
            }
            
            
            DispatchQueue.main.async(execute: {
                self.collectionView?.reloadData()
            })
            
            
            
        }
        
        
        
        
    }
    
    
    
}
