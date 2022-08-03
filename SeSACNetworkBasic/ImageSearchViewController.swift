//
//  ImageSearchViewController.swift
//  SeSACNetworkBasic
//
//  Created by yongseok lee on 2022/08/03.
//

import UIKit

import Alamofire
import SwiftyJSON
import Kingfisher

class ImageSearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    

    @IBOutlet weak var iamgeSearchCollectionView: UICollectionView!
    
    var imageURLs:[URL] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        iamgeSearchCollectionView.delegate = self
        iamgeSearchCollectionView.dataSource = self
        cellLayoutSetting()
        fetchImage()
       
    }
    //fetchImage, requestImage, callRequestImage, getImage...> response에 따라 네이밍 설정
    //내일 페이지네이션
    func fetchImage() {
        let text = "과자".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = EndPoint.imageSearchURL + "query=\(text!)&display=30&start=31"
        
        let header: HTTPHeaders = ["X-Naver-Client-Id": APIKey.NAVER_ID, "X-Naver-Client-Secret": APIKey.NAVER_SECRET]
        
        AF.request(url, method: .get, headers: header).validate(statusCode: 200...500).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
            
                print("json: \(json)")
                for num in json["items"].arrayValue {
                    self.imageURLs.append(URL(string: num["link"].stringValue)!)
                }
                self.iamgeSearchCollectionView.reloadData()
                print(self.imageURLs.count)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func cellLayoutSetting() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 8
        let cellWidth = (UIScreen.main.bounds.width - (spacing * 3)) / 2
        
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        self.iamgeSearchCollectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.imageURLs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageSearchCollectionViewCell", for: indexPath) as! ImageSearchCollectionViewCell
        
      
        cell.searchImageView.kf.setImage(with: imageURLs[indexPath.row])
        return cell
    }

}
/*
extension ImageSearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageSearchCollectionViewCell", for: indexPath) as? ImageSearchCollectionViewCell ?? UICollectionViewCell()
        
      
//        cell.imageView?.image = imageURLs[indexPath.row]
        
        return cell
    }
    
    
}
 */
