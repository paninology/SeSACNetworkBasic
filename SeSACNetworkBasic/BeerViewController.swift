//
//  BeerViewController.swift
//  SeSACNetworkBasic
//
//  Created by yongseok lee on 2022/08/01.
//

import UIKit

import SwiftyJSON
import Alamofire
import Kingfisher

class BeerViewController: UIViewController {

    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var recommandButton: UIButton!
    @IBOutlet weak var ibuLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    func beerRecommand() {
  
        let url = "https://api.punkapi.com/v2/beers/random"
        AF.request(url, method: .get).validate(statusCode: 200..<400).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)[0]
               
                let imageURL = URL(string: json[BeerJSONElements.shared.imageURL].stringValue)
                print(json)
                self.nameLabel.text = json[BeerJSONElements.shared.name].stringValue
                print(json[BeerJSONElements.shared.name].stringValue, "ddd", json["name"].stringValue)
                self.descriptionLabel.text = json[BeerJSONElements.shared.description].stringValue
                self.beerImageView.kf.setImage(with: imageURL)
                self.ibuLabel.text = "IBU: " + json[BeerJSONElements.shared.ibu].stringValue
                    
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    @IBAction func recommandButtonClicked(_ sender: UIButton) {
        
        beerRecommand()
    }
    
    
}
