//
//  CompanyPranches.swift
//  Borsa
//
//  Created by hazem on 6/23/18.
//  Copyright © 2018 hazem. All rights reserved.
//

import UIKit


class CompanyPranches:  UICollectionViewController, UICollectionViewDelegateFlowLayout{
    var Headers = "Header"
    var Cellid="Cellid"
    var Cellids="Cellids"
    var footer = "footer"
    
    var data = [CompanyPranchModel]()
    var id:String?
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cellid, for: indexPath) as! CompanyPranchViews
        
        cell.data = data[indexPath.item]
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return data.count
        
    }
    
    ///////// make footer and give it size
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: self.footer, for: indexPath as IndexPath) as! SubFooter
        footer.controller1 = self
        return footer
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        return CGSize(width:collectionView.frame.width - 30  , height: collectionView.frame.height  * 0.08)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width:collectionView.frame.width - 20  ,height:(collectionView.frame.height  * 0.5) - (navigationController?.navigationBar.frame.size.height)!)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
    
    
    
    //////// backe image push back page  company page
    
    
    func SwtichToCompanyControler(){
        let layout = UICollectionViewFlowLayout()
        let hospitalControll = CompanyController(collectionViewLayout:layout)
        self.navigationController?.pushViewController(hospitalControll, animated: true)
    }
    
    
    /////////// home image push main controller
    
    
    func SwtichToHomePage(){
        let layout = UICollectionViewFlowLayout()
        let hospitalControll = MainController(collectionViewLayout:layout)
        self.navigationController?.pushViewController(hospitalControll, animated: true)
    }
    
    

    
    override func viewDidLoad() {
        collectionView?.contentInset = UIEdgeInsetsMake(5, 0, 0, 0)
        collectionView?.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = UIColor.rgb(18, green: 179, blue: 251)
        collectionView?.register(SubFooter.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footer)
        
        collectionView?.register(CompanyPranchViews.self, forCellWithReuseIdentifier: Cellid)
        
        // collectionView?.isScrollEnabled = false
        navigationItem.title = " فروع شركة البرق للصرافة"
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        
        let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout // casting is required because UICollectionViewLayout doesn't offer header pin. Its feature of UICollectionViewFlowLayout
        layout?.sectionFootersPinToVisibleBounds = true
        
        fetchData()
        
    }
    
    
    func fetchData() {
        
        
        ApiService.SharedInstance.fetchFeedForUrl(URL: "?k=\(UIDevice.current.identifierForVendor!.uuidString)&o=6&val=kjhkjhkjf,\(id!)") { (Data : [[String: Any]]) in
            
            for arr in Data as! [[String : Any]]
            {
                
                
                let newProduct = CompanyPranchModel(dictionary: arr as! [String : Any])
                
                self.data.append(newProduct)
                
            }
            
            DispatchQueue.main.async(execute: {
                self.collectionView?.reloadData()
            })
        }
    }
}
