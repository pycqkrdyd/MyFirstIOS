//
//  ViewController.swift
//  MyFirstiOS
//
//  Created by ParkYongchae on 2022/03/13.
//

import UIKit

class ViewController: UIViewController {

    //var는 변수 선언 제목이라는 변수를 선언하고 동시에 정의한다.
    var tileLabel: UILabel = {
        let label = UILabel()
        //label이라는 인스턴스를 생성하고 이 라벨은 UILabel로 정의된 객체니까 UILabel에 있는 여러 값들을 가져다 쓸 수 있다.(상속) 스토리보드에서 설정한 값들을 코드로 설정하는 단계로 보면 될 것 같다.
        
        label.text = "Hello World!"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.textColor = .white
        
        return label
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        //view 는 전체 그림 전체그림에서 제목을 집어 넣는다 라는 의미, 위에서 생성한 tilteLabel 변수를 넣는다.
        view.addSubview(tileLabel)
        //센터로 했던 오토사이즈 마스킹을 false로 한다..? 무슨 의미인지 스토리보드에서 비교 분석이 필요할듯
        tileLabel.translatesAutoresizingMaskIntoConstraints = false
        //X축 Y축을 센터로 맞추는데 equlTo는 부모의 값과 동일하게 가져간다는 의미
        tileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tileLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }


}

