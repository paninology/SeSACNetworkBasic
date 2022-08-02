//
//  TranslateViewController.swift
//  SeSACNetworkBasic
//
//  Created by yongseok lee on 2022/07/28.
//

import UIKit

import Alamofire
import SwiftyJSON

class TranslateViewController: UIViewController {
    
    //UITextView, UISearchBar, UIPinckerView는 액션 없음.
    //UIContol
    //UIResponderChain
    @IBOutlet weak var userInputTextView: UITextView!
    
    @IBOutlet weak var outputTextView: UITextView!
    
    let textViewPlaceHolder = "번역하고 싶은 문장을 작성해보세요"
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        userInputTextView.delegate = self
        
        userInputTextView.text = textViewPlaceHolder
        userInputTextView.textColor = .lightGray
        userInputTextView.font = UIFont(name: "DeogonPrincess", size: 17)
//        requestTranslatedData()
    }
    func requestTranslatedData(text: String) {
        let url = EndPoint.translateURL
        
        let parameter = ["source": "ko", "target": "en", "text": text]
        
        let header: HTTPHeaders = ["X-Naver-Client-Id": APIKey.NAVER_ID, "X-Naver-Client-Secret": APIKey.NAVER_SECRET]
        
        AF.request(url, method: .post, parameters: parameter, headers: header).validate(    statusCode: 200...500).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
               
                let statusCode = response.response?.statusCode ?? 500 //네트워크 오류면 500 할당
                if statusCode == 200 {
                    self.outputTextView.text = json["message"]["result"]["translatedText"].stringValue
                } else {
                    self.userInputTextView.text = json["errorMassage"].stringValue
                    print(json["errorMassage"].stringValue)
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @IBAction func translateButtonClicked(_ sender: UIButton) {
        guard userInputTextView.text != textViewPlaceHolder else { return }
                
        requestTranslatedData(text: userInputTextView.text)
                
        userInputTextView.text = textViewPlaceHolder
        userInputTextView.textColor = .lightGray
    }
    
}
extension TranslateViewController: UITextViewDelegate {
    
    //text가 변할때마다 호출
    func textViewDidChange(_ textView: UITextView) {
//        print(textView.text.count)
    }
    //편집이 시작될 때. 커서가 깜빡이기 시작할때
    //텍스트뷰 글자: 플레이스 홀더랑 글자가 같으면 clear. 컬러수정
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("begin")
        
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    //편집이 끝났을 때. 커서가 없어지는 순간
    //텍스트뷰 글자: 사용자가 아무 글자도 안썼으면 플레이스 홀더 글자 보이게 해라

    func textViewDidEndEditing(_ textView: UITextView) {
        print("end")
//        guard userInputTextView.text != textViewPlaceHolder else { return }
//        requestTranslatedData(text: textView.text)
       
        if textView.text.isEmpty {
            textView.text = textViewPlaceHolder
            textView.textColor = .lightGray
        
        }
        
    }
}

