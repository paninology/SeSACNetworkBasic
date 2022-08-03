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

struct APIKey {
    static let BOXOFFICE = "bd17e26e9cca635ae704ae32d67fb95f"
    
    static let NAVER_ID = "cWhxaKlp9yJW_KS0k2dx"
    static let NAVER_SECRET = "Rkulw9Qt8g"
}

struct EndPoint {
    static let boxOfficeURL = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?"
    static let lottouRL = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber"
    static let translateURL = "https://openapi.naver.com/v1/papago/n2mt"
    static let imageSearchURL = "https://openapi.naver.com/v1/search/image.json?"
}


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
