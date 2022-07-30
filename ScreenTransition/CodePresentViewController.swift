//
//  CodePresentViewController.swift
//  ScreenTransition
//
//  Created by 김원기 on 2022/07/30.
//

import UIKit

//Delegate를 이용하여 데이터 전달
protocol SendDataDelegate2: AnyObject {
    func sendData2(name: String)
}

class CodePresentViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    weak var delegate2: SendDataDelegate2? //delegate 변수 앞에는 weak를 붙여야 한다
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //다운캐스팅을 통해 전달한 값을 표시하기 위한 코드
        if let name = name{
            self.nameLabel.text = name
            self.nameLabel.sizeToFit() // 라벨의 글씨가 잘리지 않게
        }

    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.delegate2?.sendData2(name: "WonGi")
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
