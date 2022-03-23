//
//  RegisterViewController.swift
//  NavigationViewController_tutorial
//
//  Created by YongchaeP on 2022/03/24.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var btnForSignIn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //상단 내비 바를 숨김처리
        self.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func onSignInViewControllerBtnClick(_ sender: UIButton) {
        print("RegisterViewController - onSignInViewControllerBtnClick() called")
        //내비게이션 뷰 컨트롤러를 팝하는 코드 추가
        self.navigationController?.popViewController(animated: true)
    }
    
}

