//
//  SubCateguary.swift
//  Borsa
//
//  Created by hazem on 6/11/18.
//  Copyright © 2018 hazem. All rights reserved.
//

import UIKit


class SubCateguaryController:  UICollectionViewController, UICollectionViewDelegateFlowLayout{
    var Headers = "Header"
    var Cellid="Cellid"
    var Cellids="Cellids"
    var footer = "footer"
    var data = [SubCateguaryModel]()
    var array = [SubCateguaryModel]()
    var id:String?
    
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cellid, for: indexPath) as! SubCateguaryCell
        cell.data = array[indexPath.item]
         cell.controller = self
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
        
    }
    
 
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: self.Headers, for: indexPath as IndexPath) as! MainHeadr
        return header
    
    }
    
    
    ///// give header size
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            return CGSize(width:collectionView.frame.width , height: collectionView.frame.height  * 0.08)
        }
    
    
    
    
    ////// size of the cell
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width:collectionView.frame.width - 20  ,height:(collectionView.frame.height  * 0.15) - (navigationController?.navigationBar.frame.size.height)!)
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 9
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func SwtichToStockDetails(Data:SubCateguaryModel){
        let hospitalControll =  CalculateController()
        hospitalControll.array = Data
        self.navigationController?.pushViewController(hospitalControll, animated: true)
    }
    
    
    override func viewDidLoad() {
      //  collectionView?.contentInset = UIEdgeInsetsMake(10, 0, 0, 0)
        collectionView?.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = UIColor.rgb(18, green: 179, blue: 251)
        collectionView?.register(SubCateguaryCell.self, forCellWithReuseIdentifier: Cellid)
        navigationItem.title = " بورصة العراق المالية"
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        collectionView?.register(MainHeadr.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: Headers)

        let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout // casting is required because UICollectionViewLayout doesn't offer header pin. Its feature of UICollectionViewFlowLayout
        layout?.sectionFootersPinToVisibleBounds = true
        
        fetchData()
    }

    
    func fetchData()  {
        
        ApiService.SharedInstance.fetchFeedForUrl(URL: "?k=\(UIDevice.current.identifierForVendor!.uuidString)&o=3&val=kjhkjhkj,\(id!)") { (Data:[[String:Any]]) in
            
            for arr in Data as! [[String:Any]]{
                
                let newProduct = SubCateguaryModel(dictionary:arr as! [String:Any])
                self.array.append(newProduct)
                DispatchQueue.main.async(execute: {
                    self.collectionView?.reloadData()
                })
                
              
                print(newProduct)
                
            }
        }
    }
    






}
