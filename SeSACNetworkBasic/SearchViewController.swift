//
//  SearchViewController.swift
//  SeSACNetworkBasic
//
//  Created by yongseok lee on 2022/07/27.
//

import UIKit
import Alamofire
import SwiftyJSON

/*
 Swift Protocol
 - Delegate
 - Datasource
 
 1.왼팔/오른팔
 2. 테이블뷰 아웃렛 연결
 3. 1 + 2 합치기
 
 */

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var searchTableview: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //BoxOffice  배열
    var boxOfficeArray:[BoxOfficeModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //연결고리 작업: 테이블뷰가해야 할 역할 > 뷰컨트롤러에게 요청
        searchTableview.delegate = self
        searchTableview.dataSource = self
        searchBar.delegate = self
        //테이블뷰가 사용할 테이블뷰 셀(XIB) 등록
        //XIB: xml interface builer <= NIB
        searchTableview.register(UINib(nibName: ListTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: ListTableViewCell.reuseIdentifier)
      
        requestBoxOffice(text: dateOfYesterday())
        print("yesterday", dateOfYesterday())
    }
    func requestBoxOffice(text: String) {
        
        boxOfficeArray.removeAll()
        //AF: 200-299 status code 가 성공인데 커스텀으로 추가 하고싶으면 validate
        let url = "\(EndPoint.boxOfficeURL)key=\(APIKey.BOXOFFICE)&targetDt=\(text)"
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON:, \(json)")
                for movie in json["boxOfficeResult"]["dailyBoxOfficeList"].arrayValue {
                    let movieNm = movie["movieNm"].stringValue
                    let openDt = movie["openDt"].stringValue
                    let audiAcc = movie["audiAcc"].stringValue
                    
                    let data = BoxOfficeModel(movieTitle: movieNm, releaseDate: openDt, totalCount: audiAcc)
                    self.boxOfficeArray.append(data)
                }
                
                
                self.searchTableview.reloadData()
                print(self.boxOfficeArray)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func dateOfYesterday() -> String {
        let currentDate = Date()
        let yesterday = currentDate.addingTimeInterval(-3600 * 24)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.string(from: yesterday)
    }
    
    func configureView() {
        searchTableview.backgroundColor = .clear
        searchTableview.separatorColor = .clear
        searchTableview.rowHeight = 60
    }
    
    func configureLabel() {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        boxOfficeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.reuseIdentifier, for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        
        
        cell.titleLabel.font = .boldSystemFont(ofSize: 22)
        cell.titleLabel.text = "\(boxOfficeArray[indexPath.row].movieTitle): \(boxOfficeArray[indexPath.row].releaseDate)"
        
        return cell
    }


}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        requestBoxOffice(text: searchBar.text!) //옵셔널 바인딩. 8글자, 숫자, 날짜로 변경 시 유효한 형태인지
    }
}
