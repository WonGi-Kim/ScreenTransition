//
//  ViewController.swift
//  ScreenTransition
//
//  Created by 김원기 on 2022/07/30.
//

import UIKit

class ViewController: UIViewController, SendDataDelegate1, SendDataDelegate2 {

    //전환된 화면에서 viewcontroller로 데이터를 이전할 때 보여줄 라벨선언
    //Delegate 패턴을 이용하여 정보전달
    @IBOutlet weak var nameLabel1: UILabel!
    
    @IBOutlet weak var nameLabel2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //각 타입에 맞는 뷰컨트롤러 클래스로 다운캐스팅 하게 되면 각각의 컨트롤러에 정의한 name 프로퍼티에 접근할 수 있다.
    //as? ~~~
    @IBAction func codePushButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePushViewController") as? CodePushViewController else { return }
        viewController.name = "Heejin"
        viewController.delegate1 = self
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func codePresentButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePresentViewController") as? CodePresentViewController else { return }
        viewController.modalPresentationStyle = .fullScreen
        viewController.name = "WonGi"
        viewController.delegate2 = self //delegate 위임을 위해 viewcontroller에 senddatadelegate채택 후 senddata 정의
        self.present(viewController, animated: true, completion: nil)
    }
    
    func sendData1(name: String) {
        self.nameLabel1.text = name
        self.nameLabel1.sizeToFit()
    }
    
    func sendData2(name: String) {
        self.nameLabel2.text = name
        self.nameLabel2.sizeToFit()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? SeguePushViewController {
            viewController.name = "Heejin"
        }//전환하려는 뷰컨트롤러의 인스턴스를 가져올 수 있다.
    }
}

