//
//  LottoViewController.swift
//  SeSACNetworkBasic
//
//  Created by yongseok lee on 2022/07/28.
//

import UIKit

import SwiftyJSON

import Alamofire


class LottoViewController: UIViewController {
  
    @IBOutlet weak var numberTextField: UITextField!
    
    @IBOutlet var lottoNumberLabels: [UILabel]!
    //    @IBOutlet weak var lottopickerView: UIPickerView!
    
    var lottoPickerView = UIPickerView()
    //코드로 뷰를 만드는 기능이 훨씬 더 많이 남아있음
    
    let numberList: [Int] = Array(1...1025).reversed()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lottoPickerView.delegate = self
        lottoPickerView.dataSource = self
        numberTextField.tintColor = .clear
        
        numberTextField.inputView = lottoPickerView
        
        requestLotto(number: 1025)
    
    }
    
    func requestLotto(number: Int) {
        //AF: 200-299 status code 가 성공인데 커스텀으로 추가 하고싶으면 validate
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(number)"
        AF.request(url, method: .get).validate(statusCode: 200..<400).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                let bonus = json["bnusNo"].intValue
                print(bonus)
                
                let date = json["drwNoDate"].stringValue
                print(date)
                self.numberTextField.text = date
                for num in 1...6 {
                    self.lottoNumberLabels[num - 1].text = json["drwtNo\(num)"].intValue.description                }
                self.lottoNumberLabels[6].text = bonus.description
                    
            case .failure(let error):
                print(error)
            }
        }
    }
    

}

extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(component, row)
        
        requestLotto(number: numberList[row])
        numberTextField.text = "\(numberList[row])회차"
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(numberList[row])회차"
    }
    
}
