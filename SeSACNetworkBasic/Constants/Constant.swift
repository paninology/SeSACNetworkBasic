//
//  Constant.swift
//  SeSACNetworkBasic
//
//  Created by yongseok lee on 2022/08/01.
//

import Foundation

//enum StoryboardName {
//    case Main
//    case Search
//    case Setting
//}

struct StoryboardName {
    //접근 제어를 통해 초기화 방지
    private init() {
        
    }
    
    static let main = "Main"
    static let search = "Search"
    static let setting = "Setting"
}

/*
1. struct type porperty VS enum type property => 인스턴스 생성 방지
 2. enum case VS enum static => 중복, case 제약
*/
//enum StoryboardName {
//    static let main = "Main"
//    static let search = "Search"
//    static let setting = "Setting"
//}


enum FontName {
    static let title = "SanFransisco"
    static let body = "SanFransisco"
    static let caption = "AppleSandol"
}
