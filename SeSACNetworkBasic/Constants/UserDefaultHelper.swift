//
//  UserDefaultHelper.swift
//  SeSACNetworkBasic
//
//  Created by yongseok lee on 2022/08/01.
//

import Foundation

class UserDefaultsHelper {
    
    private init() { } //외부에서 다시 인스턴스 생성 하지 못하도록 막는다.
    
    static let standard = UserDefaultsHelper()
    //싱글톤 패턴. 보통 자기 자신의 인스턴스를 타입 프로퍼티 형태로 가지고 있음
    
    let userDefaults = UserDefaults.standard
    
    enum Key: String {
        case nickname, age
    }
    
    var nickname: String {
        get {
            return userDefaults.string(forKey: Key.nickname.rawValue) ?? "대장"
        }
        set { //연산 프로퍼티 파라미터
            userDefaults.set(newValue, forKey: Key.age.rawValue)
        }
    }
    
    var age: Int {
        get {
            return userDefaults.integer(forKey: Key.age.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: Key.age.rawValue)
        }
    }
    
}
