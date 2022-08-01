//
//  ViewPresentableProtocol.swift
//  SeSACNetworkBasic
//
//  Created by yongseok lee on 2022/07/28.
//

import Foundation
import UIKit

/*
 ----Protocol
 ----Delegate
 */
//프로토콜은 규약이자 필요한 요소를 명시만 할 뿐, 실질적인 구현부는 작성하지 않는다.
//실직적인 구현은 ㄴ프로토콜을 채택, 준수한 타입이 구현한다.
//클래스, 구조체, 익스텐션, 열거형...
//클래스는 단일 상속만 가능하지만, 프로토콜은 채택 갯수에 제한이 없다.
//@objc optional -> 선택적 요청(optional Requorement):
//프로토콜 프로퍼티, 프로토콜 메서드
//프로토콜 프로퍼티: 연산 프로퍼티로 쓰든 저장 프로퍼ㅣ로 쓰든 상관안함
//무조건 var로 선언
//만약 get만 명시를 했다면, get 기능만 최소한 구현되어 있으면 된다. 추가로 set 붙는건 오케이

@objc
protocol ViewPresentableProtocol {
    var navigationTitleString: String { get set }
    var backgroundColor: UIColor { get }
    static var identifier: String { get }
    
    func configureView()
    @objc optional func configureLabel()
    @objc optional func configureTextField()
}

/*
 ex. 테이블뷰
 */

@objc protocol jackTableViewProtocol {
    func numberOfRowsInSection() -> Int
    func cellForRowAt(indexPath: IndexPath) -> UITableViewCell
    @objc optional func didSelectRowAt()
}
