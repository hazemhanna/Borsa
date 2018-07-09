//
//  MainConroller2.swift
//  Borsa
//
//  Created by hazem on 6/11/18.
//  Copyright © 2018 hazem. All rights reserved.
//
import UIKit


class MainController:  UICollectionViewController, UICollectionViewDelegateFlowLayout{
    var Headers = "Header"
    var Cellid="Cellid"
    var Cellids="Cellids"
    var footer = "footer"
    
    
    var data = [MainModel]()
    var News = [NewsModel]()

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cellid, for: indexPath) as! CateguaryCell
        
        cell.data = data[indexPath.item]
        cell.controller = self
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return data.count
        
    }
    
    
    /////// go to arrow details with id 
    
    func SwtichToStockDetails(id:String){
        let layout = UICollectionViewFlowLayout()
        let hospitalControll =  SubCateguaryController(collectionViewLayout:layout)
        hospitalControll.id = id
        self.navigationController?.pushViewController(hospitalControll, animated: true)
    }
    
    
    
    ///////// make header and give it size
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: self.Headers, for: indexPath as IndexPath) as! MainHeadr
            return header
            
        case UICollectionElementKindSectionFooter:
            
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier:  footer, for: indexPath as IndexPath) as! MainFooter
            footerView.news = News.first
            //  footerView.controller = self
            
            return footerView
        default:
            
            fatalError("Unexpected element kind")
        }
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width:collectionView.frame.width - 20  ,height:(collectionView.frame.height  * 0.15) - (navigationController?.navigationBar.frame.size.height)!)
    }
    
    
    
    
    /////// size for the footer
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        return CGSize(width:collectionView.frame.width , height: collectionView.frame.height  * 0.08)
        
    }
    
    /////// give header size
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width:collectionView.frame.width , height: collectionView.frame.height  * 0.08)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
    
    
    override func viewDidLoad() {
        print(UIDevice.current.identifierForVendor!.uuidString)

        collectionView?.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        collectionView?.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = UIColor.rgb(18, green: 179, blue: 251)
        collectionView?.register(MainFooter.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footer)
        collectionView?.register(MainHeadr.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: Headers)
        
        collectionView?.register(CateguaryCell.self, forCellWithReuseIdentifier: Cellid)
        
        // collectionView?.isScrollEnabled = false
      //  navigationItem.title = " بورصة العراق المالية"
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        
        let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout // casting is required because UICollectionViewLayout doesn't offer header pin. Its feature of UICollectionViewFlowLayout
        layout?.sectionFootersPinToVisibleBounds = true
        
        
        fetchDAta()

        
        let moreButton = UIBarButtonItem(image: UIImage(named: "nav_more_icon")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMores))
        navigationItem.rightBarButtonItem = moreButton

    }
    
    
    func handleMores() {
        
        let layout = UICollectionViewFlowLayout()
        let hospitalControll =  MenuController(collectionViewLayout:layout)
      
        self.navigationController?.pushViewController(hospitalControll, animated: true)
        }
    
    
    
    func fetchDAta() {
        
   
        ApiService.SharedInstance.fetchFeedForUrl(URL: "?k=\(UIDevice.current.identifierForVendor!.uuidString)&o=2") { (Data:[[String : Any]]) in
            print(Data)
            for arr in Data as! [[String:Any]] {
                let newProduct = MainModel(dictionary: arr as! [String:Any] )
                self.data.append(newProduct)
            }
            ApiService.SharedInstance.fetchFeedForObject(URL: "?k=\(UIDevice.current.identifierForVendor!.uuidString)&o=7") { (Data:[String : Any]) in
                print(Data)
                for arr in Data["Result"] as! [[String:Any]] {
                    
                    let newProduct = NewsModel(dictionary: arr as! [String:Any] )
                    self.News.append(newProduct)
                }
             
                DispatchQueue.main.async(execute: {
                    self.collectionView?.reloadData()
                })
            }
         
        }
    }
}


