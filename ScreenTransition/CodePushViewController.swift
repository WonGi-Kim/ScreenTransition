//
//  CodePushViewController.swift
//  ScreenTransition
//
//  Created by 김원기 on 2022/07/30.
//

import UIKit

protocol SendDataDelegate1: AnyObject {
    func sendData1(name: String)
}

class CodePushViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    weak var delegate1: SendDataDelegate1?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //다운캐스팅을 통해 전달한 값을 표시하기 위한 코드
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit() // 라벨의 글씨가 잘리지 않게
        }
        
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.delegate1?.sendData1(name: "Heejin")
        self.navigationController?.popViewController(animated: true)
    }
    


}
