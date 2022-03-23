//
//  ViewController.swift
//  NiceApp
//
//  Created by 박용채 on 2022/03/22.
//

import UIKit
import Lottie

class MainViewController: UIViewController {

    let tileLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Main Screen"
        label.font = UIFont.boldSystemFont(ofSize: 70)
        return label
    }()
    
    //변수 선언 자료형은 AnimationView이고 자료형으로 선언/정의했기 때문에 리턴이 필수로 필요함
    let animationView: AnimationView = {
        //다운받은 json파일 명 입력
        let animView = AnimationView(name: "99752-day-n-night")
        animView.frame = CGRect(x:0,y:0,width: 400, height: 400)
        
        //크기에 맞도록 이미지를 확대하겠다.
        animView.contentMode = .scaleToFill
        
        return animView
    }()
    
    //뷰가 생성 되었을때
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //view.backgroundColor = .black
        view.addSubview(animationView)
        animationView.center = view.center
        
        //애니메이션 실행
            
        animationView.play{(finish) in
            //
            print("애니메이션 종료")
            self.view.addSubview(self.tileLabel)
            
            self.view.backgroundColor = .white
            self.animationView.removeFromSuperview()
            
            self.tileLabel.translatesAutoresizingMaskIntoConstraints = false
            self.tileLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.tileLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        }
        

    
    }


}

