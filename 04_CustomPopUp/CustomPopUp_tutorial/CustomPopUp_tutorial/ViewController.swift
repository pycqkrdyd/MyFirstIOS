//
//  ViewController.swift
//  CustomPopUp_tutorial
//
//  Created by YongchaeP on 2022/03/27.
//

import UIKit
import WebKit

//노티 상수 설정
let notificationName = "btnClickNotification"

class ViewController: UIViewController, PopUpDelegate{
   
    

    // 깃허브 링크를 연결할 인스턴스
    @IBOutlet weak var myGithubView: WKWebView!
    // 블로그 링크를 연결할 인스턴스
    @IBOutlet weak var myBlogView: WKWebView!
    // 팝업 버튼 자체의 의미
    @IBOutlet weak var createPopUpBtn: UIButton!
    //노티피케이션센터는 등록 후에는 계속 수신 상태이기 때문에 등록 해제도 필요함, 메모리에서 빠져나올 때 deinit을 사용 아니면 계속 메모리를 사용
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    override func viewDidLoad() {
        
        super.viewDidLoad() //
        // Do any additional setup after loading the view.
        
        //뷰디드로드가 호출이 될 때(메모리에 올라갈떄?) ViewController 화면에 올라갈때
        //노티피케이션이라는 수신기 장착한다. 옵저버를 단다. (정찰) 옵저버는 자신, selector는 발동 되는 액션 뷰 컨트롤러에서 이벤트가 오면 발동 단, @objc 의미는 과거 object c 로 썼던 method
        NotificationCenter.default.addObserver(self, selector: #selector(loadWebView), name: NSNotification.Name(rawValue: notificationName), object: nil)
    //object는 이벤트에서 값 전달까지 가능한 값임
        
    
       
    }
    //selector에서 쓰려면 앞에 @objc를 붙여야함
    @objc fileprivate func loadWebView() {
        print("ViewController - loadWebView")
        let myPortfolioUrl = URL(string: "https://drive.google.com/file/d/1Dx-yJu6KFZtaVcyobjKhjyKKWjTUGOHH/view?usp=sharing")
        self.myBlogView.load(URLRequest(url: myPortfolioUrl!))
        
        
    }
    
    // 팝업 버튼 클릭했을 때 이루어지는 액션의 의미
    @IBAction func createPopUpBtnClicked(_ sender: Any) {
        print("ViewController - onCreatePopUpBtnClicke() called test")
        
        // 스토리보드 가져오기
        let storyboard = UIStoryboard.init(name: "PopUp", bundle: nil)
        // 스토리보드를 통해 뷰컨트롤러 가져오기
        //as!????
        let customPopUpVC = storyboard.instantiateViewController(withIdentifier: "AlertPopUpVC") as! CustomPopUpViewController
        // 뷰 컨트롤러가 보여지는 스타일
        customPopUpVC.modalPresentationStyle = .overCurrentContext
        // 뷰 컨트롤러가 사라지는 스타일 스스르 사라짐
        customPopUpVC.modalTransitionStyle = .crossDissolve
    
        customPopUpVC.BlogBtnCompletionClosure = {
            print("BlogBtnCompletionClosure called by popupVC")
            let myBlogUrl = URL(string: "https://blog.naver.com/qkrdydpyc")
            self.myBlogView.load(URLRequest(url:myBlogUrl!))
        }
        //self는 뷰컨트롤러에서 받은 팝업델리게이트, 인스턴스인 커스텀팝업VC에서 팝업델리게이트와 연결해주는것
        customPopUpVC.myPopUpDelegate = self
        /*
        customPopUpVC.GithubBtnCompletionClosure = {
            print("GithubBtnCompletionClosure called by popupVC")
            let myGithubUrl = URL(string: "https://github.com/pycqkrdyd/MyFirstiOS")
            self.myGithubView.load(URLRequest(url:myGithubUrl!))
        }*/
        
        //다른 뷰 컨트롤러를 보여주는것 내비컨트롤러는 스택이 쌓이는거고 프레젠트는 위에서 바로 보여주는 식으로 조금 다른 구조
        //어떤것을 보여줄지? -> 위에서 생성한 alertPopUpVC, 애니메이션은? -> true, 다 보여주고 나서는 뭔가 할건지? -> 안함 nil
        self.present(customPopUpVC, animated: true, completion: nil)
    }
   
    //MARK: - PopUpDelegate methods
    func onGithubBtnClicked() {
        print("ViewController - onGithubBtnClicked() called")
        let myGithubUrl = URL(string: "https://github.com/pycqkrdyd/MyFirstiOS")
        self.myGithubView.load(URLRequest(url:myGithubUrl!))
    }
    
}

