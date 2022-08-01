//
//  TranslateViewController.swift
//  SeSACNetworkBasic
//
//  Created by yongseok lee on 2022/07/28.
//

import UIKit

class TranslateViewController: UIViewController {
    
    //UITextView, UISearchBar, UIPinckerView는 액션 없음.
    //UIContol
    //UIResponderChain
    @IBOutlet weak var userInputTextView: UITextView!
    let textViewPlaceHolder = "번역하고 싶은 문장을 작성해보세요"
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        userInputTextView.delegate = self
        
        userInputTextView.text = textViewPlaceHolder
        userInputTextView.textColor = .lightGray
        userInputTextView.font = UIFont(name: "DeogonPrincess", size: 17)
    }
  
}
extension TranslateViewController: UITextViewDelegate {
    
    //text가 변할때마다 호출
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text.count)
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
        
        if textView.text.isEmpty {
            textView.text = textViewPlaceHolder
            textView.textColor = .lightGray
        
        }
    }
}

