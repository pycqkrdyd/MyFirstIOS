//
//  ViewController.swift
//  CustomPopUp_tutorial
//
//  Created by YongchaeP on 2022/03/27.
//

import UIKit
import WebKit

class ViewController: UIViewController, PopUpDelegate{
   
    

    // 깃허브 링크를 연결할 인스턴스
    @IBOutlet weak var myGithubView: WKWebView!
    // 블로그 링크를 연결할 인스턴스
    @IBOutlet weak var myBlogView: WKWebView!
    // 팝업 버튼 자체의 의미
    @IBOutlet weak var createPopUpBtn: UIButton!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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

