//
//  CustomPopUpViewController.swift
//  CustomPopUp_tutorial
//
//  Created by Klay on 2022/03/28.
//

import UIKit

class CustomPopUpViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var BlogBtn: UIButton!
    @IBOutlet weak var GithubBtn: UIButton!
    @IBOutlet weak var bgBtn: UIButton!
    
    //자료형으로 구성 이부분은 추가 공부 필요
    //실행이 되면 아무것도 하지 않는다. 하지만 발생되었다면? 버튼이 눌렸다고 알려주는것 나는 버튼이 2개니까 2개를 선언했다.
    var BlogBtnCompletionClosure: (() -> Void)?
    var GithubBtnCompletionClosure: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("CumtomPopUpViewController - viewDidLoad() called test")
        // 끝 모양이 동글동글하게
        contentView.layer.cornerRadius = 20
        BlogBtn.layer.cornerRadius = 10
        GithubBtn.layer.cornerRadius = 10
    }
    
    //배경 버튼 터치 시 일어나는 액션
    @IBAction func onbgBtnClicked(_ sender: Any) {
        print("onbgBtnClicked - onbgBtnClicked() called")
        //dismiss는 현재 창을 닫아주는 의미, 닫아주고 그후에는 아무것도 하지 않음
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onBlogLinkBtnClicked(_ sender: UIButton) {
        print("onBlogLinkBtnClicked - onBlogLinkBtnClicked() called")
        //창을 지우고
        self.dismiss(animated: true, completion: nil)
        //컴프레션 블럭 호출
        if let BlogBtnCompletionClosure = BlogBtnCompletionClosure {
            // 메인에 알린다.
            BlogBtnCompletionClosure()
        }
    }
    
    @IBAction func onGithubBtnClicked(_ sender: UIButton) {
        print("onGithubBtnClicked - onGithubBtnClicked() called")
        //창을 지우고
        self.dismiss(animated: true, completion: nil)
        //컴프레션 블럭을 호출
        if let GithubBtnCompletionClosure = GithubBtnCompletionClosure {
            
            GithubBtnCompletionClosure()
        }
    }
    
}
