//
//  MuneController .swift
//  Borsa
//
//  Created by hazem on 6/28/18.
//  Copyright © 2018 hazem. All rights reserved.
//
import UIKit

class MenuController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    
    let defualts = UserDefaults.standard

    var songsList = [(title: " العملات العالمية", artwork:"0"), (title: " اخبار الرواتب ", artwork:"1"), (title: "اخبار عالمية ",artwork:"2"), (title: "اسعار الدهب ",artwork:"3") , (title: " اسعار النفط",artwork:"4"), (title: " شركات الصرافة",artwork:"5"),(title: "بياناتي ",artwork:"6"), (title: " كلمة المرور",artwork:"7"), (title: " ارسال رسالة",artwork:"8"), (title: " صندوق الوارد  ",artwork:"9"), (title: " تسجيل خروج",artwork:"10")]

    
    
    
    var cell = "cell"
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return songsList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cell, for: indexPath) as! MenuView
        
            cell.menuLabe.text = songsList[indexPath.item].title
            let image = songsList[indexPath.item].artwork
            cell.menuImage.image = UIImage(named: image)
            return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.item == 0 {
            let layout = UICollectionViewFlowLayout()
            let hospitalControll =  AmericanDollar(collectionViewLayout:layout)
            self.navigationController?.pushViewController(hospitalControll, animated: true)
          }else if indexPath.item == 1  {
            let layout = UICollectionViewFlowLayout()
            let hospitalControll =  SallaryController(collectionViewLayout:layout)
            self.navigationController?.pushViewController(hospitalControll, animated: true)
            }else if indexPath.item == 2  {
            let layout = UICollectionViewFlowLayout()
            let hospitalControll =  InternationalNewsController(collectionViewLayout:layout)
            self.navigationController?.pushViewController(hospitalControll, animated: true)
        }else if indexPath.item == 3  {
            let layout = UICollectionViewFlowLayout()
            let hospitalControll =  GoldPricesController(collectionViewLayout:layout)
            self.navigationController?.pushViewController(hospitalControll, animated: true)
        }
        else if indexPath.item == 4  {
            let layout = UICollectionViewFlowLayout()
            let hospitalControll =  GasPricesController(collectionViewLayout:layout)
            self.navigationController?.pushViewController(hospitalControll, animated: true)
        }
        else if indexPath.item == 5{
            let layout = UICollectionViewFlowLayout()
            let hospitalControll =  CompanyController(collectionViewLayout:layout)
            self.navigationController?.pushViewController(hospitalControll, animated: true)
        }else if indexPath.item == 10{
            let hospitalControll = LoginController()
            self.navigationController?.pushViewController(hospitalControll, animated: true)
        }else if indexPath.item == 8{
            let hospitalControll = SendMessage()
            self.navigationController?.pushViewController(hospitalControll, animated: true)
        }

        if (self.defualts.value(forKey: "auth")) != nil{
        
         if indexPath.item == 6  {
            let hospitalControll =  MyDataController()
            self.navigationController?.pushViewController(hospitalControll, animated: true)
        }else if indexPath.item == 7  {
            let hospitalControll =  PassController()
            self.navigationController?.pushViewController(hospitalControll, animated: true)
        }else if indexPath.item == 9{
            let layout = UICollectionViewFlowLayout()
            let hospitalControll = MessageBox(collectionViewLayout:layout)
            self.navigationController?.pushViewController(hospitalControll, animated: true)
        }
         }else{
            //Create the pop-up alert body
            let errorAlert = UIAlertController(title: "Oops!", message: "قم بتسجيل الدخول اولا", preferredStyle: .alert)
            
            //Create the "Okay button"
            let okayBtn = UIAlertAction(title: "Okay", style: .default, handler: { (action) in
                //Dismiss the alert when the button is pressed
                errorAlert.dismiss(animated: true, completion: nil)
            })
            
            //Add the "okay" button to the pop-up alert body
            errorAlert.addAction(okayBtn)
            
            //Finally show the alert to the user
            self.present(errorAlert, animated: true, completion: nil)
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width:(view.frame.width) ,height:view.frame.height  * 0.07)
    }
    
    
    
    
    override func viewDidLoad() {
         collectionView?.contentInset = UIEdgeInsetsMake(40, 0, 0, 0)
        collectionView?.backgroundColor = UIColor.rgb(244, green: 244, blue: 244)
        navigationController?.navigationBar.barTintColor = UIColor.rgb(18, green: 179, blue: 251)
        navigationItem.title = "welcome"
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        collectionView?.register(MenuView.self, forCellWithReuseIdentifier: cell)
        
        
        
    }
}
