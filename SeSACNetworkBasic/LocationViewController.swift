//
//  LocationViewController.swift
//  SeSACNetworkBasic
//
//  Created by yongseok lee on 2022/07/29.
//

import UIKit

class LocationViewController: UIViewController{
   

    //LocationaViewController.self 메타 타입
    
    //Notification 1.
    let notificationCenter = UNUserNotificationCenter.current()

    override func viewDidLoad() {
        super.viewDidLoad()
        requestAuthorization()
        //custom font
        for family in UIFont.familyNames {
            print("=======\(family)=======")
            for name in UIFont.fontNames(forFamilyName: family) {
                print(name)
            }
                    
        }

        
    }
    //Notification 2. 권한 요청
    func requestAuthorization() {
        
        let authorizationOptions = UNAuthorizationOptions(arrayLiteral: .alert, .badge, .sound)
        
        notificationCenter.requestAuthorization(options: authorizationOptions) { success, error in
            if success {
                self.sendNotification()
            }
        }
    }

    //Notification 3. 권한 허용한 사용자에게 알림 요청
    //iOS 시스템에서 알림을 담당. 알림 등록해야함/ 언제 무엇을
    
    /*
     - 권한 허용 해야만 알림이 온다.
     - 권한 허용 문구 시스템적으로 한번만 뜬다.
     - 허용 안 된 경우 애플 설정으로 직접 유도하는 코드를 구성해야 한다.
     - 기본적으로 알림은 포그라운드에서 수신되지 않는다.
     - 60초 이상 설정해야 반복알림 가능/ 갯수 제한 64개
     
     1. 뱃지 제거 > 언제?
     2. 노티 제거? > 노티의 유효 기간은? 언제 삭제해주는게 맞을까? 
     3. 포그라운드 수신? > delegate 메서드로 해결
     
     +a
     - 노티는 앱 실행이기본인데, 특정 노티를 클릭할 때 특정 화면으로 가고 싶다면?
     - 포그라운드 수신, 특정 화면에서는 안받고 특정 조건에 대해서만 포그라운드 수신을 받고 싶다면?
     - iOS15 집중모드 등 5~6 우선순위 존재 (집중모드에 알림 띄울건지 등등...)
     */
    
    func sendNotification() {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "다마고치를 키워보세요"
        notificationContent.subtitle = "오늘 행운의 숫자는 \(Int.random(in: 1...100))"
        notificationContent.body = "전느 따끔이에요 밥주세요"
        notificationContent.badge = 40
        
        //언제 보낼 것인가? 1. 시간간격 2. 캘린더 3. 위치
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        var dateComponents = DateComponents()
        dateComponents.minute = 15
        
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        //알림 요청
        //identifier:
        let request = UNNotificationRequest(identifier: "jack", content: notificationContent, trigger: trigger)
        notificationCenter.add(request)
        
    }
    @IBAction func notificationButtonclicked(_ sender: UIButton) {
        
        sendNotification()
    }
    
}
