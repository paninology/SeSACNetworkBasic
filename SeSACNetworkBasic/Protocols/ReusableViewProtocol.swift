//
//  ReusableViewProtocol.swift
//  SeSACNetworkBasic
//
//  Created by yongseok lee on 2022/08/01.
//

import UIKit

protocol ReusableViewProtocol {
    static var reuseIdentifier: String { get }
}

extension UIViewController: ReusableViewProtocol { //extension은 저장 프로퍼티 불가능
    static var reuseIdentifier: String { //연산 프로퍼티 get만 쓸때는 생략 가능
        return String(describing: self)
    }    
    
}
extension UITableViewCell: ReusableViewProtocol {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    
}
