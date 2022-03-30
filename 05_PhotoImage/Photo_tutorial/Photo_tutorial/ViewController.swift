//
//  ViewController.swift
//  Photo_tutorial
//
//  Created by Klay on 2022/03/31.
//

import UIKit
import YPImagePicker

class ViewController: UIViewController, ProfileDelegate {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileChangeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //프로필 이미지 사진을 원형으로 만들기 위해서 프로필 이미지 크기의 절반 만큼 원형으로 만든다. 이렇게 설정하면 UIImageView의 크기가 커지던 작아지던 같은 비율로 원으로 생성된다.
        //self.profileImage.layer.cornerRadius = (profileImage.frame.width < profileImage.frame.height ? profileImage.frame.width : profileImage.frame.height) / 2
        self.profileChangeBtn.layer.cornerRadius = 10
        
        //버튼 클릭 시 액션 설정
        self.profileChangeBtn.addTarget(self, action: #selector(onProfileChangeBtnclicked), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    //1. 프로필 이미지 버튼 클릭시 액션 시작
    @objc fileprivate func onProfileChangeBtnclicked(){
        //2. 로그를 찍는다.
        print("ViewController - onProfileChangeBtnclicked() called")
        
        var config = YPImagePickerConfiguration()
        config.screens = [.library]
        
        let picker = YPImagePicker(configuration: config)
        picker.didFinishPicking { [self, unowned picker] items, _ in
            //4. 사진 선택 -> next -> next 시 로그가 찍힌다.$
            print("picker.didFinishipicking activated")
            if let photo = items.singlePhoto {
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                print(photo.modifiedImage) // Transformed image, can be nil
                print(photo.exifMeta) // Print exif meta data of original image.
                
                self.profileImage.image = photo.image
                self.profileImage.layer.cornerRadius = (self.profileImage.frame.width < self.profileImage.frame.height ? self.profileImage.frame.width : self.profileImage.frame.height) / 2
                
            }
            // 사진 선택 창 닫기
            picker.dismiss(animated: true, completion: nil)
            print("picker dismiss")
        }
        //3. 사진 선택 창 열기
        present(picker, animated: true, completion: nil)
        print("picker present activated")
    }
    //MARK: ProfileImageDelegate methods
    func ChangeProfile(){
        print("ChangProfile Delegate methods called()")
        
    }
    

}

