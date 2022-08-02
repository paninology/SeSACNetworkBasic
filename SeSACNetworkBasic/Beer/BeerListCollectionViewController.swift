//
//  BeerListCollectionViewController.swift
//  SeSACNetworkBasic
//
//  Created by yongseok lee on 2022/08/02.
//

import UIKit

import Alamofire
import SwiftyJSON
import Kingfisher

class BeerListCollectionViewController: UICollectionViewController {
    
    var beerList: [Beer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        requestBeerList()
        
        print(beerList)

     
    }
    
    func requestBeerList() {
        //AF: 200-299 status code 가 성공인데 커스텀으로 추가 하고싶으면 validate
        let url = "https://api.punkapi.com/v2/beers"
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print(json[0]["name"])
                for num in 0...json.count - 1 {
                    let res = Beer(name: json[num]["name"].stringValue, ibu: json[num]["ibu"].intValue, description: json[num]["description"].stringValue, imageURL: json[num]["image_url"].stringValue)
                    self.beerList.append(res)
                    print(res)
                }
                
                self.collectionView.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return beerList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BeerListCollectionViewCell", for: indexPath) as! BeerListCollectionViewCell
        cell.nameLabel.text = beerList[indexPath.row].name
        cell.ibuLabel.text = beerList[indexPath.row].ibu.description
//        cell.beerImageView.kf.setImage(with: beerList[indexPath.row].imageURL)
        
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
