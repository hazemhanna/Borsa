
//
//  AmericanDollar.swift
//  Borsa
//
//  Created by hazem on 6/23/18.
//  Copyright © 2018 hazem. All rights reserved.
//

import UIKit


class AmericanDollar:  UICollectionViewController, UICollectionViewDelegateFlowLayout{
    var Headers = "Header"
    var Cellid="Cellid"
    var Cellids="Cellids"
    var footer = "footer"
    
   
    var dataStock = [DollarModel]()

    var data = [DollarModel]()
    
    var HeaderCurrency:DollarModel?
    

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cellid, for: indexPath) as! AmericanView
        cell.data = data[indexPath.item]
        cell.controller = self
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return data.count
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: self.Headers, for: indexPath as IndexPath) as! SubHeader
        
        header.controller = self
        return header
        
    }
    
    
    ///// give header size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width:collectionView.frame.width , height: collectionView.frame.height  * 0.15)
    }
    
    ////// size of the cell
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width:collectionView.frame.width - 20  ,height:(collectionView.frame.height  * 0.25) - (navigationController?.navigationBar.frame.size.height)!)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
    func SwtichToStockDetails(id:DollarModel ){
        if HeaderCurrency == nil {
        HeaderCurrency = data[0]
       
        }
        
        let layout = UICollectionViewFlowLayout()
        let hospitalControll = CalculateDollar()
        hospitalControll.id = id
        hospitalControll.headerData = HeaderCurrency
        self.navigationController?.pushViewController(hospitalControll, animated: true)
    }
    
    override func viewDidLoad() {
        collectionView?.contentInset = UIEdgeInsetsMake(10, 0, 0, 0)
        collectionView?.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = UIColor.rgb(18, green: 179, blue: 251)
        collectionView?.register(AmericanView.self, forCellWithReuseIdentifier: Cellid)
        navigationItem.title = "اسعار الصرف بمقابل "
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        collectionView?.register(SubHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: Headers)
        
        let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout // casting is required because UICollectionViewLayout doesn't offer header pin. Its feature of UICollectionViewFlowLayout
        layout?.sectionFootersPinToVisibleBounds = true
        
        FetchData()
    }
    
    //////////// search for currancy in array
    func search (name:String)  {
        if name != "" {
            
            var filterdata =  self.data.filter({($0.Cname!.contains(name))})
            print(filterdata)
            self.data = filterdata
        }else {
            
            self.data = dataStock
            
        }
        
        DispatchQueue.main.async(execute: {
            self.collectionView?.reloadData()
        })
    }
  
    
    
    //////
    func FetchData()  {
        var filterdata = [DollarModel]()
        ApiService.SharedInstance.fetchFeedForUrl(URL: "?k=\(UIDevice.current.identifierForVendor!.uuidString)&o=13") { (Data:[[String:Any]]) in
            
            for arr in Data as! [[String:Any]] {
                let newProduct = DollarModel(dictionary: arr as! [String:Any] )
                self.data.append(newProduct)
                self.dataStock.append(newProduct)

            }
            
            DispatchQueue.main.async(execute: {
                self.collectionView?.reloadData()
            })
        }
    }
}



