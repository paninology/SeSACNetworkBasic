//
//  ViewController.swift
//  SeSACNetworkBasic
//
//  Created by yongseok lee on 2022/07/27.
//

import UIKit

class ViewController: UIViewController, ViewPresentableProtocol {
   
    static var identifier: String = "viewController"
    
    var navigationTitleString: String  {  //let으로 쓰면 set 기능을 못쓰니까 오류남
        get {
            return "대장님의 다마고치"
        }
        set {
            title = newValue
        }
    }
    
    var backgroundColor: UIColor {
        get {
            return .blue
        }
    }
    
 
    func configureView() {
        navigationTitleString = "고래밥님의 다마고치"
//        backgroundColor = .red
        
        title = navigationTitleString
        view.backgroundColor = backgroundColor
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaultsHelper.standard.nickname = "고래밥"
        title = UserDefaultsHelper.standard.nickname
        UserDefaultsHelper.standard.age = 80
     
        
        // Do any additional setup after loading the view.
    }


}

