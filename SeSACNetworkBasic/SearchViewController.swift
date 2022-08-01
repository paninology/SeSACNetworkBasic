//
//  SearchViewController.swift
//  SeSACNetworkBasic
//
//  Created by yongseok lee on 2022/07/27.
//

import UIKit


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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //연결고리 작업: 테이블뷰가해야 할 역할 > 뷰컨트롤러에게 요청
        searchTableview.delegate = self
        searchTableview.dataSource = self
        //테이블뷰가 사용할 테이블뷰 셀(XIB) 등록
        //XIB: xml interface builer <= NIB
        searchTableview.register(UINib(nibName: ListTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: ListTableViewCell.reuseIdentifier)
    }
    
    func configureView() {
        searchTableview.backgroundColor = .clear
        searchTableview.separatorColor = .clear
        searchTableview.rowHeight = 60
    }
    
    func configureLabel() {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.reuseIdentifier, for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        
        cell.titleLabel.font = .boldSystemFont(ofSize: 22)
        cell.titleLabel.text = "Hello"
        
        return cell
    }


}
